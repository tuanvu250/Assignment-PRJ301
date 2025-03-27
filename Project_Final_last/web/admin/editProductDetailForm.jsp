<%@page import="dao.ShoesColorSizeDAO"%>
<%@page import="dto.ProductSizeDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductSizeDAO"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail Form</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/productDetailForm.css">    
        <style>
            .form-container {
                width: 50%;
                margin: auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                background-color: #f9f9f9;
            }
            .size-quantity-container {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                gap: 50px; /* Tăng khoảng cách giữa 2 cột */
                padding: 10px 0;
            }
            .column {
                width: 50%;
            }
            .column h3 {
                text-align: center;
                margin-bottom: 10px;
            }
            .form-group {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 45px;
                margin-bottom: 10px;
            }
            .size-box {
                width: 70px;
                height: 45px;
                display: flex;
                justify-content: center;
                align-items: center;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #ffffff;
                font-weight: bold;
                font-size: 18px;
                text-align: center;
            }
            .quantity-input {
                width: 100px;
                height: 45px;
                text-align: center;
                font-size: 16px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }
            .form-actions {
                text-align: center;
                margin-top: 20px;
            }
            .btn {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .btn-primary {
                background-color: #007bff;
                color: white;
            }
            .btn-secondary {
                background-color: #6c757d;
                color: white;
            }
        </style>
    </head>
    <body>
        <% if (AuthUtils.checkIsAdmin(session)) {
                ProductSizeDAO sizedao = new ProductSizeDAO();
                List<ProductSizeDTO> sizes = sizedao.readAll();
                ShoesColorSizeDAO scldao = new ShoesColorSizeDAO();
                String colorid = request.getAttribute("colorid") != null ? (String) request.getAttribute("colorid") : "";
                String shoesid = session.getAttribute("currentID") != null ? (String) session.getAttribute("currentID") : "";
                String updateFailed = request.getAttribute("updateFailed") != null ? (String) request.getAttribute("updateFailed") : "";
        %>
        <div class="container">
            <div class="form-container">
                <h1 style="text-align: center;">Add Product Details</h1>
                <%
                    if (!updateFailed.isEmpty()) {
                %>
                <p style="color: red"><%=updateFailed%></p>
                <%
                    }
                %>
                <form id="productDetailsForm" method="post" action="<%= request.getContextPath()%>/ProductController">
                    <input type="hidden" name="action" value="editSizeStock">
                    <input type="hidden" name="shoesid" value="<%=shoesid%>">
                    <input type="hidden" name="colorid" value="<%=colorid%>">
                    <div class="size-quantity-container">
                        <!-- Size Column -->
                        <div class="column">
                            <h3>Size</h3>
                            <% for (ProductSizeDTO item : sizes) {%>
                            <div class="form-group">
                                <div class="size-box"><%= item.getSize_num()%></div>
                            </div>
                            <% } %>
                        </div>
                        <!-- Quantity Column -->
                        <div class="column">
                            <h3>Quantity</h3>
                            <% for (ProductSizeDTO item : sizes) {%>
                            <div class="form-group">
                                <input type="hidden" name="size_id[]" value="<%= item.getSize_id()%>">
                                <input type="number" class="quantity-input" name="quantity[]" min="0" value="<%=scldao.getStock(shoesid, colorid, item.getSize_id())%>" required>
                            </div>
                            <% }%>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">
                            <a href="<%= request.getContextPath()%>/ProductController?action=cancelDetail&id=<%=shoesid%>"
                               style="color: black; text-decoration: none">Cancel</a></button>
                        <button type="submit" class="btn btn-primary">Save Details</button>
                    </div>
                </form>
            </div>
        </div>
        <% }%>
        <script src="<%= request.getContextPath()%>/assets/js/productDetailForm.js"></script>
    </body>
</html>
