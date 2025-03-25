<%@page import="dto.ProductStyleDTO"%>
<%@page import="dto.ProductMaterialDTO"%>
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
                List<ProductStyleDTO> styles = (List<ProductStyleDTO>) request.getAttribute("styles");
                String searchterm = request.getAttribute("searchterm") != null ? (String) request.getAttribute("searchterm") : "";
                String add_editSuccess = request.getAttribute("add_editSuccess") != null ? (String) request.getAttribute("add_editSuccess") : "";
                String errorEditpage = request.getAttribute("errorEditpage") != null ? (String) request.getAttribute("errorEditpage") : "";
                String resultDelete = request.getAttribute("resultDelete") != null ? (String) request.getAttribute("resultDelete") : "";
        %>


        <div class="page-container">
            <%@include file="../includes/sidebar.jsp" %>
            <div class="container">
                <div class="header">
                    <h1 style="margin-right: 20px">Manage Styles</h1>
                    <div class="search-bar">
                        <form action="<%= request.getContextPath()%>/ProductStyleController">
                            <input type="hidden" name="action" value="searchStyle">
                            <input type="text" placeholder="Search style" name="styleTerm" value="<%=searchterm%>">
                            <button type="submit" class="search-button">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <%
                    if (!add_editSuccess.isEmpty()) {
                %>
                <p style="color: green"><%=add_editSuccess%></p>
                <%
                    }
                    if (!errorEditpage.isEmpty()) {
                %>
                <p style="color: red"><%=errorEditpage%></p>
                <%
                    }
                    if (!resultDelete.isEmpty()) {
                %>
                <p style="color: red"><%=resultDelete%></p>
                <%
                    }
                    if (!styles.isEmpty()) {
                %>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Style Name</th>
                                <th>
                                    <a href="<%= request.getContextPath()%>/admin/styleForm.jsp" class="add-button">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (ProductStyleDTO item : styles) {
                            %>
                            <tr>
                                <td><%=item.getStyle_id()%></td>
                                <td><%=item.getStyle_name()%></td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="<%= request.getContextPath()%>/ProductStyleController?action=editpage&id=<%=item.getStyle_id()%>" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="<%= request.getContextPath()%>/ProductStyleController?action=delete&id=<%=item.getStyle_id()%>" class="delete-button">
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