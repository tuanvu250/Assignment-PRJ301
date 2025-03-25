<%@page import="dto.ProductColorDTO"%>
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
                List<ProductColorDTO> colors = (List<ProductColorDTO>) request.getAttribute("colors");
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
                        <form action="<%= request.getContextPath()%>/ProductColorController">
                            <input type="hidden" name="action" value="searchColor">
                            <input type="text" placeholder="Search color" name="colorTerm" value="<%=searchterm%>">
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
                    if (!colors.isEmpty()) {
                %>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Color Name</th>
                                <th>Color Code</th>
                                <th></th>
                                <th>
                                    <a href="<%= request.getContextPath()%>/admin/colorForm.jsp" class="add-button">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (ProductColorDTO item : colors) {
                            %>
                            <tr>
                                <td><%=item.getColor_id()%></td>
                                <td><%=item.getColor_name()%></td>
                                <td><%=item.getColor_code()%></td>
                                <td><div style="background-color: <%=item.getColor_code()%>; padding: 20px; border-radius: 50%"></div></td>

                                <td>
                                    <div class="action-buttons">
                                        <a href="<%= request.getContextPath()%>/ProductColorController?action=editpage&id=<%=item.getColor_id()%>" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="<%= request.getContextPath()%>/ProductColorController?action=delete&id=<%=item.getColor_id()%>" class="delete-button">
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