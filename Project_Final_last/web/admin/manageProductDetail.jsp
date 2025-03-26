<%-- 
    Document   : manageProductDetail
    Created on : Mar 18, 2025, 9:01:56 AM
    Author     : ADMIN
--%>

<%@page import="dto.ShoesColorSizeDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductColorDAO"%>
<%@page import="dao.ShoesColorSizeDAO"%>
<%@page import="dto.ShoesProductDTO"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/manageProductDetail.css">    
    </head>
    <body>
        <%
            if (AuthUtils.checkIsAdmin(session)) {
                ShoesProductDTO shoes = new ShoesProductDTO();
                ProductColorDAO cldao = new ProductColorDAO();
                if (request.getAttribute("shoes") != null) {
                    shoes = (ShoesProductDTO) request.getAttribute("shoes");
                }
                List<ShoesColorSizeDTO> list = (List<ShoesColorSizeDTO>) request.getAttribute("listSCS");
                String successMessage = request.getAttribute("successMessage") != null ? (String) request.getAttribute("successMessage") : "";
                String resultDelete = request.getAttribute("resultDelete") != null ? (String) request.getAttribute("resultDelete") : "";
                String updateSuccess = request.getAttribute("updateSuccess") != null ? (String) request.getAttribute("updateSuccess") : "";
        %>


        <div class="page-container" >
            <%@include file="../includes/sidebar.jsp" %>
            <div class="container">
                <div class="header">
                    <h1>Product Detail</h1>
                    <a href="<%= request.getContextPath()%>/ProductController?action=cancel" class="back-link">
                        <i class="fas fa-arrow-left"></i> Back to Manage Products
                    </a>
                </div>
                <%
                    if (!successMessage.isEmpty()) {
                %>
                <p style="color: green"><%=successMessage%></p>
                <%
                    }
                    if (!resultDelete.isEmpty()) {
                %>
                <p style="color: red"><%=resultDelete%></p>
                <%
                    }
                    if (!updateSuccess.isEmpty()) {
                %>
                <p style="color: green"><%=updateSuccess%></p>
                <%
                    }
                %>
                <div class="product-info">
                    <div class="info-row">
                        <div class="info-label">Product ID:</div>
                        <div class="info-value"><%=shoes.getShoes_id()%></div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Name:</div>
                        <div class="info-value"><%=shoes.getShoes_name()%></div>
                    </div>
                </div>
                <%
                    if (list != null && !list.isEmpty()) {
                %>
                <table class="product-table">
                    <thead>
                        <tr>
                            <th>Color</th>
                            <th>Images</th>
                            <th><div class="action-buttons">
                                    <a href="<%= request.getContextPath()%>/admin/productDetailForm.jsp" 
                                       class="row-action add-button">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </div></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (ShoesColorSizeDTO item : list) {
                        %>
                        <tr>
                            <td class="color-cell">
                                <div class="color-indicator" style="background-color: <%=cldao.readById(item.getColorid()).getColor_code()%>;"></div>
                                <span><%=cldao.readById(item.getColorid()).getColor_name()%></span>
                            </td>
                            <td>
                                <div class="images-grid">
                                    <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=item.getColorid()%>_1.jpg"
                                         class="product-image">
                                    <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=item.getColorid()%>_2.jpg"
                                         class="product-image">
                                    <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=item.getColorid()%>_3.jpg"
                                         class="product-image">
                                    <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=item.getColorid()%>_4.jpg"
                                         class="product-image">
                                </div>
                            </td>
                            <td>
                                <div class="row-actions">
                                    <a href="<%= request.getContextPath()%>/ProductController?action=editSizeStockPage&shoesid=<%=shoes.getShoes_id()%>&colorid=<%=item.getColorid()%>"
                                       class="row-action edit-button" title="Edit Variant">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                    <a href="<%= request.getContextPath()%>/ProductController?action=deleteDetail&shoesid=<%= shoes.getShoes_id()%>&colorid=<%= item.getColorid()%>" 
                                       class="row-action row-delete" title="Delete Variant">
                                        <i class="fas fa-trash"></i>
                                    </a>

                                </div>
                            </td>
                        </tr>       
                        <%
                            }
                        %>

                    </tbody>
                </table>

                <%
                    }
                %>
            </div>
        </div>
        <%
            }
        %>
    </body>
</html>
