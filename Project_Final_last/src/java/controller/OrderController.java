/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAO;
import dao.OrderDAO;
import dao.ShoesProductDAO;
import dao.VoucherDAO;
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
    protected static final String ADMIN_DETAIL = "/admin/manageOrderDetail.jsp";
    protected static final String EDIT_DETAIL = "/admin/editOrderDetail.jsp";
    protected static final String MANAGE = "/admin/manageOrders.jsp";
    protected static final String PROFILE = "/user/profile.jsp";
    protected static final ShoesProductDAO shoesDAO = new ShoesProductDAO();
    protected static final OrderDAO orderDAO = new OrderDAO();
    protected static final CartDAO cartDAO = new CartDAO();
    protected static final VoucherDAO vouDAO = new VoucherDAO();

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
        String discountCode = (String) session.getAttribute("discountCode");
        session.removeAttribute("discountCode");
        vouDAO.applyVoucher(discountCode);
        OrderDTO order = new OrderDTO(id, fulName, phone, email, date_order, "Pending",
                address, paymentMethod, subtotal, discount, totalPrice, username);
        boolean check = orderDAO.create(order);
        request.setAttribute("order", order);
        List<CartDTO> listCart = (List<CartDTO>) session.getAttribute("listCart");
        session.removeAttribute("listCart");
        cartDAO.deleteAllCart(AuthUtils.getUser(session).getUser_name());
        for (CartDTO cart : listCart) {
            shoesDAO.updateStock(cart.getShoes_id(), cart.getColor_id(), cart.getSize_id(), cart.getQuantity());
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

    protected String processAdminOrderDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ADMIN_DETAIL;
        String orderId = request.getParameter("orderId");
        OrderDTO order = orderDAO.readById(orderId);
        request.setAttribute("order", order);
        List<CartDTO> listOD = orderDAO.readAllOderDetail(orderId);
        request.setAttribute("listOD", listOD);
        return url;
    }

    protected String processEditOrderDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = EDIT_DETAIL;
        String orderId = request.getParameter("orderId");
        OrderDTO order = orderDAO.readById(orderId);
        request.setAttribute("order", order);
        List<CartDTO> listOD = orderDAO.readAllOderDetail(orderId);
        request.setAttribute("listOD", listOD);
        return url;
    }

    protected String processManageOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGE;
        processSearchOrders(request, response);
        return url;
    }

    protected String processSearchOrders(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGE;
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null || searchTerm.trim().isEmpty()) {
            searchTerm = "";
            request.setAttribute("searchTerm", searchTerm);
        }
        List<OrderDTO> listOrder = orderDAO.searchByOrderIdOrUsername(searchTerm);
        request.setAttribute("searchTerm", searchTerm);
        request.setAttribute("listOrder", listOrder);
        return url;
    }

    protected String processUpdateStatus(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGE;
        String newStatus = request.getParameter("newStatus");
        String orderId = request.getParameter("orderId");
        boolean check = orderDAO.updateOrderStatus(orderId, newStatus);
        if(check) {
            request.setAttribute("successStatus", "Update status successful");
        } else {
            request.setAttribute("errorStatus", "Update status fail");
        }
        processSearchOrders(request, response);
        return url;
    }

    protected String processUpdateDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGE;
        String fulName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String status = request.getParameter("status");
        String paymentMethod = request.getParameter("paymentMethod");
        String orderId = request.getParameter("orderId");
        boolean check = orderDAO.updateDetail(fulName, phone, email, paymentMethod, address, status, orderId);
        request.setAttribute("checkUpdate", check);
        processSearchOrders(request, response);
        return url;
    }

    protected String processCanceledOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = PROFILE;
        String orderId = request.getParameter("orderId");
        boolean check = orderDAO.updateOrderStatus(orderId, "Cancelled");
        if(check) {
            request.setAttribute("successCancel", "Canceled order successful");
        } else {
            request.setAttribute("errorCancel", "Canceled order fail");
        }
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
                } else if (action.equals("orderDetail")) {
                    url = processLookOrderDetail(request, response);
                } else if (action.equals("manageOrders")) {
                    url = processManageOrders(request, response);
                } else if (action.equals("searchOrders")) {
                    url = processSearchOrders(request, response);
                } else if (action.equals("updateStatus")) {
                    url = processUpdateStatus(request, response);
                } else if (action.equals("adminOrderDetail")) {
                    url = processAdminOrderDetail(request, response);
                } else if (action.equals("editOrderDetail")) {
                    url = processEditOrderDetail(request, response);
                } else if (action.equals("updateDetail")) {
                    url = processUpdateDetail(request, response);
                } else if (action.equals("canceled")) {
                    url = processCanceledOrder(request, response);
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
