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
                String action = request.getAttribute("action") != null ? "editStyle" : "addStyle";
                String oldname = request.getAttribute("oldname") != null ? (String) request.getAttribute("oldname") : "";
                String stylename = request.getAttribute("stylename") != null ? (String) request.getAttribute("stylename") : "";
                String error_editAddStyle = request.getAttribute("error_editAddStyle") != null ? (String) request.getAttribute("error_editAddStyle") : "";
                String add_editFailed = request.getAttribute("add_editFailed") != null ? (String) request.getAttribute("add_editFailed") : "";
        %>

        <div class="container">
            <div class="form-container">
                <%
                    if (request.getAttribute("styleid") != null) {
                %>
                <h1>Edit Style</h1>
                <%                } else {
                %>
                <h1>Add New Style</h1>
                <%}%>

                <form id="productForm" method="post" action="<%= request.getContextPath()%>/ProductStyleController">
                    <input type="hidden" name="action" value="<%=action%>">
                    <%
                        if (request.getAttribute("styleid") != null) {
                    %>
                    <input type="hidden" name="styleid" value="<%=(String) request.getAttribute("styleid")%>">
                    <%
                        }
                    %>
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Style Name</label>
                                <input type="text" id="name" name="styleName" value="<%=oldname.isEmpty() ? stylename : oldname%>" required>
                            </div>
                        </div>
                    </div>
                    <%
                        if (!error_editAddStyle.isEmpty()) {
                    %>
                    <p style="color: red"><%=error_editAddStyle%></p>
                    <%
                        }
                        if (!add_editFailed.isEmpty()) {
                    %>
                    <p style="color: red"><%=add_editFailed%></p>
                    <%
                        }
                    %>
                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary"><a href="<%= request.getContextPath()%>/ProductStyleController?action=cancel" style="color: black; text-decoration: none">Cancel</a></button>
                        <%
                            if (request.getAttribute("styleid") != null) {
                        %>
                        <button type="submit" class="btn btn-primary">Edit Style</button>
                        <%
                        } else {
                        %>
                        <button type="submit" class="btn btn-primary">Add Style</button>
                        <%}%>
                    </div>
                </form>
            </div>
            <%
                }
            %>
    </body>
</html>
