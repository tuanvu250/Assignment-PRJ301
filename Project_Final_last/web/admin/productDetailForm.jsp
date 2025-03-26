<%-- 
    Document   : productDetailForm
    Created on : Mar 18, 2025, 9:12:54 AM
    Author     : ADMIN
--%>

<%@page import="dto.ProductColorDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductColorDAO"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/productDetailForm.css">    
    </head>
    <body>
        <%
            if (AuthUtils.checkIsAdmin(session)) {
                ProductColorDAO cldao = new ProductColorDAO();
                List<ProductColorDTO> colors = cldao.readAll();
                String currentID = session.getAttribute("currentID") != null ? (String) session.getAttribute("currentID") : "";
                String errorMessage = request.getAttribute("errorMessage") != null ? (String) request.getAttribute("errorMessage") : "";
        %>
        <div class="container">
            <div class="form-container">
                <h1>Add Product Details</h1>
                <form id="productDetailsForm" method="post" action="<%= request.getContextPath()%>/ProductController" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="addDetailCL_IMG">
                    <input type="hidden" name="id" value="<%=currentID%>">
                    <!-- Color Selection -->
                    <div class="form-group">
                        <label for="color">Color</label>
                        <select id="color" name="color" required>
                            <option value="" disabled selected>Select color</option>
                            <%
                                if (!colors.isEmpty()) {
                                    for (ProductColorDTO item : colors) {
                            %>
                            <option value="<%=item.getColor_id()%>" class="color-option">
                                <%=item.getColor_name()%> 
                            </option>
                            <%}
                                }%>
                        </select>
                    </div>

                    <!-- Image Uploads -->
                    <h2>Product Images</h2>
                    <div class="image-uploads">
                        <div class="image-upload" onclick="document.getElementById('image1').click()">
                            <input type="file" id="image1" name="image1" accept="image/*" style="display: none;" onchange="previewImage(this, 'preview1')" required>
                            <i class="fas fa-cloud-upload-alt"></i>
                            <p>Upload Image 1</p>
                            <img id="preview1" class="image-preview">
                        </div>
                        <div class="image-upload" onclick="document.getElementById('image2').click()">
                            <input type="file" id="image2" name="image2" accept="image/*" style="display: none;" onchange="previewImage(this, 'preview2')" required>
                            <i class="fas fa-cloud-upload-alt"></i>
                            <p>Upload Image 2</p>
                            <img id="preview2" class="image-preview">
                        </div>
                        <div class="image-upload" onclick="document.getElementById('image3').click()">
                            <input type="file" id="image3" name="image3" accept="image/*" style="display: none;" onchange="previewImage(this, 'preview3')" required>
                            <i class="fas fa-cloud-upload-alt"></i>
                            <p>Upload Image 3</p>
                            <img id="preview3" class="image-preview">
                        </div>
                        <div class="image-upload" onclick="document.getElementById('image4').click()">
                            <input type="file" id="image4" name="image4" accept="image/*" style="display: none;" onchange="previewImage(this, 'preview4')" equired>
                            <i class="fas fa-cloud-upload-alt"></i>
                            <p>Upload Image 4</p>
                            <img id="preview4" class="image-preview">
                        </div>
                    </div>
                    <%
                        if (!errorMessage.isEmpty()) {
                    %>
                    <p style="color: red"><%=errorMessage%></p>
                    <%
                        }
                    %>
                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">
                            <a href="<%= request.getContextPath()%>/ProductController?action=cancelDetail&id=<%=currentID%>"
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