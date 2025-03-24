/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductMaterialDAO;
import dao.ProductStyleDAO;
import dto.ProductMaterialDTO;
import dto.ProductStyleDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ProductStyleController", urlPatterns = {"/ProductStyleController"})
public class ProductStyleController extends HttpServlet {

    private static final String HOME = "/home/home.jsp";
    private static final String MANAGESTYLE = "/admin/manageProductStyle.jsp";
    private static final String STYLEFORM = "/admin/styleForm.jsp";

    private final ProductStyleDAO stdao = new ProductStyleDAO();

    protected String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGESTYLE;
            String styleTerm = request.getParameter("styleTerm");
            if (styleTerm == null) {
                styleTerm = "";
            }
            List<ProductStyleDTO> styles = stdao.searchTerm(styleTerm);
            request.setAttribute("styles", styles);
            request.setAttribute("searchterm", styleTerm);
        }
        return url;
    }

    protected String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            String styleName = request.getParameter("materialName");
            if (styleName != null && !styleName.trim().isEmpty()) {
                if (stdao.add(styleName)) {
                    url = MANAGESTYLE;
                    processSearch(request, response);
                }
            } else {
                request.setAttribute("errorStyle", "This field is requried. Please input one value!");
                url = MANAGESTYLE;
            }
        }
        return url;
    }

    protected String processEditPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = STYLEFORM;
            String id = request.getParameter("id");
            ProductStyleDTO style = stdao.readById(id);
            request.setAttribute("styleid", id);
            request.setAttribute("oldname", style.getStyle_name());
            request.setAttribute("action", "editStyle");
        }
        return url;
    }

    protected String processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGESTYLE;
            String id = request.getParameter("styleid");
            String styleName = request.getParameter("styleName");
            ProductStyleDTO style = stdao.readById(id);
            style.setStyle_name(styleName);
            stdao.update(style);
            processSearch(request, response);
        }
        return url;
    }

    protected String processCancel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGESTYLE;
            processSearch(request, response);
        }
        return url;
    }

    protected String processDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGESTYLE;
            String id = request.getParameter("id");
            stdao.delete(id);
            processSearch(request, response);
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
                if (action.equals("searchStyle")) {
                    url = processSearch(request, response);
                } else if (action.equals("manageStyle")) {
                    url = processSearch(request, response);
                } else if (action.equals("addStyle")) {
                    url = processAdd(request, response);
                } else if (action.equals("editpage")) {
                    url = processEditPage(request, response);
                } else if (action.equals("editStyle")) {
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
