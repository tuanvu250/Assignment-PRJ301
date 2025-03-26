
<%@page import="dto.VoucherDTO"%>
<%@page import="java.util.List"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Vouchers</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/manageProduct.css">    
    </head>
    <body>
        <%
            if (AuthUtils.checkIsAdmin(session)) {
                String searchTerm = request.getAttribute("searchTerm") != null ? (String) request.getAttribute("searchTerm") : "";
        %>


        <div class="page-container">
            <%@include file="../includes/sidebar.jsp" %>
            <div class="container">
                <div class="header">
                    <h1 style="margin-right: 20px">Manage Vouchers</h1>
                    <div class="search-bar">
                        <form action="<%= request.getContextPath()%>/VoucherController">
                            <input type="hidden" name="action" value="searchVoucher">
                            <input type="text" placeholder="Search discount code" name="searchTerm" value="<%=searchTerm%>">
                            <button type="submit" class="search-button">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <%
                    if (request.getAttribute("successAdd") != null) {
                        String successAdd = (String) request.getAttribute("successAdd");
                %>
                <p style="color: green"><%=successAdd%></p>
                <%
                    }
                    if (request.getAttribute("successEdit") != null) {
                        String successEdit = (String) request.getAttribute("successEdit");
                %>
                <p style="color: green"><%=successEdit%></p>
                <%
                    }
                    if (request.getAttribute("successDelete") != null) {
                        String successDelete = (String) request.getAttribute("successDelete");
                %>
                <p style="color: green"><%=successDelete%></p>
                <%
                    }
                    if (request.getAttribute("errorDelete") != null) {
                        String errorDelete = (String) request.getAttribute("errorDelete");
                %>
                <p style="color: red"><%=errorDelete%></p>
                <%
                    }
                    if(request.getAttribute("listVou")!=null) {
                        List<VoucherDTO> listVou = (List<VoucherDTO>) request.getAttribute("listVou");
                %>
                <div class="table-container" style="margin-top: 10px;">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>CODE</th>
                                <th>Discount</th>
                                <th>Quantity</th>
                                <th>Start date</th>
                                <th>End date</th>
                                <th>Status</th>
                                <th>
                                    <a href="<%= request.getContextPath()%>/VoucherController?action=addVoucher" class="add-button">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (VoucherDTO item : listVou) {
                            %>
                            <tr>
                                <td><%=item.getId()%></td>
                                <td><%=item.getCode()%></td>
                                <td><%=item.getDiscount() * 100%>%</td>
                                <td><%=item.getQuantity()%></td>
                                <td><%=item.getStart_date()%></td>
                                <td><%=item.getEnd_date()%></td>
                                <td><%=item.getStatus()%></td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="<%= request.getContextPath()%>/VoucherController?action=editVoucher&voucherId=<%=item.getId()%>" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="<%= request.getContextPath()%>/VoucherController?action=deleteVoucher&voucherId=<%=item.getId()%>" class="delete-button">
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
                </div>
                <%}
                %>
            </div>
        </div>
        <%}%>
    </body>
</html>