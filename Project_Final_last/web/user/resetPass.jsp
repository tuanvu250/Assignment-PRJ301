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
            <h2>Reset Password</h2>
            <form class="login-form" action="<%= request.getContextPath()%>/ForgotPassController" method="post">
                <input type="hidden" name="action" value="resetPass" />
                <input class="login-sign" type="password" placeholder="Enter new password" name="password1" required/>
                <%
                    if (request.getAttribute("errorPass") != null) {
                        String errorPass = (String) request.getAttribute("errorPass");
                %>
                <p style="color: red"><%=errorPass%></p>
                <%}%>
                <input class="login-sign" type="password" placeholder="Confirm new password" name="password2" required/>
                <%
                    if (request.getAttribute("username") != null) {
                        username = (String) request.getAttribute("username");
                %>
                <input type="hidden" name="username" value="<%=username%>"/>
                <%}
                    if (request.getAttribute("errorReset") != null) {
                        String errorReset = (String) request.getAttribute("errorReset");
                %>
                <p style="color: red"><%=errorReset%></p>
                <%}
                    if (request.getAttribute("changeSuccess") != null) {
                        String changeSuccess = (String) request.getAttribute("changeSuccess");
                %>
                <p style="color: green"><%=changeSuccess%></p>
                <%}
                    if (request.getAttribute("changeFailed") != null) {
                        String changeFailed = (String) request.getAttribute("changeFailed");
                %>
                <p style="color: red"><%=changeFailed%></p>
                <%}%>
                <button type="submit" class="login-btn">
                    SUBMIT
                </button>
            </form>
                <%if (request.getAttribute("changeSuccess") != null) {%>
            <div class="login-mid">
                <a href="<%= request.getContextPath()%>/user/login.jsp" >Continue login</a>
            </div><%}%>
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
