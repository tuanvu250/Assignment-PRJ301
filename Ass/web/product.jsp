<%-- 
    Document   : product
    Created on : Mar 6, 2025, 9:20:36 PM
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

            *{
                user-select: none;
                cursor: default;
            }

            input:hover {
                cursor:text;
            }
            
            .product-list a:hover{
                color: #C63F3E;
            }
            

            .product {
                margin: 83px;
                display: flex;
                gap: 60px;
                color: #1d1d1b;
            }

            .product-detail {
                display: flex;
                flex-direction: column;
            }

            .product-row {
                display: flex;
                gap: 60px;
            }
            
            .product-row a {
                text-align: center;
            }

            .product-list {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .product-gender {
                display: flex;
                gap: 10px;
                font-size: 20px;
                font-weight: 700;
                border-bottom: solid 3px #1d1d1b;
                padding-bottom: 12px;
                justify-content: center;
                padding-left: 10px;
                padding-right: 10px;
            }

            .product-gender a {
                border-right: 3px solid #1d1d1b;
                padding-right: 10px;
            }

            .product-gender a:last-child{
                border: none;
                padding-right: 0;
            }

            .product-choice {
                padding-left: 20px;
                display: flex;
                flex-direction: column;
                gap: 16px;
                border-bottom: #1d1d1b dashed 1px;
                width: 100%;
                padding-bottom: 16px;
            }

            .product-choice h3 {
                font-size: 20px;
            }

            .choice-list {
                display: flex;
                max-height: 0;
                overflow: hidden;
                flex-direction: column;
                gap: 16px;
                margin-left: 40px;
                transition: max-height 0.3s ease-in-out, padding 0.3s ease-in-out;
            }

            .choice-list.show {
                max-height: 100%;
            }
            
            .choice-list a:visited {
                background: rgba(0, 0, 0, 0.1);
            }

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
    </head>
    <body>
        <%@include file = "header.jsp" %>
        <div class="product">
            <div class="product-list">
                <div class="product-gender">
                    <a>ALL</a>
                    <a>MALE</a>
                    <a>FEMALE</a>
                </div>
                <div class="product-choice">    
                    <h3>STATUS <i class="fa-solid fa-chevron-down toggle-btn"></i></h3>
                    <div class="choice-list">
                        <a>Sale off</a>
                        <a>Pre-order</a>
                    </div>
                </div>
                <div class="product-choice">
                    <h3>STYLE <i class="fa-solid fa-chevron-down toggle-btn"></i></h3>
                    <div class="choice-list">
                        <a>Low Top</a>
                        <a>High Top</a>
                        <a>Slip-on</a>
                        <a>Mid Top</a>
                        <a>Mule</a>
                    </div>
                </div>

            </div>
            <div class="product-detail">
                <div class="product-row">
                    <a class="product-item">
                        <img src="img/Rectangle_16.jpg">
                        <p>abc xyz  </p>
                        <p>Color</p>
                        <div class="product-price">
                            <p>XXX.XXXVND</p>
                        </div>
                    </a>
                    <a class="product-item">
                        <img src="img/Rectangle_16.jpg">
                        <p>abc xyz  </p>
                        <p>Color</p>
                        <div class="product-price">
                            <p>XXX.XXXVND</p>
                        </div>
                    </a>
                    <a class="product-item">
                        <img src="img/Rectangle_16.jpg">
                        <p>abc xyz  </p>
                        <p>Color</p>
                        <div class="product-price">
                            <p>XXX.XXXVND</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <%@include file = "footer.jsp" %>
        <script>
            document.querySelectorAll(".toggle-btn").forEach(button => {
                button.addEventListener("click", function () {
                    let parent = this.closest(".product-choice"); // Tìm div cha gần nhất
                    let choiceList = parent.querySelector(".choice-list"); // Chọn đúng dropdown trong div cha
                    let icon = this; // `this` là icon đang bấm

                    choiceList.classList.toggle("show");

                    // Đổi icon giữa chevron-down và chevron-up
                    if (choiceList.classList.contains("show")) {
                        icon.classList.replace("fa-chevron-down", "fa-chevron-up");
                    } else {
                        icon.classList.replace("fa-chevron-up", "fa-chevron-down");
                    }
                });
            });


        </script>
    </body>
</html>
