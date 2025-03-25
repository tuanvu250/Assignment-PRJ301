/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAO;
import dao.OrderDAO;
import dto.CartDTO;
import dto.OrderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Date;
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
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {
    protected static final String SUMMARY = "/payment/summaryPayment.jsp";
    protected static final String DETAIL = "/payment/orderDetail.jsp";
    protected static final OrderDAO orderDAO = new OrderDAO();
    protected static final CartDAO cartDAO = new CartDAO();


    protected String processAddOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = SUMMARY;
        HttpSession session = request.getSession();
        String username = AuthUtils.getUser(session).getUser_name();
        String fulName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");
        Date date_order = new Date(System.currentTimeMillis());
        BigDecimal subtotal = BigDecimal.valueOf(Double.parseDouble(request.getParameter("subtotal")));
        BigDecimal discount = BigDecimal.valueOf(Double.parseDouble(request.getParameter("discount")));
        BigDecimal totalPrice = BigDecimal.valueOf(Double.parseDouble(request.getParameter("totalPrice")));
        String id = orderDAO.autoCreateID();
        
        OrderDTO order = new OrderDTO(id, fulName, phone, email, date_order, "Pending", 
                address, paymentMethod, subtotal, discount, totalPrice, username);
        boolean check = orderDAO.create(order);
        request.setAttribute("order", order);
        List<CartDTO> listCart = (List<CartDTO>) session.getAttribute("listCart");
        session.removeAttribute("listCart");
        cartDAO.deleteAllCart(AuthUtils.getUser(session).getUser_name());
        for (CartDTO cart : listCart) {
            orderDAO.createOD(id, cart);
        }
        return url;
    }
    
    protected String processLookOrderDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = DETAIL;
        String orderId = request.getParameter("orderId");
        OrderDTO order = orderDAO.readById(orderId);
        request.setAttribute("order", order);
        List<CartDTO> listOD = orderDAO.readAllOderDetail(orderId);
        request.setAttribute("listOD", listOD);
        return url;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUMMARY;
        try {
            String action = request.getParameter("action");
            if (action != null) {
                if (action.equals("add")) {
                    url = processAddOrder(request, response);
                } else if(action.equals("orderDetail")) {
                    url = processLookOrderDetail(request, response);
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
