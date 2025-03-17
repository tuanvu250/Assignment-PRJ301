<%-- 
    Document   : register
    Created on : Mar 3, 2025, 3:01:09 PM
    Author     : ADMIN
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
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

            * {
                user-select: none;
                cursor: default;
            }

            input {
                user-select: text;
                cursor: text;
            }

            .signup h2 {
                text-align: center;
                width: 100%;
                max-width: 500px;
                padding-bottom: 20px;
                border-bottom: solid 3px #1d1d1b;
                font-size: 28px;
                letter-spacing: 1px;
            }

            .signup {
                display: flex;
                flex-direction: column;
                margin: 60px auto;
                align-items: center;
                gap: 20px;
                width: 90%;
                max-width: 500px;
            }

            .signup-input {
                font-size: 16px;
                padding: 12px 20px;
                width: 100%;
                border-radius: 50px;
                border: 1px solid #1d1d1b;
                background-color: rgba(255, 255, 255, 0.7);
                transition: all 0.3s ease;
            }

            .signup-input:focus {
                border-color: #C63F3E;
                background-color: #fff;
                box-shadow: 0 0 0 2px rgba(198, 63, 62, 0.2);
            }

            .signup-line {
                display: flex;
                align-items: center;
                gap: 20px;
                width: 100%;
                margin: 10px 0;
            }

            .signup-line h3 {
                font-weight: normal;
                color: #666;
            }

            .signup-linee {
                flex: 1;
                height: 1px;
                background-color: #1d1d1b;
                opacity: 0.3;
            }

            .signup-btn {
                padding: 14px 20px;
                width: 100%;
                text-align: center;
                background-color: #1d1d1b;
                border-radius: 50px;
                color: #FFF;
                font-weight: bold;
                letter-spacing: 1px;
                transition: all 0.3s ease;
                cursor: pointer;
            }

            .signup-form {
                display: flex;
                flex-direction: column;
                gap: 15px;
                width: 100%;
            }

            .signup-btn:hover {
                background-color: #C63F3E;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .signup-end {
                margin-top: 10px;
                text-align: center;
                font-size: 15px;
            }

            .signup-end a {
                color: #1d1d1b;
                font-weight: bold;
                transition: color 0.3s ease;
            }

            .signup-end a:hover {
                color: #C63F3E;
                cursor: pointer;
            }

            /* Error message styling */
            div[style*="color: red"] {
                margin-top: -10px;
                margin-bottom: 5px;
                font-size: 14px;
                padding-left: 20px;
            }

            @media (max-width: 576px) {
                .signup {
                    margin: 40px auto;
                }

                .signup h2 {
                    font-size: 24px;
                }

                .signup-input, .signup-btn {
                    padding: 10px 16px;
                }
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <%@include file = "header.jsp" %>
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
            <form class="signup-form" action="UserController" method="post">
                <input type="hidden" name="action" value="register">
                <input class="signup-input" type="text" placeholder="Enter username" name="regUsername" value="<%=newUser.getUser_name()%>"/> 
                <%
                    if (!errorUsername.isEmpty()) {
                %>
                <div style="color: red"><%=errorUsername%></div>
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

        </div>
        <%@include file = "footer.jsp" %>
    </body>
</html>
