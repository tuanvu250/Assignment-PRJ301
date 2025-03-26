<%-- 
    Document   : login
    Created on : Feb 28, 2025, 11:44:57 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/login.css">    

    </head>
    <body>
        <%@include file="../includes/header.jsp" %>

        <div class="login">
            <%String success = request.getAttribute("success") != null ? (String) request.getAttribute("success") : "";
                if (!success.isEmpty()) {
            %>
            <p style="color: green; text-align: center; font-size: 18px; font-weight: 500;"><%=success%></p>
            <% }%>
            <h2>LOGIN</h2>
            <form class="login-form" action="<%= request.getContextPath()%>/UserController" method="post">
                <input type="hidden" name="action" value="login" />
                <input class="login-sign" type="text" placeholder="Enter username" name="username" required/>
                <input class="login-sign"type="password" placeholder="Enter password" name="password" required/>
                <button type="submit" class="login-btn">
                    LOGIN
                </button>
            </form>
            <%
                String errorLogin = request.getAttribute("errorLogin") + "";
                errorLogin = errorLogin.equals("null") ? "" : errorLogin;
            %>
            <div style="color: red"><%=errorLogin%></div>
            <div class="login-mid">
                <div>
                    <input type="checkbox"/>
                    Remember me
                </div>
                <a href="<%= request.getContextPath()%>/user/forgotPass.jsp" >Forgot password?</a>
            </div>
            <div class="login-line">
                <div class="login-linee"></div>
                <h3>OR</h3>
                <div class="login-linee"></div>
            </div>

            <div class="login-end">
                Don’t have an account?
                <a href="<%= request.getContextPath()%>/user/register.jsp" >Register</a>
            </div>

        </div>
        <%@include file="../includes/footer.jsp" %>
    </body>
</html>
