<%-- 
    Document   : productForm
    Created on : Mar 18, 2025, 9:10:42 AM
    Author     : ADMIN
--%>

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
                String action = request.getAttribute("action") != null ? "editProductLine" : "addProductLine";
                String oldname = request.getAttribute("oldname") != null ? (String) request.getAttribute("oldname") : "";
                String linename = request.getAttribute("linename") != null ? (String) request.getAttribute("linename") : "";
                String error_editAddPDL = request.getAttribute("error_editAddPDL") != null ? (String) request.getAttribute("error_editAddPDL") : "";
                String add_editFailed = request.getAttribute("add_editFailed") != null ? (String) request.getAttribute("add_editFailed") : "";
        %>

        <div class="container">
            <div class="form-container">
                <%
                    if (request.getAttribute("pdlId") != null) {
                %>
                <h1>Edit Product Line</h1>
                <%                } else {
                %>
                <h1>Add New Product Line</h1>
                <%}%>

                <form id="productForm" method="post" action="<%= request.getContextPath()%>/ProductLineController">
                    <input type="hidden" name="action" value="<%=action%>">
                    <%
                        if (request.getAttribute("pdlId") != null) {
                    %>
                    <input type="hidden" name="pdlid" value="<%=(String) request.getAttribute("pdlId")%>">
                    <%
                        }
                    %>
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Product Line Name</label>
                                <input type="text" id="name" name="productlineName" value="<%=oldname.isEmpty() ? linename : oldname%>" required>
                            </div>
                        </div>
                    </div>
                    <%
                        if (!error_editAddPDL.isEmpty()) {
                    %>
                    <p style="color: red"><%=error_editAddPDL%></p>
                    <%
                        }
                        if (!add_editFailed.isEmpty()) {
                    %>
                    <p style="color: red"><%=add_editFailed%></p>
                    <%
                        }
                    %>
                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary"><a href="<%= request.getContextPath()%>/ProductLineController?action=cancel" style="color: black; text-decoration: none">Cancel</a></button>
                        <%
                            if (request.getAttribute("pdlId") != null) {
                        %>
                        <button type="submit" class="btn btn-primary">Edit Product Line</button>
                        <%
                        } else {
                        %>
                        <button type="submit" class="btn btn-primary">Add Product Line</button>
                        <%}%>
                    </div>
                </form>
            </div>
            <%
                }
            %>
    </body>
</html>
