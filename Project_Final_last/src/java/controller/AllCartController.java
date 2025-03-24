/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAO;
import dao.ShoesProductDAO;
import dto.CartDTO;
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
 * @author ADMIN
 */
@WebServlet(name = "AllCartController", urlPatterns = {"/AllCartController"})
public class AllCartController extends HttpServlet {

    private static final String PRODUCT_PAGE = "/products/product.jsp";
    private ShoesProductDAO shoesDAO = new ShoesProductDAO();
    private CartDAO cartDAO = new CartDAO();
    
    protected String processReadAllCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = "/favourite/favouriteList.jsp";

        if (AuthUtils.isLoggedIn(session)) {
            String username = request.getParameter("username");
            List<CartDTO> listCart = cartDAO.readAllByUserId(username);
            session.setAttribute("listCart", listCart);
            String currentURL = request.getRequestURL().toString() + "?" + request.getQueryString();
            request.getSession().setAttribute("previousPage", currentURL);
        }
        return url;
    }
    
    protected String processDeleteAllFav(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = "/favourite/favouriteList.jsp";

        if (AuthUtils.isLoggedIn(session)) {
            String username = request.getParameter("username");
            shoesDAO.deleteAllFav(username);
            session.setAttribute("listFav", null);
            String currentURL = request.getRequestURL().toString() + "?" + request.getQueryString();
            request.getSession().setAttribute("previousPage", currentURL);
        }
        return url;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = PRODUCT_PAGE;
        try {
            String action = request.getParameter("action");
            if (action != null) {
                if (action.equals("readAll")) {
                    url = processReadAllCart(request, response);
                } else if(action.equals("deleteAll")) {
                    url = processDeleteAllFav(request, response);
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
