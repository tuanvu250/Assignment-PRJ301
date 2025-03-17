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
                user-select: none;
                cursor: default;
            }

            body {
                background-color: #EAE4DA;
                color: #1d1d1b;
            }

            input:hover, select:hover {
                cursor: text;
            }

            a, button {
                cursor: pointer;
            }

            /* Product Navigation */
            .product-link {
                display: flex;
                gap: 15px;
                margin: 0 6% 0;
                margin-top: 40px;
                border-bottom: solid 2px #1d1d1b;
                padding-bottom: 10px;
            }

            .product-link a {
                border-right: solid 2px #1d1d1b;
                padding-right: 15px;
                color: #1d1d1b;
                transition: color 0.3s ease;
            }

            .product-link a:hover {
                color: #C63F3E;
            }

            .product-link a:last-child {
                border: none;
            }

            /* Main Container */
            .detail-container {
                display: flex;  
                padding: 40px 6%;
                gap: 40px;
                max-width: 1400px;
                margin: 0 auto;
            }

            @media (max-width: 992px) {
                .detail-container {
                    flex-direction: column;
                    padding: 30px 4%;
                }
            }

            /* Image Slider */
            .slider-container {
                width: 100%;
                max-width: 600px;
                flex: 1;
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            .img-slider {
                position: relative;
                width: 100%;
                border-radius: 4px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .img-list {
                display: flex;
                transition: transform 0.5s ease;
            }

            .img-list div {
                min-width: 100%;
            }

            .img-list img {
                width: 100%;
                display: block;
            }

            /* Slider Navigation Buttons */
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
                width: 40px;
                height: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            .img-btn button:hover {
                background: rgba(0, 0, 0, 0.7);
                transform: scale(1.1);
            }

            /* Thumbnails */
            .thumnails {
                display: flex;
                justify-content: center;
                gap: 10px;
                margin-top: 10px;
            }

            .thumnails li {
                cursor: pointer;
                width: 70px;
                height: 70px;
                overflow: hidden;
                border-radius: 4px;
            }

            .thumnails img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                opacity: 0.5;
                transition: opacity 0.3s ease, transform 0.3s ease;
            }

            .thumnails li:hover img {
                opacity: 0.8;
                transform: scale(1.05);
            }

            .thumnails img.active {
                opacity: 1;
                border: 2px solid #1d1d1b;
            }

            /* Product Details */
            .detail-info {
                display: flex;
                flex-direction: column;
                gap: 30px;
                flex: 1;
            }

            .detail-text {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            .detail-text h2 {
                font-size: 24px;
                font-weight: 700;
            }

            .detail-text p {
                font-size: 16px;
                display: flex;
                justify-content: space-between;
                max-width: 200px;
            }

            /* Color Selection */
            .detail-color {
                display: flex;
                gap: 15px;
                border-bottom: dashed 2px #1d1d1b;
                border-top: dashed 2px #1d1d1b;
                padding: 20px 0;
            }

            .detail-color div {
                height: 40px;
                width: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 50%;
                transition: transform 0.3s ease;
            }

            .detail-color div:hover {
                transform: scale(1.1);
            }

            .detail-color a {
                display: inline-block;
                height: 30px;
                width: 30px;
                border-radius: 50%;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            /* Size and Quantity */
            .detail-btn {
                display: flex;
                flex-direction: column;
                gap: 25px;
            }

            .size-quantity {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
                gap: 20px;
            }

            .btn-size, .btn-quantity {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .btn-size label, .btn-quantity label {
                font-weight: 600;
            }

            .btn-size select, .btn-quantity select {
                width: 120px;
                height: 40px;
                font-size: 16px;    
                text-align: center;
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 0 10px;
                cursor: pointer;
            }

            .btn-size select:focus, .btn-quantity select:focus {
                border-color: #C63F3E;
            }

            /* Action Buttons */
            .detail-cart {
                height: 100%;
                display: flex;
                gap: 15px;
            }

            .detail-cart a {
                font-size: 16px;
                font-weight: 600;
                height: 50px;
                background-color: #1d1d1b;
                color: #FFF;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 4px;
                transition: background-color 0.3s ease, transform 0.3s ease;
            }

            .detail-cart a:first-child {
                width: 80%;
            }

            .detail-cart a:last-child {
                width: 50px;
            }

            .detail-cart a:hover {
                background-color: #333;
                transform: translateY(-2px);
            }

            .order-now {
                display: flex;
                justify-content: center;
            }

            .order-now a {
                font-size: 18px;
                font-weight: 700;
                width: 100%;
                height: 60px;
                background-color: #C63F3E;
                color: #FFF;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 4px;
                transition: background-color 0.3s ease, transform 0.3s ease;
                letter-spacing: 1px;
            }

            .order-now a:hover {
                background-color: #b53635;
                transform: translateY(-2px);
            }

            /* Product Information */
            .info-detail {
                display: flex;
                flex-direction: column;
                gap: 15px;
                border-bottom: solid 2px #1d1d1b;
                padding-bottom: 15px;
            }

            .info-detail h3 {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 18px;
                cursor: pointer;
                padding: 10px 0;
                transition: color 0.3s ease;
            }

            .info-detail h3:hover {
                color: #C63F3E;
            }

            .info-detail h3.active {
                color: #C63F3E;
            }

            .info-detail div {
                display: flex;
                flex-direction: column;
                gap: 10px;
                overflow: hidden;
                max-height: 0;
                transition: max-height 0.5s ease;
            }

            .info-detail p {
                padding-left: 20px;
                line-height: 1.5;
            }

            .info-detail img {
                max-width: 100%;
                border-radius: 4px;
                margin-top: 10px;
            }

            .info-detail div.show {
                max-height: 1000px;
            }

            /* Responsive Adjustments */
            @media (max-width: 768px) {
                .detail-cart {
                    flex-direction: column;
                    gap: 10px;
                }

                .detail-cart a:first-child {
                    width: 100%;
                }

                .detail-cart a:last-child {
                    width: 100%;
                }

                .size-quantity {
                    flex-direction: column;
                }

                .btn-size select, .btn-quantity select {
                    width: 100%;
                }
            }

            @media (max-width: 480px) {
                .thumnails li {
                    width: 50px;
                    height: 50px;
                }

                .product-link {
                    flex-wrap: wrap;
                }
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="product-link">
            <a>Product</a>
            <a>Product line</a>
            <a>Product Name</a>
        </div>
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
                <div class="info-detail">
                    <h3 class="">Product infomation <i class="fa-solid fa-chevron-down"></i></h3>
                    <div>
                        <p>abc xyz</p>
                        <p>abc xyz</p>
                        <p>abc xyz</p>
                        <p>abc xyz</p>
                        <img src="img/info-table.jpg">
                    </div>
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

            // Add this at the end of your script section
            document.querySelector(".info-detail h3").addEventListener("click", function () {
                let infoDiv = this.parentElement.querySelector("div");
                let icon = this.querySelector("i");

                infoDiv.classList.toggle("show");
                this.classList.toggle("active");

                if (infoDiv.classList.contains("show")) {
                    icon.classList.replace("fa-chevron-down", "fa-chevron-up");
                } else {
                    icon.classList.replace("fa-chevron-up", "fa-chevron-down");
                }
            });
        </script>
    </body>
</html>
