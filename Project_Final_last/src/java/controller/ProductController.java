/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductColorDAO;
import dao.ProductSizeDAO;
import dao.ShoesColorSizeDAO;
import dao.ShoesImageDAO;
import dao.ShoesProductDAO;
import dto.ProductColorDTO;
import dto.ProductSizeDTO;
import dto.ShoesColorSizeDTO;
import dto.ShoesProductDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import utils.AuthUtils;

/**
 *
 * @author Dell
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
@WebServlet(name = "ProductController", urlPatterns = {"/ProductController"})
public class ProductController extends HttpServlet {
    
    private static final String HOME = "/home/home.jsp";
    private static final String MANAGE_PRODUCT = "/admin/manageProduct.jsp";
    private static final String PRODUCT_FORM = "/admin/productForm.jsp";
    private static final String PRODUCT_DETAIL = "/admin/manageProductDetail.jsp";
    private static final String PRODUCT_DETAIL_FORM = "/admin/productDetailForm.jsp";
    private static final String EDIT_PRODUCT_DETAIL_FORM = "/admin/editProductDetailForm.jsp";
    
    public ShoesProductDAO pdao = new ShoesProductDAO();
    public ShoesColorSizeDAO scldao = new ShoesColorSizeDAO();
    
    protected String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGE_PRODUCT;
            String nameTerm = request.getParameter("nameTerm");
            if (nameTerm == null) {
                nameTerm = "";
            }
            List<ShoesProductDTO> listShoes = pdao.searchShoesByName(nameTerm);
            request.setAttribute("listShoes", listShoes);
            request.setAttribute("searchterm", nameTerm);
        }
        return url;
    }
    
    protected String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        boolean isValid = true;
        
        if (AuthUtils.checkIsAdmin(session)) {
            try {
                String nameShoes = request.getParameter("nameShoes").trim();
                String produceDate = request.getParameter("produceDate");
                String priceStr = request.getParameter("price").trim();
                String quantityStr = request.getParameter("quantity").trim();
                String gender = request.getParameter("gender");
                String status = request.getParameter("status");
                String style = request.getParameter("style");
                String productLine = request.getParameter("productLine");
                String material = request.getParameter("material");
                String description = request.getParameter("description");
                String pdsale = request.getParameter("sale");
                
                LocalDate date = null;
                double price = 0;
                int quantity = 0;

                // Validate name
                if (nameShoes.isEmpty()) {
                    isValid = false;
                    request.setAttribute("errorShoesname", "This field is required. Please input one value!");
                }

                // Validate produce date
                try {
                    date = LocalDate.parse(produceDate);
                    if (date.isAfter(LocalDate.now())) {
                        isValid = false;
                        request.setAttribute("errorProduceDate", "Produce Date cannot be in the future!");
                    }
                } catch (DateTimeParseException e) {
                    isValid = false;
                    request.setAttribute("errorProduceDate", "Invalid date format!");
                }

                // Validate price
                try {
                    price = Double.parseDouble(priceStr);
                    if (price < 0) {
                        isValid = false;
                        request.setAttribute("errorPrice", "Price must be greater than 0!");
                    }
                } catch (NumberFormatException e) {
                    isValid = false;
                    request.setAttribute("errorPrice", "Please input a valid number!");
                }

                // Validate quantity
                try {
                    quantity = Integer.parseInt(quantityStr);
                    if (quantity < 0) {
                        isValid = false;
                        request.setAttribute("errorQuantity", "Quantity must be greater than 0!");
                    }
                } catch (NumberFormatException e) {
                    isValid = false;
                    request.setAttribute("errorQuantity", "Please input a valid number!");
                }
                
                ShoesProductDTO shoes = new ShoesProductDTO(
                        nameShoes, date, BigDecimal.valueOf(price),
                        quantity, gender, description,
                        status, style, productLine, material, pdsale);
                
                if (!isValid) {
                    url = PRODUCT_FORM;
                    request.setAttribute("shoes", shoes);
                } else {
                    if (pdao.create(shoes)) {
                        url = MANAGE_PRODUCT;
                        request.setAttribute("add_editSuccess", "Add new Shoes Product successfully!");
                        processSearch(request, response);
                    } else {
                        url = PRODUCT_FORM;
                        request.setAttribute("add_editFailed", "Add new Shoes Product failed!");
                    }
                }
            } catch (Exception e) {
                log("ERROR in processAdd: " + e.getMessage(), e);
                url = PRODUCT_FORM;
                request.setAttribute("add_editFailed", "An error occurred. Please try again!");
            }
        }
        return url;
    }
    
    protected String processCancel(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGE_PRODUCT;
            processSearch(request, response);
        }
        return url;
    }
    
    protected String processEditPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = PRODUCT_FORM;
            String id = request.getParameter("id");
            ShoesProductDTO shoes = pdao.readById(id);
            if (shoes != null) {
                request.setAttribute("productid", id);
                request.setAttribute("action", "editProduct");
                request.setAttribute("shoes", shoes);
            } else {
                url = MANAGE_PRODUCT;
                request.setAttribute("errorEditpage", "Shoes Product not found!");
            }
        }
        return url;
    }
    
    protected String processEdit(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        boolean isValid = true;
        
        if (AuthUtils.checkIsAdmin(session)) {
            try {
                String productid = request.getParameter("productid");
                String nameShoes = request.getParameter("nameShoes").trim();
                String produceDate = request.getParameter("produceDate");
                String priceStr = request.getParameter("price").trim();
                String quantityStr = request.getParameter("quantity").trim();
                String gender = request.getParameter("gender");
                String status = request.getParameter("status");
                String style = request.getParameter("style");
                String productLine = request.getParameter("productLine");
                String material = request.getParameter("material");
                String description = request.getParameter("description");
                String pdsale = request.getParameter("sale");
                
                LocalDate date = null;
                double price = 0;
                int quantity = 0;

                // Validate name
                if (nameShoes.isEmpty()) {
                    isValid = false;
                    request.setAttribute("errorShoesname", "This field is required. Please input one value!");
                }

                // Validate produce date
                try {
                    date = LocalDate.parse(produceDate);
                    if (date.isAfter(LocalDate.now())) {
                        isValid = false;
                        request.setAttribute("errorProduceDate", "Produce Date cannot be in the future!");
                    }
                } catch (DateTimeParseException e) {
                    isValid = false;
                    request.setAttribute("errorProduceDate", "Invalid date format!");
                }

                // Validate price
                try {
                    price = Double.parseDouble(priceStr);
                    if (price < 0) {
                        isValid = false;
                        request.setAttribute("errorPrice", "Price must be greater than 0!");
                    }
                } catch (NumberFormatException e) {
                    isValid = false;
                    request.setAttribute("errorPrice", "Please input a valid number!");
                }

                // Validate quantity
                try {
                    quantity = Integer.parseInt(quantityStr);
                    if (quantity < 0) {
                        isValid = false;
                        request.setAttribute("errorQuantity", "Quantity must be greater than 0!");
                    }
                } catch (NumberFormatException e) {
                    isValid = false;
                    request.setAttribute("errorQuantity", "Please input a valid number!");
                }
                
                ShoesProductDTO shoes = new ShoesProductDTO(
                        productid,
                        nameShoes, date, BigDecimal.valueOf(price),
                        quantity, gender, description,
                        status, style, productLine, material, pdsale);
                
                if (!isValid) {
                    url = PRODUCT_FORM;
                    request.setAttribute("shoes", shoes);
                    request.setAttribute("productid", productid);
                    request.setAttribute("action", "editProduct");
                } else {
                    if (pdao.update(shoes)) {
                        url = MANAGE_PRODUCT;
                        request.setAttribute("add_editSuccess", "Edit Shoes Product successfully!");
                        processSearch(request, response);
                    } else {
                        url = PRODUCT_FORM;
                        request.setAttribute("add_editFailed", "Edit Shoes Product failed!");
                    }
                }
            } catch (Exception e) {
                log("ERROR in processEdit: " + e.getMessage(), e);
                url = PRODUCT_FORM;
                request.setAttribute("add_editFailed", "An error occurred. Please try again!");
            }
        }
        return url;
    }
    
    protected String processDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = MANAGE_PRODUCT;
            String id = request.getParameter("id");
            if (pdao.delete(id)) {
                request.setAttribute("resultDelete", "Delete successfully!");
                processSearch(request, response);
            } else {
                request.setAttribute("resultDelete", "Delete failed!");
            }
        }
        return url;
    }
    
    protected String processViewDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = PRODUCT_DETAIL;
            String shoesid = request.getParameter("id");
            session.setAttribute("currentID", shoesid);
            ShoesProductDTO shoes = pdao.readById(shoesid);
            if (shoes != null) {
                List<ShoesColorSizeDTO> list = scldao.readAllByShoesID(shoesid);
                request.setAttribute("shoes", shoes);
                request.setAttribute("listSCS", list);
            } else {
                url = MANAGE_PRODUCT;
                request.setAttribute("errorEditpage", "Shoes Product not found!");
            }
        }
        return url;
    }
    
    protected String processDeleteDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = PRODUCT_DETAIL;
            String shoesid = request.getParameter("shoesid");
            String colorid = request.getParameter("colorid");
            ShoesProductDTO shoes = pdao.readById(shoesid);
            if (scldao.delete(shoesid, colorid)) {
                request.setAttribute("resultDelete", "Delete successfully!");
                List<ShoesColorSizeDTO> list = scldao.readAllByShoesID(shoesid);
                request.setAttribute("shoes", shoes);
                request.setAttribute("listSCS", list);
            } else {
                request.setAttribute("resultDelete", "Delete failed!");
            }
        }
        return url;
    }
    
    protected String processAddColorImg(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = MANAGE_PRODUCT;
        HttpSession session = request.getSession();
        boolean check = true;
        if (AuthUtils.checkIsAdmin(session)) {
            String shoesid = request.getParameter("id");
            String colorid = request.getParameter("color");
            try {
                ShoesColorSizeDAO scsDAO = new ShoesColorSizeDAO();
                ProductSizeDAO sizedao = new ProductSizeDAO();
                List<ProductSizeDTO> sizes = sizedao.readAll();
                System.out.println(sizes);
                // 1. Kiểm tra và thêm vào bảng SHOES_COLOR_SIZE nếu chưa tồn tại
                if (!sizes.isEmpty()) {
                    for (ProductSizeDTO item : sizes) {
                        boolean added = scsDAO.insertShoesColor(shoesid, colorid, item.getSize_id(), 0);
                        if (!added) {
                            check = false;
                            request.setAttribute("errorMessage", "Error adding size: " + item.getSize_id());
                            System.out.println(item.getSize_id());
                            break;
                        }
                    }
                } else {
                    check = false;
                    request.setAttribute("errorMessage", "No sizes available to add!");
                }
                // 2. Xử lý upload ảnh và lưu vào bảng SHOES_IMAGE nếu dữ liệu trước đó hợp lệ
                if (check) {
                    String uploadPath = request.getServletContext().getRealPath("/") + "assets/img/img-products/";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }
                    Part[] imageParts = {
                        request.getPart("image1"),
                        request.getPart("image2"),
                        request.getPart("image3"),
                        request.getPart("image4")
                    };
                    ShoesImageDAO imgDAO = new ShoesImageDAO();
                    int order = 1;
                    for (Part part : imageParts) {
                        if (part != null && part.getSize() > 0) {
                            String imageFileName = shoesid + "_" + colorid + "_" + order + ".jpg";
                            String imagePath = uploadPath + imageFileName;
                            part.write(imagePath);
                            boolean result = imgDAO.insertImage(shoesid, imageFileName, order);
                            if (!result) {
                                check = false;
                                request.setAttribute("errorMessage", "Error while adding image: " + imageFileName);
                                break;
                            }
                            order++;
                        }
                    }
                }
                // Xác định URL và thông báo cuối cùng
                if (check) {
                    url = PRODUCT_DETAIL;
                    request.setAttribute("successMessage", "Product details added successfully!");
                    processViewDetail(request, response);
                } else {
                    url = PRODUCT_DETAIL_FORM;
                }
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An unexpected error occurred while adding product details.");
            }
        }
        
        return url;
    }
    
    protected String processSizeStockPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (AuthUtils.checkIsAdmin(session)) {
            url = EDIT_PRODUCT_DETAIL_FORM;
            String shoesid = request.getParameter("shoesid");
            String colorid = request.getParameter("colorid");
            System.out.println(shoesid);
            System.out.println(colorid);
            if (shoesid != null && colorid != null) {
                request.setAttribute("shoesid", shoesid);
                request.setAttribute("colorid", colorid);
            }
        }
        return url;
    }
    
    protected String processEditSizeStock(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = HOME;
        HttpSession session = request.getSession();
        if (!AuthUtils.checkIsAdmin(session)) {
            return url;
        }
        String[] sizeIds = request.getParameterValues("size_id[]");
        String[] quantities = request.getParameterValues("quantity[]");
        String shoesid = request.getParameter("shoesid");
        String colorid = request.getParameter("colorid");
        System.out.println(shoesid);
        System.out.println(colorid);
        if (sizeIds == null || quantities == null || shoesid == null || colorid == null) {
            request.setAttribute("updateFailed", "Invalid input data!");
            return EDIT_PRODUCT_DETAIL_FORM;
        }
        
        boolean updateSuccess = true;
        
        for (int i = 0; i < sizeIds.length; i++) {
            try {
                String sizeId = sizeIds[i].trim();
                int quantity = Integer.parseInt(quantities[i].trim());
                
                if (!scldao.updateSizeStock(shoesid, colorid, sizeId, quantity)) {
                    updateSuccess = false;
                    break;
                }
            } catch (NumberFormatException e) {
                updateSuccess = false;
                request.setAttribute("updateFailed", "Invalid quantity format!");
                break;
            }
        }
        if (updateSuccess) {
            url = PRODUCT_DETAIL;
            request.setAttribute("updateSuccess", "Update Size and Quantity successfully!");
            List<ShoesColorSizeDTO> list = scldao.readAllByShoesID(shoesid);
            request.setAttribute("shoes", pdao.readById(shoesid));
            request.setAttribute("listSCS", list);
        } else {
            url = EDIT_PRODUCT_DETAIL_FORM;
            request.setAttribute("updateFailed", "Update failed! Please check your input.");
        }
        
        return url;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = HOME;
        try {
            String action = request.getParameter("action");
            System.out.println(action);
            if (action == null) {
                url = HOME;
            } else {
                if (action.equals("manageProduct")) {
                    url = processSearch(request, response);
                } else if (action.equals("searchTerm")) {
                    url = processSearch(request, response);
                } else if (action.equals("add")) {
                    url = processAdd(request, response);
                } else if (action.equals("cancel")) {
                    url = processCancel(request, response);
                } else if (action.equals("editPage")) {
                    url = processEditPage(request, response);
                } else if (action.equals("editProduct")) {
                    url = processEdit(request, response);
                } else if (action.equals("delete")) {
                    url = processDelete(request, response);
                } else if (action.equals("viewDetail")) {
                    url = processViewDetail(request, response);
                } else if (action.equals("cancelDetail")) {
                    url = processViewDetail(request, response);
                } else if (action.equals("addDetailCL_IMG")) {
                    url = processAddColorImg(request, response);
                } else if (action.equals("deleteDetail")) {
                    url = processDeleteDetail(request, response);
                } else if (action.equals("editSizeStockPage")) {
                    url = processSizeStockPage(request, response);
                } else if (action.equals("editSizeStock")) {
                    url = processEditSizeStock(request, response);
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
