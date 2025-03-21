<%-- 
    Document   : userForm
    Created on : Mar 14, 2025, 10:57:02 PM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="dao.RoleDAO"%>
<%@page import="dto.RoleDTO"%>
<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/userForm.css">    

    </head>
    <body>
        <%  if (AuthUtils.checkIsAdmin(session)) {
        %>
        <div class="container">
            <div class="form-container">
                <h1>Add New User</h1>


                <%UserDTO newUser = (UserDTO) request.getAttribute("newUser");
                    if (newUser == null) {
                        newUser = new UserDTO();
                    }
                    String errorUsername
                            = request.getAttribute("errorMessUsername") != null ? (String) request.getAttribute("errorMessUsername") : "";
                    String errorPassword
                            = request.getAttribute("errorMessPassword") != null ? (String) request.getAttribute("errorMessPassword") : "";
                    String errorCfPassword
                            = request.getAttribute("errorMessCfPassword") != null ? (String) request.getAttribute("errorMessCfPassword") : "";
                    String errorFullname
                            = request.getAttribute("errorMessFullname") != null ? (String) request.getAttribute("errorMessFullname") : "";
                    String errorEmail
                            = request.getAttribute("errorMessEmail") != null ? (String) request.getAttribute("errorMessEmail") : "";
                    String errorPhone
                            = request.getAttribute("errorMessPhone") != null ? (String) request.getAttribute("errorMessPhone") : "";
                    String errorRegister
                            = request.getAttribute("errorRegister") != null ? (String) request.getAttribute("errorRegister") : "";
                    String errorMessRole
                            = request.getAttribute("errorMessRole") != null ? (String) request.getAttribute("errorMessRole") : "";

                    String action = request.getAttribute("action") != null ? (String) request.getAttribute("action") : "register";
                %>
                <form id="userForm" method="post" action="<%= request.getContextPath()%>/UserController">
                    <input type="hidden" name="action" value="<%=action%>">
                    <div class="form-group">    
                        <label for="fullname">Full Name</label>
                        <input type="text" id="fullname" name="regFullname" value="<%=newUser.getFull_name()%>"required>
                    </div>
                    <% if (!errorFullname.isEmpty()) {%>
                    <div style="color: red"><%=errorFullname%></div>
                    <% }%>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="regUsername" value="<%=newUser.getUser_name()%>"required  <%if (action.equals("update")) {
                               %>readonly<%}%>>
                    </div>
                    <% if (!errorUsername.isEmpty()) {%>
                    <p style="color: red"><%=errorUsername%></p>
                    <% } %>
                    <%if (!action.equals("update")) {
                    %>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="regPassword" required>
                    </div>
                    <% if (!errorPassword.isEmpty()) {%>
                    <div style="color: red"><%=errorPassword%></div>
                    <% } %>
                    <div class="form-group">
                        <label for="password">Confirm password</label>
                        <input type="password" id="password" name="regCfPassword" required>
                    </div>
                    <% if (!errorCfPassword.isEmpty()) {%>
                    <div style="color: red"><%=errorCfPassword%></div>
                    <% }%>
                    <%
                        }%>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="regEmail" value="<%=newUser.getEmail()%>" required>
                    </div>
                    <% if (!errorEmail.isEmpty()) {%>
                    <div style="color: red"><%=errorEmail%></div>
                    <% }%>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="tel" id="phone" name="regPhone" value="<%=newUser.getPhone_number()%>" required>
                    </div>               
                    <div class="form-group">
                        <label for="role_id">Role</label>
                        <select id="role_id" name="regRole" required>
                            <option value="" disabled selected>Select a role</option>
                            <%
                                RoleDAO rdao = new RoleDAO();
                                List<RoleDTO> list = rdao.readAll();
                                if (list != null && !list.isEmpty()) {
                                    for (RoleDTO item : list) {
                            %>
                            <option value="<%=item.getRole_id()%>" <%=item.getRole_id() == newUser.getRole_id() ? "selected" : ""%>><%=item.getRole_name()%></option>
                            <%  }
                                } %>
                        </select>

                    </div>
                    <% if (!errorMessRole.isEmpty()) {%>
                    <div style="color: red"><%=errorMessRole%></div>
                    <% } %>

                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add User</button>
                    </div>
                </form>
            </div>
        </div>
        <%
            }%>
    </body>
</html>
