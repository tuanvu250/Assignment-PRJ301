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
                List<ProductMaterialDTO> materials = (List<ProductMaterialDTO>) request.getAttribute("materials");
                String searchterm = request.getAttribute("searchterm") != null ? (String) request.getAttribute("searchterm") : "";
        %>


        <div class="page-container">
            <%@include file="../includes/sidebar.jsp" %>
            <div class="container">
                <div class="header">
                    <h1 style="margin-right: 20px">Manage Materials</h1>
                    <div class="search-bar">
                        <form action="<%= request.getContextPath()%>/ProductMaterialController">
                            <input type="hidden" name="action" value="searchMAT">
                            <input type="text" placeholder="Search material" name="matTerm" value="<%=searchterm%>">
                            <button type="submit" class="search-button">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <%
                    if (!materials.isEmpty()) {
                %>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Material Name</th>
                                <th>
                                    <a href="<%= request.getContextPath()%>/admin/materialForm.jsp" class="add-button">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (ProductMaterialDTO item : materials) {
                            %>
                            <tr>
                                <td><%=item.getMat_id()%></td>
                                <td><%=item.getMat_name()%></td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="<%= request.getContextPath()%>/ProductMaterialController?action=editpage&id=<%=item.getMat_id()%>" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="<%= request.getContextPath()%>/ProductMaterialController?action=delete&id=<%=item.getMat_id()%>" class="delete-button">
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