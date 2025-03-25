/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAO;
import dao.ShoesProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    private static final String PRODUCT_PAGE = "/products/product.jsp";
    private ShoesProductDAO shoesDAO = new ShoesProductDAO();
    private CartDAO cartDAO = new CartDAO();

    protected String processAddCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = (String) session.getAttribute("previousPage");
        if (AuthUtils.isLoggedIn(session)) {
            
            String username = request.getParameter("username");
            String shoesId = request.getParameter("shoesId");
            String colorId = request.getParameter("colorId");
            String sizeId = request.getParameter("sizeId");
            String quantity = request.getParameter("quantity");

            BigDecimal price  = shoesDAO.readById(shoesId).getPrice();
            if (!sizeId.trim().isEmpty() && !quantity.trim().isEmpty()) {
                boolean check = cartDAO.addToCart(username, shoesId, colorId, sizeId, Integer.parseInt(quantity), price);
            } else {
                session.setAttribute("shoesId", shoesId);
                session.setAttribute("errorCart", "Please choose size and quantity.");
            }
        }
        return url;
    }

    protected String processDeleteCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = (String) session.getAttribute("previousPage");
        if (AuthUtils.isLoggedIn(session)) {
            String username = request.getParameter("username");
            String shoesId = request.getParameter("shoesId");
            String colorId = request.getParameter("colorId");
            String sizeId = request.getParameter("sizeId");
            cartDAO.deleteCart(username, shoesId, colorId, sizeId);
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
                if (action.equals("add")) {
                    url = processAddCart(request, response);
                } else if (action.equals("delete")) {
                    url = processDeleteCart(request, response);
                }
            }
        } catch (Exception e) {
            log("ERROR: " + e.toString());
        } finally {
//            RequestDispatcher rd = request.getRequestDispatcher(url);
//            rd.forward(request, response);
            response.sendRedirect(url);
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
