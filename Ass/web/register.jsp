<%-- 
    Document   : register
    Created on : Mar 3, 2025, 3:01:09 PM
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

            *{
                user-select: none;
                cursor: default;
            }

            input {
                user-select: text;
                cursor: text;
            }

            .signup h2{
                text-align: center;
                width: 500px;
                padding-bottom: 20px;
                border-bottom: solid 3px #1d1d1b;
            }

            .signup{
                display: flex;
                flex-direction: column;
                margin: 80px 0;
                align-items: center;
                gap: 20px
            }

            .signup-input {
                font-size: 16px;
                padding: 12px 20px;
                width: 500px;
                border-radius: 50px;
                border: 1px solid #000;
            }
            
            .signup-line {
                display: flex;
                align-items: center;
                gap: 20px;
            }
            
            .signup-line h3 {
                font-weight: initial;
            }
            
            .signup-linee {
                width: 220px;
                height: 1px;
                background-color: #1d1d1b;
            }
            
            .signup-btn {
                padding: 12px 20px;
                width: 500px;
                text-align: center;
                background-color: #1d1d1b;
                border-radius: 50px;
                color: #FFF;
            }
            
            .signup-form {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            
            .signup-btn:hover {
                background-color: #C63F3E;
            }
            
            .signup-end a {
                color: #1d1d1b;
                font-weight: bold;
            }
            
            .signup-end a:hover {
                color: #C63F3E;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <%@include file = "header.jsp" %>
        <div class="signup">
            <h2>REGISTER</h2>
            <form class="signup-form">
                <input class="signup-input" type="text" placeholder="Enter username"/>
                <input class="signup-input"type="password" placeholder="Enter password"/>
                <input class="signup-input"type="password" placeholder="Confirm password"/>
                <input class="signup-input" type="text" placeholder="Enter fullname"/>
                <input class="signup-input" type="text" placeholder="Enter email"/>
                <input class="signup-input" type="tel" placeholder="Enter phone number"/>
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

        </div>
        <%@include file = "footer.jsp" %>
    </body>
</html>
