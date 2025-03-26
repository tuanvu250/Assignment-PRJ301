<%-- 
    Document   : productForm
    Created on : Mar 18, 2025, 9:10:42 AM
    Author     : ADMIN
--%>

<%@page import="dto.ShoesProductDTO"%>
<%@page import="dto.SaleDTO"%>
<%@page import="dao.SaleDAO"%>
<%@page import="dto.ProductMaterialDTO"%>
<%@page import="dao.ProductMaterialDAO"%>
<%@page import="dto.ProductLineDTO"%>
<%@page import="dao.ProductLineDAO"%>
<%@page import="java.util.List"%>
<%@page import="dto.ProductStyleDTO"%>
<%@page import="dao.ProductStyleDAO"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/productForm.css">    

    </head>
    <body>
        <%
            if (AuthUtils.checkIsAdmin(session)) {
                String action = request.getAttribute("action") != null ? (String) request.getAttribute("action") : "add";
                ShoesProductDTO shoes = new ShoesProductDTO();
                if (request.getAttribute("shoes") != null) {
                    shoes = (ShoesProductDTO) request.getAttribute("shoes");
                }
                String errorShoesname = request.getAttribute("errorShoesname") != null ? (String) request.getAttribute("errorShoesname") : "";
                String errorProduceDate = request.getAttribute("errorProduceDate") != null ? (String) request.getAttribute("errorProduceDate") : "";
                String errorPrice = request.getAttribute("errorPrice") != null ? (String) request.getAttribute("errorPrice") : "";
                String errorQuantity = request.getAttribute("errorQuantity") != null ? (String) request.getAttribute("errorQuantity") : "";
                String add_editFailed = request.getAttribute("add_editFailed") != null ? (String) request.getAttribute("add_editFailed") : "";
        %>
        <div class="container">
            <div class="form-container">
                <%
                    if (action.equals("add")) {
                %>
                <h1>Add New Product</h1>
                <%
                } else {
                %>
                <h1>Edit Product</h1>
                <%
                    }
                    if (!add_editFailed.isEmpty()) {
                %>
                <p style="color: red"><%=add_editFailed%></p>
                <%
                    }
                %>
                <form id="productForm" method="post" action="<%= request.getContextPath()%>/ProductController">
                    <input type="hidden" name="action" value="<%=action%>">
                    <%if (request.getAttribute("productid") != null) {
                    %>
                    <input type="hidden" name="productid" value="<%=(String) request.getAttribute("productid")%>">
                    <%
                        }%>
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Product Name</label>
                                <input type="text" id="name" name="nameShoes" value="<%=shoes.getShoes_name()%>" required>
                            </div>
                            <%
                                if (!errorShoesname.isEmpty()) {
                            %>
                            <p style="color: red"><%=errorShoesname%></p>
                            <%
                                }
                            %>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="produceDate">Produce Date</label>
                                <input type="date" id="produceDate" name="produceDate" value="<%=shoes.getProduce_date()%>" required>
                            </div>
                            <%
                                if (!errorProduceDate.isEmpty()) {
                            %>
                            <p style="color: red"><%=errorProduceDate%></p>
                            <%
                                }
                            %>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" id="price" name="price" step="0.01" value="<%=shoes.getPrice()%>" required>
                            </div>
                            <%
                                if (!errorPrice.isEmpty()) {
                            %>
                            <p style="color: red"><%=errorPrice%></p>
                            <%
                                }
                            %>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="quantity">Quantity</label>
                                <input type="number" id="quantity" name="quantity" value="<%=shoes.getQuantity()%>" required>
                            </div>
                            <%
                                if (!errorQuantity.isEmpty()) {
                            %>
                            <p style="color: red"><%=errorQuantity%></p>
                            <%
                                }
                            %>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <select id="gender" name="gender" required>
                                    <option value="" disabled selected>Select gender</option>
                                    <option value="Male" <%= "Male".equals(shoes.getGender()) ? "selected" : ""%>>Male</option>
                                    <option value="Female" <%= "Female".equals(shoes.getGender()) ? "selected" : ""%>>Female</option>
                                    <option value="Unisex" <%= "Unisex".equals(shoes.getGender()) ? "selected" : ""%>>Unisex</option>
                                </select>
                            </div>
                        </div>    
                        <div class="form-col">
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select id="status" name="status" required>
                                    <option value="" disabled selected>Select status</option>
                                    <option value="Soldout" <%= "Soldout".equals(shoes.getStatus()) ? "selected" : ""%>>Soldout</option>
                                    <option value="Sale" <%= "Sale".equals(shoes.getStatus()) ? "selected" : ""%>>Sale</option>
                                    <option value="Available" <%= "Available".equals(shoes.getStatus()) ? "selected" : ""%>>Available</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <%
                                    ProductStyleDAO stydao = new ProductStyleDAO();
                                    List<ProductStyleDTO> styles = stydao.readAll();
                                %>
                                <label for="style">Style</label>
                                <select id="style" name="style" required>
                                    <option value="" disabled selected>Select style</option>
                                    <%
                                        for (ProductStyleDTO item : styles) {
                                    %>
                                    <option value="<%= item.getStyle_id()%>" <%= item.getStyle_id().equals(shoes.getStyle_id()) ? "selected" : ""%>>
                                        <%= item.getStyle_name()%>
                                    </option>

                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <%
                                    ProductLineDAO lineDAO = new ProductLineDAO();
                                    List<ProductLineDTO> lines = lineDAO.readAll();
                                %>
                                <label for="productLine">Product Line</label>
                                <select id="productLine" name="productLine" required>
                                    <option value="" disabled selected>Select product line</option>
                                    <%
                                        for (ProductLineDTO item : lines) {
                                    %>
                                    <option value="<%= item.getLine_id()%>" <%= item.getLine_id().equals(shoes.getLine_id()) ? "selected" : ""%>>
                                        <%= item.getLine_name()%>
                                    </option>
                                    <%
                                        }
                                    %>                 
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <%
                                    ProductMaterialDAO matdao = new ProductMaterialDAO();
                                    List<ProductMaterialDTO> maters = matdao.readAll();
                                %>
                                <label for="material">Material</label>
                                <select id="material" name="material" required>
                                    <option value="" disabled selected>Select material</option>
                                    <%
                                        for (ProductMaterialDTO item : maters) {
                                    %>
                                    <option value="<%= item.getMat_id()%>" <%= item.getMat_id().equals(shoes.getMat_id()) ? "selected" : ""%>>
                                        <%= item.getMat_name()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <%
                                    SaleDAO salDao = new SaleDAO();
                                    List<SaleDTO> sales = salDao.readAll();
                                %>
                                <label for="pdsale">Sale</label>
                                <select id="pdsale" name="sale" required>
                                    <option value="" disabled selected>Select Sale value</option>
                                    <%
                                        for (SaleDTO item : sales) {
                                    %>
                                    <option value="<%= item.getSale_id()%>" <%= item.getSale_id().equals(shoes.getSale_id()) ? "selected" : ""%>>
                                        <%= item.getSale_num()%>
                                    </option>
                                    <%
                                        }
                                    %>                 
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description"><%=shoes.getDescription()%></textarea>
                    </div>

                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary"><a href="<%= request.getContextPath()%>/ProductController?action=cancel" style="color: black; text-decoration: none">Cancel</a></button>
                        <%
                            if (action.equals("add")) {
                        %>
                        <button type="submit" class="btn btn-primary">Add Product</button>
                        <%
                        } else {
                        %>
                        <button type="submit" class="btn btn-primary">Edit Product</button>
                        <%
                            }
                        %>
                    </div>
                </form>
            </div>
        </div>
        <%
            }
        %>
    </body>
</html>
