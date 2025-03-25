<%-- 
    Document   : productForm
    Created on : Mar 18, 2025, 9:10:42 AM
    Author     : ADMIN
--%>

<%@page import="dto.ProductColorDTO"%>
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
                ProductColorDTO color = request.getAttribute("color") != null ? (ProductColorDTO) request.getAttribute("color") : new ProductColorDTO();
                String action = request.getAttribute("action") != null ? "editColor" : "addColor";
                String oldname = request.getAttribute("oldname") != null ? (String) request.getAttribute("oldname") : "";
                String oldcode = request.getAttribute("oldcode") != null ? (String) request.getAttribute("oldcode") : "";
                String errorColorName = request.getAttribute("errorColorName") != null ? (String) request.getAttribute("errorColorName") : "";
                String errorColorCode = request.getAttribute("errorColorCode") != null ? (String) request.getAttribute("errorColorCode") : "";
                String add_editFailed = request.getAttribute("add_editFailed") != null ? (String) request.getAttribute("add_editFailed") : "";
        %>

        <div class="container">
            <div class="form-container">
                <%
                    if (request.getAttribute("colorid") != null) {
                %>
                <h1>Edit Color</h1>
                <%                } else {
                %>
                <h1>Add New Color</h1>
                <%}%>

                <form id="productForm" method="post" action="<%= request.getContextPath()%>/ProductColorController">
                    <input type="hidden" name="action" value="<%=action%>">
                    <%
                        if (request.getAttribute("colorid") != null) {
                    %>
                    <input type="hidden" name="colorid" value="<%=(String) request.getAttribute("colorid")%>">
                    <%
                        }
                    %>
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Color Name</label>
                                <input type="text" id="name" name="colorName" value="<%=oldname.isEmpty() ? color.getColor_name() : oldname%>" required>
                            </div>
                        </div>                     
                    </div>
                    <%
                        if (!errorColorName.isEmpty()) {
                    %>
                    <p style="color: red"><%=errorColorName%></p>
                    <%
                        }
                    %>
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Color Code</label>
                                <input type="text" id="name" name="colorCode" value="<%=oldcode.isEmpty() ? color.getColor_code() : oldcode%>" required>
                            </div>
                        </div>
                    </div>
                    <%
                        if (!errorColorCode.isEmpty()) {
                    %>
                    <p style="color: red"><%=errorColorCode%></p>
                    <%
                        }
                        if (!add_editFailed.isEmpty()) {
                    %>
                    <p style="color: red"><%=add_editFailed%></p>
                    <%
                        }
                    %>
                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary"><a href="<%= request.getContextPath()%>/ProductColorController?action=cancel" style="color: black; text-decoration: none">Cancel</a></button>
                        <%
                            if (request.getAttribute("colorid") != null) {
                        %>
                        <button type="submit" class="btn btn-primary">Edit Color</button>
                        <%
                        } else {
                        %>
                        <button type="submit" class="btn btn-primary">Add Color</button>
                        <%}%>
                    </div>
                </form>
            </div>
            <%
                }
            %>
    </body>
</html>
