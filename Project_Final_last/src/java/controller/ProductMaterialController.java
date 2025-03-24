/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductLineDAO;
import dao.ProductMaterialDAO;
import dto.ProductLineDTO;
import dto.ProductMaterialDTO;
import java.io.IOException;
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
@WebServlet(name = "ProductMaterialController", urlPatterns = {"/ProductMaterialController"})
public class ProductMaterialController extends HttpServlet {

    private static final String HOME = "/home/home.jsp";
    private static final String MANAGEMATE = "/admin/manageMaterial.jsp";
    private static final String MATERIALFORM = "/admin/materialForm.jsp";

    private final ProductMaterialDAO matdao = new ProductMaterialDAO();

    protected String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEMATE;
            String matTerm = request.getParameter("matTerm");
            if (matTerm == null) {
                matTerm = "";
            }
            List<ProductMaterialDTO> materials = matdao.searchTerm(matTerm);
            request.setAttribute("materials", materials);
            request.setAttribute("searchterm", matTerm);
        }
        return url;
    }

    protected String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            String productlineName = request.getParameter("materialName");
            if (productlineName != null && !productlineName.trim().isEmpty()) {
                if (matdao.add(productlineName)) {
                    url = MANAGEMATE;
                    processSearch(request, response);
                }
            } else {
                request.setAttribute("errorAddMAT", "This field is requried. Please input one value!");
                url = MATERIALFORM;
            }
        }
        return url;
    }

    protected String processEditPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MATERIALFORM;
            String id = request.getParameter("id");
            ProductMaterialDTO mate = matdao.readById(id);
            request.setAttribute("mateid", id);
            request.setAttribute("oldname", mate.getMat_name());
            request.setAttribute("action", "editMaterial");
        }
        return url;
    }

    protected String processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEMATE;
            String id = request.getParameter("mateid");
            String materialName = request.getParameter("productlineName");
            ProductMaterialDTO line = matdao.readById(id);
            line.setMat_name(materialName);
            matdao.update(line);
            processSearch(request, response);
        }
        return url;
    }

    protected String processCancel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEMATE;
            processSearch(request, response);
        }
        return url;
    }

    protected String processDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGEMATE;
            String id = request.getParameter("id");
            matdao.delete(id);
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
                if (action.equals("searchMAT")) {
                    url = processSearch(request, response);
                } else if (action.equals("manageMAT")) {
                    url = processSearch(request, response);
                } else if (action.equals("addMaterial")) {
                    url = processAdd(request, response);
                } else if (action.equals("editpage")) {
                    url = processEditPage(request, response);
                } else if (action.equals("editMaterial")) {
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
