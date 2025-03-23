/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductLineDAO;
import dto.ProductLineDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
 * @author ADMIN
 */
@WebServlet(name = "ProductLineController", urlPatterns = {"/ProductLineController"})
public class ProductLineController extends HttpServlet {

    private static final String HOME = "/home/home.jsp";
    private static final String MANAGEPDL = "/admin/manageProductLine.jsp";
    private static final String PRODUCTLINE = "/admin/productLine.jsp";

    private final ProductLineDAO lineDAO = new ProductLineDAO();

    protected String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEPDL;
            String pdlTerm = request.getParameter("pdlTerm");
            if (pdlTerm == null) {
                pdlTerm = "";
            }
            List<ProductLineDTO> list = lineDAO.searchTerm(pdlTerm);
            request.setAttribute("list", list);
            request.setAttribute("searchterm", pdlTerm);
        }
        return url;
    }

    protected String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            String productlineName = request.getParameter("productlineName");
            if (productlineName != null && !productlineName.trim().isEmpty()) {
                if (lineDAO.add(productlineName)) {
                    url = MANAGEPDL;
                    processSearch(request, response);
                }
            } else {
                request.setAttribute("errorAddPDL", "This field is requried. Please input one value!");
                url = PRODUCTLINE;
            }
        }
        return url;
    }

    protected String processEditPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = PRODUCTLINE;
            String id = request.getParameter("id");
            ProductLineDTO line = lineDAO.readById(id);
            request.setAttribute("pdlId", id);
            request.setAttribute("oldname", line.getLine_name());
            request.setAttribute("action", "editProductLine");
        }
        return url;
    }

    protected String processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEPDL;
            String id = request.getParameter("pdlid");
            String productlineName = request.getParameter("productlineName");
            ProductLineDTO line = lineDAO.readById(id);
            line.setLine_name(productlineName);
            lineDAO.update(line);
            processSearch(request, response);
        }
        return url;
    }

    protected String processCancel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEPDL;
            processSearch(request, response);
        }
        return url;
    }

    protected String processDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEPDL;
            String id = request.getParameter("id");
            lineDAO.delete(id);
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
                if (action.equals("searchPDL")) {
                    url = processSearch(request, response);
                } else if (action.equals("managePDL")) {
                    url = processSearch(request, response);
                } else if (action.equals("addProductLine")) {
                    url = processAdd(request, response);
                } else if (action.equals("editpage")) {
                    url = processEditPage(request, response);
                } else if (action.equals("editProductLine")) {
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
