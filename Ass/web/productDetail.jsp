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

            .slider-container {
                position: relative;
                width: 400px;
                overflow: hidden;
            }

            .img-slider {
                position: relative;
                width: 100%;
            }

            .img-list {
                display: flex;
                transition: 1s;
            }

            .img-list div {
                min-width: 100%;
            }

            .img-list img {
                width: 100%;
                display: block;
            }

            /* CSS cho nút điều hướng */
            .img-btn {
                position: absolute;
                top: 50%;
                width: 100%;
                padding: 0 10px;
                display: flex;
                justify-content: space-between;
                transform: translateY(-50%);
            }

            .img-btn button {
                background: rgba(0, 0, 0, 0.5);
                color: white;
                border-radius: 50%;
                border: none;
                width: 50px;
                height: 50px;
                cursor: pointer;
            }

            .thumnails {
                display: flex;
                justify-content: center;
                gap: 1vw;
            }

            .thumnails li {
                cursor: pointer;
            }

            .thumnails img {
                width: 100%;
                opacity: 0.5;
                transition: 1s;
            }

            .thumnails img.active {
                opacity: 1;
                border: 1px solid #1d1d1b;
            }

            .slider-container{
                width: 100%;
                flex: 1;
                display: flex;
                flex-direction: column;
                gap: 1vh;
            }


            .detail-container {
                display: flex;  
                padding: 80px 8vw;
                gap: 5vw;
            }
            
            .detail-info {
                display: flex;
                flex-direction: column;
                gap: 4vh;
                flex: 1;
            }
            
            .detail-text {
                display: flex;
                flex-direction: column;
                gap: 4vh;
            }
            
            .detail-color {
                display: flex;
                gap: 10px;
                border-bottom: dashed 2px #1d1d1b;
                border-top: dashed 2px #1d1d1b;
                padding: 5vh 0;
            }
            .detail-color div {
                height: 40px;
                width: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            
            .detail-color a {
                display: inline-block;
                height: 30px;
                width: 30px;
                background-color: red; 
            }
            
            .size-quantity {
                display: flex;
                justify-content: space-between;
                
            }
            
            .btn-size select, .btn-quantity select {
                width: 10vw;
                height: 5vh;
                font-size: 20px;    
                text-align: center;
            }

            .detail-btn {
                display: flex;
                flex-direction: column;
                gap: 4vh;
            }
            
            .detail-cart {
                height: 100%;
                display: flex;
                gap: 5vw;
            }
            
            .detail-cart a{
                font-size: 18px;
                width: 70%;
                height: 7vh;
                background-color: #1d1d1b;
                color: #FFF;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .order-now {
                display: flex;
                justify-content: center;
            }
            
            .order-now a{
                font-size: 18px;
                width: 80%;
                height: 9vh;
                background-color: #C63F3E;
                color: #FFF;
                display: flex;
                align-items: center;
                justify-content: center;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="detail-container">
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
            <div class="detail-info">
                <div class="detail-text">
                    <h2>Abc xyz hello world</h2>
                    <p>Product ID <span>SPXXX</span></p>
                    <h2>XXX.XXX VND</h2>
                </div>
                <div class="detail-color">
                    <div>
                        <a> </a>
                    </div>
                    <div>
                        <a> </a>
                    </div>
                </div>
                <div class="detail-btn">
                    <div class="size-quantity">
                        <div class="btn-size">
                            <label>Size</label>
                            <select>
                                <option selected hidden></option>
                                <option>35</option>
                                <option>36</option>
                                <option>37</option>
                            </select>
                        </div>
                        <div class="btn-quantity">
                            <label>Quantity</label>
                                <select>
                                    <option selected hidden></option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                </select>
                        </div>
                    </div>
                    <div class="detail-cart">
                        <a>Add to cart</a>
                        <a><i class="fa-regular fa-heart"></i></a>
                    </div>
                    <div class="order-now">
                        <a>ORDER NOW</a>
                    </div>
                </div>
                <div>
                    <h3>Product infomation <i class="fa-solid fa-chevron-up"></i></h3>
                    <p>abc xyz</p>
                    <p>abc xyz</p>
                    <p>abc xyz</p>
                    <p>abc xyz</p>
                    <img src="img/info-table.jpg">
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script>
            let slider = document.querySelector('.img-list');
            let items = document.querySelectorAll('.img-list img');
            let next = document.getElementById('next');
            let prev = document.getElementById('prev');
            let thumbnails = document.querySelectorAll('.thumnails img');

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
                document.querySelector('.thumnails img.active')?.classList.remove('active');
                thumbnails[active].classList.add('active');
            }

            function reloadSlider() {
                let newTransformValue = -active * 100 + "%";
                slider.style.transform = "translateX(" + newTransformValue + ")";
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
