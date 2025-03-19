<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/register.css">    
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <div class="signup">
            <h2>REGISTER</h2>
            <%
                UserDTO newUser = new UserDTO();
                try {
                    newUser = (UserDTO) request.getAttribute("newUser");
                } catch (Exception e) {
                    newUser = new UserDTO();
                }
                if (newUser == null) {
                    newUser = new UserDTO();
                }
                String errorUsername = request.getAttribute("errorMessUsername") + "";
                errorUsername = errorUsername.equals("null") ? "" : errorUsername;
                String errorPassword = request.getAttribute("errorMessPassword") + "";
                errorPassword = errorPassword.equals("null") ? "" : errorPassword;
                String errorCfPassword = request.getAttribute("errorMessCfPassword") + "";
                errorCfPassword = errorCfPassword.equals("null") ? "" : errorCfPassword;
                String errorFullname = request.getAttribute("errorMessFullname") + "";
                errorFullname = errorFullname.equals("null") ? "" : errorFullname;
                String errorEmail = request.getAttribute("errorMessEmail") + "";
                errorEmail = errorEmail.equals("null") ? "" : errorEmail;
                String errorPhone = request.getAttribute("errorMessPhone") + "";
                errorPhone = errorPhone.equals("null") ? "" : errorPhone;
            %>
            <form class="signup-form" action="<%= request.getContextPath()%>/UserController" method="post">
                <input type="hidden" name="action" value="register">
                <input class="signup-input" type="text" placeholder="Enter username" name="regUsername" value="<%=newUser.getUser_name()%>"/> 
                <%
                    if (!errorUsername.isEmpty()) {
                %>
                <p style="color: red"><%=errorUsername%><p>
                    <%
                        }
                    %>

                    <input class="signup-input"type="password" placeholder="Enter password" name="regPassword"/>
                    <%
                        if (!errorPassword.isEmpty()) {
                    %>
                <div style="color: red"><%=errorPassword%></div>
                <%
                    }
                %>
                <input class="signup-input"type="password" placeholder="Confirm password" name="regCfPassword"/>

                <%
                    if (!errorCfPassword.isEmpty()) {
                %>
                <div style="color: red"><%=errorCfPassword%></div>
                <%
                    }
                %>
                <input class="signup-input" type="text" placeholder="Enter fullname" name="regFullname" value="<%=newUser.getFull_name()%>"/>

                <%
                    if (!errorFullname.isEmpty()) {
                %>
                <div style="color: red"><%=errorFullname%></div>
                <%
                    }
                %>
                <input class="signup-input" type="email" placeholder="Enter email" name="regEmail" value="<%=newUser.getEmail()%>"/>
                <%
                    if (!errorEmail.isEmpty()) {
                %>
                <div style="color: red"><%=errorEmail%></div>
                <%
                    }
                %>

                <input class="signup-input" type="tel" placeholder="Enter phone number" name="regPhone" value="<%=newUser.getPhone_number()%>"/>

                <%
                    if (!errorPhone.isEmpty()) {
                %>
                <div style="color: red"><%=errorPhone%></div>
                <%
                    }
                %>
                <button class="signup-btn">
                    SIGN UP
                </button>
            </form>
            <div class="signup-line">
                <div class="signup-linee"></div>
                <h3>OR</h3>
                <div class="signup-linee"></div>
            </div>

            <div class="signup-end">
                Already have an account?
                <a href="login.jsp" >Sign in</a>
            </div>
            <%
                String errorRegister = request.getAttribute("errorRegister") + "";
                errorRegister = errorRegister.equals("null") ? "" : errorRegister;
                if (!errorRegister.isEmpty()) {
            %>
            <div style="color: red"> <%=errorRegister%></div>
                    <%
                        }
                    %>
        </div>
                <%@include file="../includes/footer.jsp" %>
                </body>
                </html>