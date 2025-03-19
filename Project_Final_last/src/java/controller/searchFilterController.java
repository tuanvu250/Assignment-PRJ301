/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ShoesProductDAO;
import dto.ShoesProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.AuthUtils;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "searchFilterController", urlPatterns = {"/searchFilter"})
public class searchFilterController extends HttpServlet {

    private static final String PRODUCT_PAGE = "/products/product.jsp";
    private ShoesProductDAO shoesDAO = new ShoesProductDAO();

    public static String searchPriceMin(String priceMin) {
        if (priceMin == null) {
            return null;
        }
        switch (priceMin) {
            case "600k":
                return "600000";
            case "500k-599k":
                return "500000";
            case "400k-499k":
                return "400000";
            case "300k-399k":
                return "300000";
            case "300k":
                return "0";
            default:
                return null;
        }
    }

    public static String searchPriceMax(String priceMax) {
        if (priceMax == null) {
            return null;
        }
        switch (priceMax) {
            case "600k":
                return "9900000";
            case "500k-599k":
                return "599000";
            case "400k-499k":
                return "499000";
            case "300k-399k":
                return "399000";
            case "300k":
                return "299";
            default:
                return null;
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = PRODUCT_PAGE;
        try {
            String action = request.getParameter("action");
            response.setContentType("text/html;charset=UTF-8");
            String searchTerm = request.getParameter("searchTerm");
            String gender = request.getParameter("gender");
            String status = request.getParameter("status");
            String style = request.getParameter("style");
            String productLine = request.getParameter("productLine");
            String material = request.getParameter("material");
            String price = request.getParameter("price");
            String priceMin = searchPriceMin(price);
            String priceMax = searchPriceMax(price);
            String color = request.getParameter("color");

            List<ShoesProductDTO> total = shoesDAO.searchShoes2(searchTerm, gender, status, style, productLine, priceMin, priceMax, material, color);
            int page = 1;
            int pageSize = 9; // Số sản phẩm mỗi trang
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }

            List<ShoesProductDTO> list = shoesDAO.searchShoes(searchTerm, gender, status, style, productLine, priceMin, priceMax, material, color, page, pageSize);

            int totalProducts = total.size();
            int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
            System.out.println(totalProducts);
            System.out.println(totalPages);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("listShoesProduct", list);
        } catch (Exception e) {
            log("ERROR: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(PRODUCT_PAGE);
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
