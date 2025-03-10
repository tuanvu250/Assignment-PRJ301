<%-- 
    Document   : productDetail
    Created on : Mar 10, 2025, 12:04:53 PM
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

            .img-slider {
                height: 593px;
                position: relative;
                overflow: hidden;
            }

            .img-list {
                position: absolute;
                width: 400%;
                top: 0;
                left: 0;
                display: flex;
                transition: 1s;
            }

            .img-list img{
                width: 100%;
                height: 100%;
                object-fit: cover;
                flex-shrink: 0;
            }

            .img-btn {
                position: absolute;
                left: 5%;
                top: 45%;
                width: 90%;
                display: flex;
                justify-content: space-between;
            }

            .img-btn button {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background-color: #fff5;
                color: #1d1d1b;
                border: none;
                font-weight: bold;
            }

            .thumnails {
                display: flex;
                justify-content: center;
            }

            .thumnails img {
                width: 100px;
                height: 100%;
                opacity: 0.6;
                transition: 1s;
                cursor: pointer;
            }
            
            .thumbnails img.active {
                opacity: 0;
                border: 2px solid #1d1d1b;
            }
            
            .slider-container{
                width: 50%;
                padding: 80px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="slider-container">
            <div class="img-slider">
                <div class="img-list">
                    <div>
                        <img src="img/SP001_1.jpg">
                    </div>
                    <div>
                        <img src="img/SP001_2.jpg">
                    </div>
                    <div>
                        <img src="img/SP001_3.jpg">
                    </div>
                    <div>
                        <img src="img/SP001_4.jpg">
                    </div>
                </div>
                <div class="img-btn">
                    <button id="prev"><i class="fa-solid fa-chevron-left"></i></button>
                    <button id="next"><i class="fa-solid fa-chevron-right"></i></button>
                </div>
            </div>
            <ul class="thumnails">
                <li><img src="img/SP001_1.jpg" alt="thumnail_1"></li>
                <li><img src="img/SP001_2.jpg" alt="thumnail_2"></li>
                <li><img src="img/SP001_3.jpg" alt="thumnail_3"></li>
                <li><img src="img/SP001_4.jpg" alt="thumnail_4"></li>
            </ul>
        </div>
        <%@include file="footer.jsp" %>
        <script>
            let slider = document.querySelector('.img-list');
            let items = document.querySelectorAll('.img-list img');
            let next = document.getElementById('next');
            let prev = document.getElementById('prev');
            let thumbnails = document.querySelectorAll('.thumbnails img');

            let lengthItems = items.length - 1;
            let active = 0;
            next.onclick = function () {
                active = active + 1 <= lengthItems ? active + 1 : 0;
                reloadSlider();
            }
            prev.onclick = function () {
                active = active - 1 >= 0 ? active - 1 : lengthItems;
                reloadSlider();
            }

            function updateThumbnail() {
                document.querySelector('.thumbnails img.active')?.classList.remove('active');
                thumbnails[active].classList.add('active');
            }

            function reloadSlider() {
                slider.style.left = -items[active].offsetLeft + 'px';
                updateThumbnail();
            }

            thumbnails.forEach((img, index) => {
                img.addEventListener('click', () => {
                    active = index;
                    reloadSlider();
                });
            });
            
            updateThumbnail();
        </script>
    </body>
</html>
