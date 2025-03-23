<%@page import="dto.ProductLineDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductLineDAO"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Product Lines</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/manageProduct.css">    
    </head>
    <body>
        <%
            if (AuthUtils.checkIsAdmin(session)) {
                List<ProductLineDTO> list = (List<ProductLineDTO>) request.getAttribute("list");
                String searchterm = request.getAttribute("searchterm") != null ? (String) request.getAttribute("searchterm") : "";
        %>


        <div class="page-container">
            <%@include file="../includes/sidebar.jsp" %>
            <div class="container">
                <div class="header">
                    <h1 style="margin-right: 20px">Manage Product Lines</h1>
                    <div class="search-bar">
                        <form action="<%= request.getContextPath()%>/ProductLineController">
                            <input type="hidden" name="action" value="searchPDL">
                            <input type="text" placeholder="Search product line" name="pdlTerm" value="<%=searchterm%>">
                            <button type="submit" class="search-button">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <%
                    if (!list.isEmpty()) {
                %>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Product Line Name</th>
                                <th>
                                    <a href="<%= request.getContextPath()%>/admin/productLine.jsp" class="add-button">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (ProductLineDTO item : list) {
                            %>
                            <tr>
                                <td><%=item.getLine_id()%></td>
                                <td><%=item.getLine_name()%></td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="<%= request.getContextPath()%>/ProductLineController?action=editpage&id=<%=item.getLine_id()%>" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="<%= request.getContextPath()%>/ProductLineController?action=delete&id=<%=item.getLine_id()%>" class="delete-button">
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