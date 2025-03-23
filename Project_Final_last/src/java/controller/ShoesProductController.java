/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ShoesProductDAO;
import dto.ProductColorDTO;
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

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ShoesProductController", urlPatterns = {"/ShoesProductController"})
public class ShoesProductController extends HttpServlet {

    private static final String PRODUCT_PAGE = "/products/product.jsp";
    private ShoesProductDAO shoesDAO = new ShoesProductDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = PRODUCT_PAGE;
        try {
            String shoesId = request.getParameter("shoesId");
            String colorIndex = request.getParameter("colorIndex");
            int index = Integer.parseInt(colorIndex);
            List<ProductColorDTO> list = shoesDAO.colorOfShoes(shoesId);
            String colorId = list.get(index-1).getColor_id();
            request.setAttribute("colorId", colorId);
            request.setAttribute("shoesId", shoesId);
            request.setAttribute("colorIndex", colorIndex);
            url = "/products/productDetail.jsp";
                
            String currentURL = request.getRequestURL().toString() + "?" + request.getQueryString();
            request.getSession().setAttribute("previousPage", currentURL);
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
