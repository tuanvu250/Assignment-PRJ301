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
            <h2>OTP</h2>
            <form class="login-form" action="<%= request.getContextPath()%>/ForgotPassController" method="post">
                <input type="hidden" name="action" value="submitOTP" />
                <input class="login-sign" type="text" placeholder="Enter OTP" name="otp" required/>
                <%if(request.getAttribute("errorOTP") != null) {
                    String errorOTP = (String) request.getAttribute("errorOTP");
                %>
                <p style="color: red;"><%=errorOTP%></p>
                <%} else {%><p style="text-align: center">We already send OTP to your email for reset password.</p>
                <%}
                    if(request.getAttribute("username") != null) {
                        username = (String) request.getAttribute("username");
                %>
                <input type="hidden" name="username" value="<%=username%>"/>
                <%}%>
                <button type="submit" class="login-btn">
                    SUBMIT
                </button>
            </form>
            <div class="login-mid">
                <a href="<%= request.getContextPath()%>/ForgotPassController?action=sendAgain&username=<%=username%>" >Send OTP again?</a>
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
