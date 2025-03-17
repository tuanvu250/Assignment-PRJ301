<%-- 
    Document   : sidebar
    Created on : Mar 14, 2025, 8:48:37 PM
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

            * {
                user-select: none;
                cursor: default;
            }

            body {
                background-color: #EAE4DA;
            }

            a:hover {
                cursor: pointer;
            }

            input:hover {
                cursor: text;
            }

            nav {
                position: sticky;
                top: 0;
                bottom: 0;
                height: 100vh;
                left: 0;
                background: #c63f3e;
                width: 280px;
                overflow: hidden;
                box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
            }

            .logo {
                text-align: center;
                display: flex;
                margin: 10px 0 0 0;
                align-items: center;
            }

            .logo span {
                font-weight: bold;
                padding-left: 15px;
                font-size: 18px;
                text-align: center;
            }

            a {
                position: relative;
                color: #1d1d1b;
                font-size: 14px;
                display: table;
                width: 280px;
                padding: 10px;
            }

            nav .fas,
            nav .fa-solid {
                position: relative;
                width: 70px;
                height: 40px;
                top: 14px;
                font-size: 20px;
                text-align: center;
            }

            .nav-item {
                position: relative;
                top: 12px;
                margin-left: 10px;
            }

            nav ul li a:hover {
                background: rgba(255, 255, 255, 0.1);
                color: #fbe385;
            }

            nav ul li a:hover i {
                color: #fbe385;
            }

            .logout {
                position: absolute;
                bottom: 0;
            }        
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="#" class="logo">
                        <span class="nav-item">Admin DashBoard</span>
                    </a></li>
                <li><a href="#">
                        <i class="fa-solid fa-users"></i>
                        <span class="nav-item">Accounts</span>
                    </a></li>
                <li><a href="">
                        <i class="fas fa-user"></i>
                        <span class="nav-item">Invoice</span>
                    </a></li>
                <li><a href="">
                        <i class="fas fa-box"></i>
                        <span class="nav-item">Products</span>
                    </a></li>
                <li><a href="">
                        <i class="fas fa-tags"></i>
                        <span class="nav-item">Product Line</span>
                    </a></li>
                <li><a href="">
                        <i class="fas fa-layer-group"></i>
                        <span class="nav-item">Material</span>
                    </a></li>
                <li><a href="">
                        <i class="fas fa-tshirt"></i
                        <span class="nav-item">Style</span>
                    </a></li>
                <li><a href="">
                        <i class="fa-solid fa-palette"></i>
                        <span class="nav-item">Color</span>
                    </a></li>
                <li><a href="" class="logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <span class="nav-item">Exit</span>
                    </a></li>
            </ul>
        </nav>
    </body>
</html>
