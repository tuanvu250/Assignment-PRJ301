/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
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
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    public static final String LOGIN_PAGE = "login.jsp";
    public static final String HOME_PAGE = "home.jsp";
    public static UserDAO usDao = new UserDAO();
    protected String processClick(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (!AuthUtils.isLoggedIn(session)) {
            url = LOGIN_PAGE;
        }
        return url;
    }

    protected String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        String userName = request.getParameter("txtUserName");
        String password = request.getParameter("txtPassword");
        if (AuthUtils.isVeriryUser(userName, password)) {
            url = "home.jsp";
            request.getSession().setAttribute("user", AuthUtils.getUser(userName));
        } else {
            url = "login.jsp";
            request.setAttribute("loginMessage", "Incorrect UserName or Password!");
        }
        return url;
    }

    protected String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            url = HOME_PAGE;
            request.getSession().invalidate();
        }
        return url;
    }

    protected String processRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME_PAGE;
        HttpSession session = request.getSession();
        String usName = request.getParameter("registerUSName");
        String password = request.getParameter("registerPassword");
        String cfPassword = request.getParameter("registerCFPassword");
        String fullName = request.getParameter("registerFullName");
        String email = request.getParameter("registerEmail");
        int phone = Integer.parseInt(request.getParameter("registerPhone"));
        UserDTO newUser = new UserDTO(usName, password, fullName, email, phone, "user");
        usDao.createUser(newUser);
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action.equals("click")) {
                url = processClick(request, response);
            } else if (action.equals("login")) {
                url = processLogin(request, response);
            } else if (action.equals("logout")) {
                url = processLogout(request, response);
            } else if (action.equals("register")) {
                url = processRegister(request, response);
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
