/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.VoucherDAO;
import dto.VoucherDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "VoucherController", urlPatterns = {"/VoucherController"})
public class VoucherController extends HttpServlet {

    protected static final String MANAGE = "/admin/manageVoucher.jsp";
    protected static final String FORM = "/admin/voucherForm.jsp";
    protected static final VoucherDAO vDAO = new VoucherDAO();

    protected String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGE;
        String searchTerm = request.getParameter("searchTerm");
        
        if(searchTerm == null || searchTerm.trim().isEmpty()) {
            searchTerm = "";
            request.setAttribute("searchTerm", searchTerm);
        }
        request.setAttribute("searchTerm", searchTerm);
        List<VoucherDTO> listVou = vDAO.searchByCode(searchTerm);
        request.setAttribute("listVou", listVou);
        
        return url;
    }
    
    protected String processManage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGE;
        
        processSearch(request, response);
        return url;
    }
    
    protected String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = FORM;
        return url;
    }
    
    protected String processCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGE;
        String id = vDAO.autoCreateID();
        String code = request.getParameter("code");
        double discount = Double.parseDouble(request.getParameter("discount"))/100;
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        String status = request.getParameter("status");
        VoucherDTO voucher = new VoucherDTO(id, code, discount, quantity, startDate, endDate, status);
        boolean check = vDAO.create(voucher);
        if(!check) {
            request.setAttribute("error_editAdd", "Create new voucher failed");
            url = FORM;
        } else {
            request.setAttribute("successAdd", "Create new voucher successful");
            processSearch(request, response);
        }
        return url;
    }
    
    protected String processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = FORM;
        String voucherId = request.getParameter("voucherId");
        request.setAttribute("voucherId", voucherId);
        return url;
    }
    
    protected String processUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGE;
        String voucherId = request.getParameter("voucherId");
        String code = request.getParameter("code");
        double discount = Double.parseDouble(request.getParameter("discount"))/100;
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        String status = request.getParameter("status");
        VoucherDTO voucher = new VoucherDTO(voucherId, code, discount, quantity, startDate, endDate, status);
        boolean check = vDAO.update(voucher);
        if(!check) {
            request.setAttribute("add_editFailed", "Update voucher failed");
            url = FORM;
        } else {
            request.setAttribute("successEdit", "Update voucher successful");
            processSearch(request, response);
        }
        return url;
    }
    
    protected String processDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGE;
        String voucherId = request.getParameter("voucherId");
        boolean check = vDAO.delete(voucherId);
        if(!check) {
            request.setAttribute("errorDelete", "Delete voucher failed");
        } else {
            request.setAttribute("successDelete", "Delete voucher successful");
        }
        processSearch(request, response);
        return url;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = MANAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = MANAGE;
            } else {
                if (action.equals("searchVoucher")) {
                    url = processSearch(request, response);
                } else if (action.equals("manageVoucher")) {
                    url = processManage(request, response);
                } else if (action.equals("addVoucher")) {
                    url = processAdd(request, response);
                } else if (action.equals("editVoucher")) {
                    url = processEdit(request, response);
                } else if (action.equals("createVoucher")) {
                    url = processCreate(request, response);
                } else if (action.equals("updateVoucher")) {
                    url = processUpdate(request, response);
                } else if(action.equals("deleteVoucher")) {
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
