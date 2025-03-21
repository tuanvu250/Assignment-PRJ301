/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.UserDTO;
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
 * @author Dell
 */
@WebServlet(name = "AccountController", urlPatterns = {"/AccountController"})
public class AccountController extends HttpServlet {

    private static final String HOME_PAGE = "/home/home.jsp";
    private static final String MANAGEUSER_PAGE = "/admin/manageUsers.jsp";
    private static final String ADMIN_PAGE = "/admin/dashboard.jsp";
    private static final String REGISTER_PAGE = "/user/register.jsp";
    private static UserDAO usdao = new UserDAO();

    protected String processViewAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEUSER_PAGE;
            List<UserDTO> accounts = usdao.readAll();
            request.setAttribute("accounts", accounts);
        }
        return url;
    }

    protected String processSearchAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEUSER_PAGE;
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            }
            List<UserDTO> accounts = usdao.readByUsNameTerm(searchTerm);
            request.setAttribute("accounts", accounts);
            request.setAttribute("searchTerm", searchTerm);
        }
        return url;
    }

    protected String processDeleteAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEUSER_PAGE;
            String accountId = request.getParameter("accountId");
            UserDTO us = usdao.readByUsName(accountId);
            if (us != null) {
                us.setStatus("INACTIVE");
                if (usdao.update(us)) {
                    request.setAttribute("deleteSuccess", "Delete Successfully!");
                } else {
                    request.setAttribute("deleteFail", "Delete Failed!");
                }
                processViewAccount(request, response);
            }
        }
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ADMIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = ADMIN_PAGE;
            } else {
                if (action.equals("manageAccount")) {
                    url = processViewAccount(request, response);
                } else if (action.equals("searchUser")) {
                    url = processSearchAccount(request, response);
                } else if (action.equals("delete")) {
                    url = processDeleteAccount(request, response);
                }
            }
        } catch (Exception e) {
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
