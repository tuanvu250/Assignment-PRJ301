<%-- 
    Document   : login
    Created on : Feb 28, 2025, 11:44:57 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            * {
                font-family: "Montserrat", sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                text-decoration: none;
                outline: none;
                border: none;
                list-style-type: none;
            }

            body {
                background-color: #EAE4DA;
            }

            .fa-user {
                color: #fbe385;
            }

            input {
                user-select: text;
                cursor: text;
            }

            .login h2{
                text-align: center;
                width: 500px;
                padding-bottom: 20px;
                border-bottom: solid 3px #1d1d1b;
            }

            .login{
                display: flex;
                flex-direction: column;
                margin: 80px 0;
                align-items: center;
                gap: 20px
            }
            .login-sign {
                font-size: 16px;
                padding: 12px 20px;
                width: 500px;
                border-radius: 50px;
                border: 1px solid #000;
            }

            .login-line {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .login-line h3{
                font-weight: initial;
            }

            .login-linee {
                width: 220px;
                height: 1px;
                background-color: #1d1d1b;
            }

            .login-btn {
                padding: 12px 20px;
                width: 500px;
                text-align: center;
                background-color: #1d1d1b;
                border-radius: 50px;
                color: #FFF;
            }

            .login-btn:hover {
                background-color: #C63F3E;
            }
            .login-end a {
                color: #1d1d1b;
                font-weight: bold;
            }

            .login-end a:hover{
                color: #C63F3E;
            }

            .login-mid {
                width: 500px;
                display: flex;
                justify-content: space-between;
            }

            .login-mid a {
                color: #1d1d1b;
            }

            .login-mid a:hover{
                color: #C63F3E;
            }

            .login-form {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="login">
            <h2>SIGN IN</h2>
            <form class="login-form" action="UserController" method="post">
                <input type="hidden" name="action" value="login" />
                <input class="login-sign" type="text" placeholder="Enter username" name="username"/>
                <input class="login-sign"type="password" placeholder="Enter password" name="password"/>
                <button class="login-btn">
                    SIGN IN
                </button>
            </form>
            <div class="login-mid">
                <div>
                    <input type="checkbox"/>
                    Remember me
                </div>
                <a href="" >Forgot password?</a>
            </div>
            <div class="login-line">
                <div class="login-linee"></div>
                <h3>OR</h3>
                <div class="login-linee"></div>
            </div>

            <div class="login-end">
                Don’t have an account?
                <a href="register.jsp" >Register</a>
            </div>

        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
