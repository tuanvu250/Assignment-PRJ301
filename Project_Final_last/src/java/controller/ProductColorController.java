/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductColorDAO;
import dto.ProductColorDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ProductColorController", urlPatterns = {"/ProductColorController"})
public class ProductColorController extends HttpServlet {

    private static final String HOME = "/home/home.jsp";
    private static final String MANAGECOLOR = "/admin/manageProductColor.jsp";
    private static final String COLORFORM = "/admin/colorForm.jsp";

    private final ProductColorDAO colordao = new ProductColorDAO();

    protected String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGECOLOR;
            String colorTerm = request.getParameter("colorTerm");
            if (colorTerm == null) {
                colorTerm = "";
            }
            List<ProductColorDTO> colors = colordao.searchTerm(colorTerm);
            request.setAttribute("colors", colors);
            request.setAttribute("searchterm", colorTerm);
        }
        return url;
    }

    protected String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            String colorName = request.getParameter("colorName");
            String colorCode = request.getParameter("colorCode");
            boolean checkColor = true;
            if (colorName == null || colorName.trim().isEmpty()) {
                checkColor = false;
                request.setAttribute("errorColorName", "This is required. Please input one value!");
            }
            if (colorCode == null || colorCode.trim().isEmpty()) {
                checkColor = false;
                request.setAttribute("errorColorCode", "This is required. Please input one value!");
            }
            if (!colorCode.matches("^#[0-9A-Fa-f]+$")) {
                checkColor = false;
                request.setAttribute("errorColorCode", "Invalid format. Color code must start with '#'.");
            }
            ProductColorDTO color = new ProductColorDTO(colorName, colorCode);
            if (!checkColor) {
                url = COLORFORM;
                request.setAttribute("color", color);
            } else {
                if (colordao.create(color)) {
                    url = MANAGECOLOR;
                    request.setAttribute("add_editSuccess", "Add new Color successfully!");
                    processSearch(request, response);
                } else {
                    url = COLORFORM;
                    request.setAttribute("add_editFailed", "Create new Color Failed!");
                }
            }
        }
        return url;
    }

    protected String processEditPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = COLORFORM;
            String id = request.getParameter("id");
            ProductColorDTO color = colordao.readById(id);
            if (color != null) {
                request.setAttribute("colorid", id);
                request.setAttribute("oldname", color.getColor_name());
                request.setAttribute("oldcode", color.getColor_code());
                request.setAttribute("action", "editColor");
            } else {
                url = MANAGECOLOR;
                request.setAttribute("errorEditpage", "Color not found!");
            }
        }
        return url;
    }

    protected String processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            String colorid = request.getParameter("colorid");
            String colorName = request.getParameter("colorName");
            String colorCode = request.getParameter("colorCode");
            boolean checkColor = true;
            if (colorName == null || colorName.trim().isEmpty()) {
                checkColor = false;
                request.setAttribute("errorColorName", "This is required. Please input one value!");
            }
            if (colorCode == null || colorCode.trim().isEmpty()) {
                checkColor = false;
                request.setAttribute("errorColorCode", "This is required. Please input one value!");
            }
            if (!colorCode.matches("^#[0-9A-Fa-f]+$")) {
                checkColor = false;
                request.setAttribute("errorColorCode", "Invalid format. Color code must start with '#'.");
            }
            ProductColorDTO color = new ProductColorDTO(colorid, colorName, colorCode);
            if (!checkColor) {
                url = COLORFORM;
                request.setAttribute("color", color);
                request.setAttribute("action", "editColor");
                request.setAttribute("colorid", colorid);
            } else {
                if (colordao.update(color)) {
                    url = MANAGECOLOR;
                    request.setAttribute("add_editSuccess", "Edit Color successfully!");
                    processSearch(request, response);

                } else {
                    url = COLORFORM;
                    request.setAttribute("add_editFailed", "Edit Color Failed!");
                }
            }
        }
        return url;
    }

    protected String processCancel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGECOLOR;
            processSearch(request, response);
        }
        return url;
    }

    protected String processDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGECOLOR;
            String id = request.getParameter("id");
            if (colordao.delete(id)) {
                request.setAttribute("resultDelete", "Delete successfully!");
                processSearch(request, response);
            } else {
                request.setAttribute("resultDelete", "Delete failed!");
            }
        }
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = HOME;
            } else {
                if (action.equals("searchColor")) {
                    url = processSearch(request, response);
                } else if (action.equals("manageColor")) {
                    url = processSearch(request, response);
                } else if (action.equals("addColor")) {
                    url = processAdd(request, response);
                } else if (action.equals("editpage")) {
                    url = processEditPage(request, response);
                } else if (action.equals("editColor")) {
                    url = processEdit(request, response);
                } else if (action.equals("cancel")) {
                    url = processCancel(request, response);
                } else if (action.equals("delete")) {
                    url = processDelete(request, response);
                }
            }
        } catch (Exception e) {
            log("ERROR: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
