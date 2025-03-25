<%-- 
    Document   : products
    Created on : Mar 15, 2025, 2:40:55 PM
    Author     : ADMIN
--%>

<%@page import="dao.SaleDAO"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dto.ShoesProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/manageProduct.css">    
    </head>
    <body>
        <%
            if (AuthUtils.checkIsAdmin(session)) {
                String searchterm = request.getAttribute("searchterm") != null ? (String) request.getAttribute("searchterm") : "";
                List<ShoesProductDTO> listShoes = (List<ShoesProductDTO>) request.getAttribute("listShoes");
                NumberFormat currencyVN = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                String add_editSuccess = request.getAttribute("add_editSuccess") != null ? (String) request.getAttribute("add_editSuccess") : "";
                String resultDelete = request.getAttribute("resultDelete") != null ? (String) request.getAttribute("resultDelete") : "";
                String errorEditpage = request.getAttribute("errorEditpage") != null ? (String) request.getAttribute("errorEditpage") : "";

        %>
        <div class="page-container">
            <%@include file="../includes/sidebar.jsp" %>
            <div class="container">
                <div class="header">
                    <h1>Manage Products</h1>
                    <form action="<%= request.getContextPath()%>/ProductController">
                        <input type="hidden" name="action" value="searchTerm">
                        <div class="search-bar">
                            <input type="text" placeholder="Search product name" name="nameTerm" value="<%=searchterm%>">
                            <button type="submit" class="search-button">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </form>
                </div>
                <%
                    if (!add_editSuccess.isEmpty()) {
                %>
                <p style="color: green"><%=add_editSuccess%></p>    
                <%
                    }
                    if (!resultDelete.isEmpty()) {
                %>
                <p style="color: red"><%=resultDelete%></p>    
                <%
                    }
                    if (!errorEditpage.isEmpty()) {
                %>
                <p style="color: red"><%=errorEditpage%></p>    
                <%
                    }
                    if (!listShoes.isEmpty() && listShoes != null) {
                %>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Product ID</th>
                                <th>Name</th>
                                <th>Produce Date</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Gender</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Style</th>
                                <th>Product Line</th>
                                <th>Material</th>
                                <th>Sale</th>
                                <th>
                                    <a href="<%= request.getContextPath()%>/admin/productForm.jsp" class="add-button">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody> 
                            <%
                                SaleDAO saldao = new SaleDAO();
                                int n = 1;
                                for (ShoesProductDTO item : listShoes) {
                            %>

                            <tr>
                                <td><%=n%></td>
                                <td><%=item.getShoes_id()%></td>
                                <td><%=item.getShoes_name()%></td>
                                <td><%=item.getProduce_date()%></td>
                                <td><%=currencyVN.format(item.getPrice())%></td>
                                <td><%=item.getQuantity()%></td>
                                <td><%=item.getGender()%></td>
                                <td class="truncate"><%=item.getDescription()%></td>
                                <td class="status-active"><%=item.getStatus()%></td>
                                <td><%=item.getStyle_id()%></td>
                                <td><%=item.getLine_id()%></td>
                                <td><%=item.getMat_id()%></td>
                                <td><%=saldao.saleNum(item.getSale_id()) * 100%></td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="<%= request.getContextPath()%>/admin/manageProductDetail.jsp" class="detail-button">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="<%= request.getContextPath()%>/ProductController?action=editPage&id=<%=item.getShoes_id()%>" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="<%= request.getContextPath()%>/ProductController?action=delete&id=<%=item.getShoes_id()%>" class="delete-button">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>  
                            <%
                                    n++;
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <%} %>   
            </div>
        </div>
        <% }
        %>    
    </body>
</html>
