<%-- 
    Document   : home
    Created on : Feb 28, 2025, 6:13:14 PM
    Author     : ADMIN
--%>

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
            .banner {
                position: relative;
                text-align: center;
                margin: 30px 0;
                z-index: -1000;
            }

            .banner h2 {
                color: #FFF;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-size: 40px;
                border: 2px solid #FFF;
                padding: 36px 79px;
                font-weight: inherit;
            }

            h1 {
                text-align: center;
                margin-bottom: 32px;
            }

            .container {
                display: flex;
                justify-content: center;
                gap: 56px;
                margin-bottom: 80px;
            }

            .container h3 {
                color: #1d1d1b;
                text-align: center;
                margin-top: 12px;
                font-size: 24px;
            }

            .container h3:hover{
                color: #C63F3E
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <%@include file = "header.jsp" %>
        <%
            if (session.getAttribute("user") != null) {
                UserDTO user = (UserDTO) session.getAttribute("user");

        %><h2>Welcome <%=user.getFullName()%></h2>
        <%}%>
        <div class="banner">
            <img src="img/Rectangle_4.png">
            <h2>DISCOVER</h2>
        </div>

        <h1>CATEGORY</h1>

        <div class="container">
            <a class="contain-left" href="MainController?action=click">
                <img src="img/Rectangle_5.png">
                <h3>SALE OFF</h3>
            </a>
            <a class="contain-mid" href="MainController?action=click">
                <img src="img/Rectangle_5.png">
                <h3>MALE</h3>
            </a>
            <a class="contain-right" href="MainController?action=click">
                <img src="img/Rectangle_5.png">
                <h3>FEMALE</h3>
            </a>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
