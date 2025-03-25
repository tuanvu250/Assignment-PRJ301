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
        boolean check = true;
        if (AuthUtils.checkIsAdmin(session)) {
            String mateName = request.getParameter("materialName").trim();
            if (mateName != null && !mateName.trim().isEmpty()) {
                if (matdao.isMaterialNameExist(mateName)) {
                    check = false;
                    request.setAttribute("error_editAddMAT", "Material name " + mateName + " already exists!");
                }
            } else {
                check = false;
                request.setAttribute("error_editAddMAT", "This field is requried. Please input one value!");
            }
            if (!check) {
                url = MATERIALFORM;
                request.setAttribute("mateName", mateName);
            } else {
                if (matdao.add(mateName)) {
                    url = MANAGEMATE;
                    request.setAttribute("add_editSuccess", "Add new Material successfully!");
                    processSearch(request, response);
                } else {
                    url = MATERIALFORM;
                    request.setAttribute("add_editFailed", "Add new Material failed!");
                }
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
            if (mate != null) {
                request.setAttribute("mateid", id);
                request.setAttribute("oldname", mate.getMat_name());
                request.setAttribute("action", "editMaterial");
            } else {
                url = MANAGEMATE;
                request.setAttribute("errorEditpage", "Material not found!");
                processSearch(request, response);
            }

        }
        return url;
    }

    protected String processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        boolean check = true;
        if (AuthUtils.checkIsAdmin(session)) {
            String mateName = request.getParameter("materialName").trim();
            String mateid = request.getParameter("mateid");
            if (mateName != null && !mateName.trim().isEmpty()) {
                if (matdao.isMaterialNameExist(mateName)) {
                    check = false;
                    request.setAttribute("error_editAddMAT", "Material name " + mateName + " already exists!");
                }
            } else {
                check = false;
                request.setAttribute("error_editAddMAT", "This field is requried. Please input one value!");
            }
            if (!check) {
                url = MATERIALFORM;
                request.setAttribute("mateName", mateName);
                request.setAttribute("mateid", mateid);
                request.setAttribute("action", "editMaterial");
            } else {
                ProductMaterialDTO mate = new ProductMaterialDTO(mateid, mateName);
                if (matdao.update(mate)) {
                    url = MANAGEMATE;
                    request.setAttribute("add_editSuccess", "Edit Material successfully!");
                    processSearch(request, response);
                } else {
                    url = MATERIALFORM;
                    request.setAttribute("add_editFailed", " Edit Material failed!");
                }
            }
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
            if (matdao.delete(id)) {
                request.setAttribute("resultDelete", "Delete successfully!");
                processSearch(request, response);
            } else {
                request.setAttribute("resultDelete", "Delete failed!");
            }
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
