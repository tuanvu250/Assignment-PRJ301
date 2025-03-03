<%-- 
    Document   : footer
    Created on : Feb 28, 2025, 6:31:21 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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

            input:hover {
                cursor: text;
            }

            .footer a {
                color: #FFF;
            }



            footer {
                height: 400px;
                width: 100%;
                background-color: #C63F3E;
                position: relative;
                bottom: 0;
            }

            .footer {
                display: flex;
                align-items: start;
                justify-content: space-evenly;
                color: #FFF;
                padding-top: 80px;
                padding-bottom: 80px;
                margin: 0 10%;
                border-bottom: solid #EAE4DA 1px;
            }

            .foot-left p {
                max-width: 400px;
                margin-top: 16px;
                margin-bottom: 16px;
            }

            .foot-left div {
                gap: 16px
            }

            .foot-mid {
                margin-right: 100px;
            }

            .social-ic i {
                color: #EAE4DA;
                font-size: 30px;
                margin-right: 16px;
            }

            .foot-mid li,h2 {
                margin-bottom: 8px;
            }

            .foot-mid i {
                color: #EAE4DA;
            }

            .foot-contact {
                display: flex;
                flex-direction: column;
            }

            .foot-contact {
                margin: 12px 0;
            }

            .foot-contact a {
                margin-bottom: 8px;
            }

            .Email {
                padding: 8px 12px;
                margin-bottom: 16px;
                border-bottom: solid #EAE4DA 5px;
            }

            .foot-right form {
                display: flex;
                flex-direction: column;
                gap: 2px;
            }
            
            .btn-submit {
                padding: 12px 24px;
                background-color: #1d1d1b;
                color: #FFF;
            }

            .footer a:hover {
                color: #fbe385;
            }


        </style>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
              integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    </head>

    <body>


        <footer>
            <div class="footer">
                <div class="foot-left">
                    <h2>INFORMATION</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper
                        mattis,
                        pulvinar dapibus leo.</p>
                    <div class="social-ic">
                        <a href=""><i class="fa-brands fa-square-facebook"></i></a>
                        <a href=""><i class="fa-brands fa-square-x-twitter"></i></a>
                        <a href=""><i class="fa-brands fa-square-instagram"></i></a>
                    </div>
                </div>
                <div class="foot-mid">
                    <h2>NAVIGATION</h2>
                    <ul class="menu-navi">
                        <li>
                            <i class="fa-solid fa-angle-right"></i>
                            <a href="">Home</a>
                        </li>
                        <li>
                            <i class="fa-solid fa-angle-right"></i>
                            <a href="">Product</a>
                        </li>
                        <li>
                            <i class="fa-solid fa-angle-right"></i>
                            <a href="">About us</a>
                        </li>
                    </ul>
                </div>
                <div class="foot-right">
                    <h2>CONTACT US</h2>
                    <div class="foot-contact">
                        <a href=""><i class="fa-solid fa-location-dot"></i> HCM - VietNam</a>
                        <a href=""><i class="fa-solid fa-envelope"></i> hello123@gmail.com</a>
                    </div>
                    <form>
                        <input type="text" placeholder="Email Address" class="Email">
                        <button class="btn-submit">SUBMIT</button>
                    </form>
                </div>
            </div>
        </footer>
    </body>

</html>
