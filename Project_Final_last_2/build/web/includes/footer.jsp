<%-- 
    Document   : footer
    Created on : Feb 28, 2025, 6:31:21 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
              integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/footer.css">    
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
                            <a href="<%= request.getContextPath()%>/home/home.jsp">Home</a>
                        </li>
                        <li>
                            <i class="fa-solid fa-angle-right"></i>
                            <a onclick="updateFilter('gender', '')">Products</a>
                        </li>
                        <li>
                            <i class="fa-solid fa-angle-right"></i>
                            <a href="<%= request.getContextPath()%>/home/about.jsp">About us</a>
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
