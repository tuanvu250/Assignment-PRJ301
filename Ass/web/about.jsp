<%-- 
    Document   : about
    Created on : Mar 8, 2025, 2:55:25 PM
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

            input:hover {
                cursor:text;
            }
            
            .about {
                margin: 80px 160px;
                display: flex;
                flex-direction: column;
                gap: 12px;
                position: relative;
            }
            
            .about h2 {
                text-align: center;
                margin-bottom: 8px;
            }
            
            .about span {
                font-weight: 600;
            }
            
            .about img {
                position: absolute;
                width: 500px;
                right: 60px;
                bottom: -20px;
                z-index: -1000;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="about">
            <h2>About Us - Bloom on Foot</h2>
            <h4>Our Story – The Name That Inspires</h4>
            <p>In this journey of life, every step we take not only leads us to new places but also marks precious moments of growth and self-discovery. Each step is an opportunity to express ourselves and leave a unique imprint on the path we choose.</p>
            <p><span>"Bloom on Foot"</span> serves as a gentle reminder that every step is the beginning of endless creativity, freshness, and continuous growth.</p>
            <p>Founded with a passion for footwear and artistry, Bloom on Foot was born from the desire to create shoes that are not only aesthetically pleasing but also provide comfort, confidence, and embrace every step you take.</p>
            <p>At <span>Bloom on Foot</span>, we don’t just sell shoes — we walk alongside you on your personal journey to bloom.</p>
            <h4>Our Commitment</h4>
            <p>Quality: Delivering the best products at reasonable prices</p>
            <p>Service: Providing a seamless shopping experience with dedicated support</p>
            <p>Style: Staying ahead with the latest fashion trends</p>
            <p>Sustainability: Striving for environmentally friendly products</p>
            <h4>Contact Us</h4>
            <p>Address: D1, Long Thanh My, Thu Duc, Ho Chi Minh City</p>
            <p>Email: bloomonfoot@gmail.com</p>
            <p>Phone: 0909686868</p>
            <p>Instagram: _bloomonfoot</p>
            <p>Facebook: Bloom On Foot</p>
            <h4>Bloom on Foot – Let Every Step Blossom</h4>
            <img src="img/export (1).png">
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
