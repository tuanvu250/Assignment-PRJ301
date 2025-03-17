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

            body {
                background-color: #EAE4DA;
            }

            .banner {
                position: relative;
                text-align: center;
                margin: 30px 0;
                overflow: hidden;
                padding: 0 40px;
            }

            .banner img {
                width: 100%;
                height: auto;
                display: block;
                transition: transform 0.5s ease;
            }

            .banner:hover img {
                transform: scale(1.02);
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
                font-weight: 500;
                letter-spacing: 2px;
                background-color: rgba(0, 0, 0, 0.2);
                backdrop-filter: blur(2px);
                transition: all 0.3s ease;
            }

            .banner:hover h2 {
                background-color: rgba(198, 63, 62, 0.4);
                transform: translate(-50%, -50%) scale(1.05);
            }

            h1 {
                text-align: center;
                margin: 60px 0 32px;
                font-size: 32px;
                letter-spacing: 1px;
                position: relative;
            }

            h1:after {
                content: '';
                display: block;
                width: 80px;
                height: 3px;
                background-color: #C63F3E;
                margin: 10px auto 0;
            }

            .container {
                width: 90%;
                max-width: 1200px;
                margin: 0 auto 80px;
                display: flex;
                justify-content: center;
                gap: 30px;
                flex-wrap: wrap;
            }

            .container a {
                flex: 1;
                min-width: 250px;
                max-width: 350px;
                overflow: hidden;
                border-radius: 8px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                background-color: #fff;
            }

            .container a:hover {
                transform: translateY(-10px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
                cursor: pointer;
            }

            .container img {
                width: 100%;
                object-fit: cover;
                display: block;
                transition: transform 0.5s ease;
            }

            .container a:hover img {
                transform: scale(1.05);
            }

            .container h3 {
                color: #1d1d1b;
                text-align: center;
                margin: 15px 0;
                padding-bottom: 15px;
                font-size: 22px;
                font-weight: 600;
                transition: color 0.3s ease;
            }

            .container a:hover h3 {
                color: #C63F3E;
            }

            /* User greeting styling */
            h2[style*="color: black"] {
                text-align: center;
                margin: 20px 0;
                font-size: 24px;
                color: #1d1d1b !important;
                padding: 10px;
                background-color: rgba(255, 255, 255, 0.5);
                border-radius: 8px;
                display: inline-block;
                position: relative;
                left: 50%;
                transform: translateX(-50%);
            }

            @media (max-width: 992px) {
                .banner h2 {
                    font-size: 32px;
                    padding: 24px 50px;
                }

                .container {
                    gap: 20px;
                }
            }

            @media (max-width: 768px) {
                .banner h2 {
                    font-size: 24px;
                    padding: 16px 30px;
                }

                h1 {
                    font-size: 28px;
                    margin: 40px 0 24px;
                }

                .container {
                    flex-direction: column;
                    align-items: center;
                }

                .container a {
                    width: 100%;
                    max-width: 400px;
                }
            }

            @media (max-width: 480px) {
                .banner h2 {
                    font-size: 18px;
                    padding: 12px 24px;
                }
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <%@include file = "header.jsp" %>
        <%
            UserDTO user = (UserDTO) session.getAttribute("user");
            if (user != null) {
        %>
        <h2 style="color: black"><%= user.getFull_name()%></h2>
        <%
            }

        %>
        <div class="banner">
            <img src="img/Rectangle_4.png">
            <h2>DISCOVER</h2>
        </div>

        <h1>CATEGORY</h1>

        <div class="container">
            <a  class="contain-left" onclick="updateFilter('status', 'Sale')">
                <img src="img/home_sale.jpg">
                <h3>SALE OFF</h3>
            </a>
            <a  class="contain-mid" onclick="updateFilter('gender', 'Male')">
                <img src="img/home_male.jpg">
                <h3>MALE</h3>
            </a>
            <a  class="contain-right" onclick="updateFilter('gender', 'Female')">
                <img src="img/home_female.jpg">
                <h3>FEMALE</h3>
            </a>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
