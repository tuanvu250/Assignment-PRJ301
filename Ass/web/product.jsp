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

            .product-list a:hover{
                color: #C63F3E;
            }


            .product {
                margin: 83px;
                display: flex;
                gap: 60px;
                color: #1d1d1b;
                align-items: flex-start;
            }

            .product-detail {
                display: flex;
                text-align: center;
                gap: 60px;
                flex-wrap: wrap;
            }

            .product-item {
                display: flex;  
                flex-direction: column;
                gap: 4px;
            }

            .product-item p{
                display: block;
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
                align-items: center;
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
                padding-left: 10px;
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

            .product-choice h3.active {
                color: #C63F3E;
            }

            .choice-list {
                display: flex;
                max-height: 0;
                overflow: hidden;
                flex-direction: column;
                gap: 16px;
                margin-left: 40px;
                transition: 300ms ease-in-out;
            }

            .choice-list-color {
                display: flex;
                flex-wrap: wrap;
                gap: 8px;
                overflow: hidden;
                max-height: 0;
                /*                transition: max-height 0.3s ease-in-out, padding 0.3s ease-in-out;*/
            }

            .choice-list-color a {
                display: inline-block;
                height: 30px;
                width: 30px;
                background-color: red;
            }

            .choice-list-color div {
                height: 40px;
                width: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .choice-list.show {
                max-height: 100%;
            }

            .choice-list-color.show {
                max-height: 100%;
            }

            .product-gender a.active {
                color: #C63F3E;
            }

            .choice-list a {
                padding: 4px;
            }

            .choice-list a{
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .choice-list i {
                display: none;
            }

            .choice-list a.active {
                background: rgba(0, 0, 0, 0.1);
            }

            .choice-list a.active i {
                display: inline;
            }

            .choice-list-color div.active{
                border: solid #1d1d1b 2px;
            }

            .product-price {
                display: flex;
                justify-content: space-around;
            }

            .sale-text {
                text-decoration: line-through;
            }

            .img-sale {
                position: relative;
                display: inline-block;
            }

            .label-sale {
                position: absolute;
                top: 40px;
                padding: 4px 8px;
                background-color: #1d1d1b;
                color: #FFF;
            }

            .love-list {
                position: absolute;
                font-size: 35px;
                bottom: 8px;
                right: 20px;
                color: #C63F3E;
            }

            .hover-buy {
                position: absolute;
                bottom: 5px;
                right: 60px;
                left: 60px;
                padding: 12px 8px;
                color: #FFF;
                background-color: #C63F3E;
                opacity: 0;
                transition: 0.6s;
            }

            .div-hover-buy {
                height: 100%;
                width: 100%;
                position: absolute;
                top: 0;
            }

            .img-sale:hover .div-hover-buy{
                background: rgba(0, 0, 0, 0.1);
            }

            .img-sale:hover .hover-buy {
                opacity: 1;
            }

            .product-name {
                font-size: 18px;
                font-weight: 700;
                color: #1d1d1b;
            }

            .product-name:hover {
                color: #C63F3E;
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
                    <h3 class="active toggle-btn">STATUS <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <a>Sale off <i class="fa-solid fa-xmark hidden"></i></a>
                        <a>Pre-order <i class="fa-solid fa-xmark hidden"></i></a>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="active toggle-btn">STYLE <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <a>Low Top <i class="fa-solid fa-xmark"></i></a>
                        <a>High Top <i class="fa-solid fa-xmark"></i></a>
                        <a>Slip-on <i class="fa-solid fa-xmark"></i></a>
                        <a>Mid Top <i class="fa-solid fa-xmark"></i></a>
                        <a>Mule <i class="fa-solid fa-xmark"></i></a>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="active toggle-btn">PRODUCT LINE <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <a>Basas <i class="fa-solid fa-xmark"></i></a>
                        <a>Vintas <i class="fa-solid fa-xmark"></i></a>
                        <a>Urbas <i class="fa-solid fa-xmark"></i></a>
                        <a>Pattas <i class="fa-solid fa-xmark"></i></a>
                        <a>Track 6 <i class="fa-solid fa-xmark"></i></a>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="active toggle-btn">PRICE <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <a>> 600k VND <i class="fa-solid fa-xmark"></i></a>
                        <a>500k - 599k VND <i class="fa-solid fa-xmark"></i></a>
                        <a>400k - 499k VND <i class="fa-solid fa-xmark"></i></a>
                        <a>300k - 399k VND <i class="fa-solid fa-xmark"></i></a>
                        <a>200k - 299k VND <i class="fa-solid fa-xmark"></i></a>
                        <a>< 200k VND <i class="fa-solid fa-xmark"></i></a>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="active toggle-btn">COLLECTION <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <a>Denim <i class="fa-solid fa-xmark"></i></a>
                        <a>Day Slide <i class="fa-solid fa-xmark"></i></a>
                        <a>Public 2000s <i class="fa-solid fa-xmark"></i></a>
                        <a>Vivu <i class="fa-solid fa-xmark"></i></a>
                        <a>Nauda <i class="fa-solid fa-xmark"></i></a>
                        <a>Tomo <i class="fa-solid fa-xmark"></i></a>
                        <a>2.Blues <i class="fa-solid fa-xmark"></i></a>
                        <a>Jazico <i class="fa-solid fa-xmark"></i></a>
                        <a>I.S.E.E <i class="fa-solid fa-xmark"></i></a>
                        <a>Soda Pop <i class="fa-solid fa-xmark"></i></a>
                        <a>LandFforms <i class="fa-solid fa-xmark"></i></a>
                        <a>SC <i class="fa-solid fa-xmark"></i></a>
                        <a>Workaday <i class="fa-solid fa-xmark"></i></a>
                        <a>Evergreen <i class="fa-solid fa-xmark"></i></a>
                        <a>RAW <i class="fa-solid fa-xmark"></i></a>
                        <a>Polka Dots <i class="fa-solid fa-xmark"></i></a>
                        <a>Retrospective <i class="fa-solid fa-xmark"></i></a>
                        <a>Aunter <i class="fa-solid fa-xmark"></i></a>
                        <a>Monoguso <i class="fa-solid fa-xmark"></i></a>
                        <a>Ruler <i class="fa-solid fa-xmark"></i></a>
                        <a>Flannel <i class="fa-solid fa-xmark"></i></a>
                        <a>Class E <i class="fa-solid fa-xmark"></i></a>
                        <a>Love+ <i class="fa-solid fa-xmark"></i></a>
                        <a>OG <i class="fa-solid fa-xmark"></i></a>
                        <a>ALL Suede <i class="fa-solid fa-xmark"></i></a>
                        <a>Corluray <i class="fa-solid fa-xmark"></i></a>
                        <a>Mister <i class="fa-solid fa-xmark"></i></a>
                        <a>Simple Life <i class="fa-solid fa-xmark"></i></a>
                        <a>Mono Black <i class="fa-solid fa-xmark"></i></a>
                        <a>Hook n'Loop <i class="fa-solid fa-xmark"></i></a>
                        <a>Bumper Gum <i class="fa-solid fa-xmark"></i></a>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="active toggle-btn">MATERIAL <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <a>Canvas <i class="fa-solid fa-xmark"></i></a>
                        <a>Suede <i class="fa-solid fa-xmark"></i></a>
                        <a>Leathe <i class="fa-solid fa-xmark"></i></a>
                        <a>Cotton <i class="fa-solid fa-xmark"></i></a>
                        <a>Denim <i class="fa-solid fa-xmark"></i></a>
                        <a>Flannel <i class="fa-solid fa-xmark"></i></a>
                        <a>Corduroy <i class="fa-solid fa-xmark"></i></a>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="active toggle-btn">COLOR <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list-color show">
                        <div>
                            <a></a>
                        </div>
                        <div>
                            <a></a>
                        </div>
                        <div>
                            <a></a>
                        </div>
                        <div>
                            <a></a>
                        </div>
                        <div>
                            <a></a>
                        </div>
                        <div>
                            <a></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-detail">
                <div class="product-item">
                    <div class="img-sale">
                        <h3 class="label-sale">SALE OFF</h3>
                        <a><img src="img/Rectangle_16.jpg"></a>
                        <div class="div-hover-buy">
                            <h3 class="hover-buy">BUY</h3>
                        </div>
                        <a class="love-list" href="#"><i class="fa-regular fa-heart "></i></a>
                    </div>
                    <a href="#" class="product-name">Abc xyz</a>
                    <p>Color</p>
                    <div class="product-price">
                        <p>XXX.XXXVND</p>
                        <p class="sale-text">XXX.XXXVND</p>
                    </div>
                </div>
                <div class="product-item">
                    <div class="img-sale">
                        <h3 class="label-sale">SALE OFF</h3>
                        <a><img src="img/Rectangle_16.jpg"></a>
                        <div class="div-hover-buy">
                            <h3 class="hover-buy">BUY</h3>
                        </div>
                        <a class="love-list" href="#"><i class="fa-regular fa-heart "></i></a>
                    </div>
                    <a href="#" class="product-name">Abc xyz</a>
                    <p>Color</p>
                    <div class="product-price">
                        <p>XXX.XXXVND</p>
                        <p class="sale-text">XXX.XXXVND</p>
                    </div>
                </div>
                <div class="product-item">
                    <div class="img-sale">
                        <h3 class="label-sale">SALE OFF</h3>
                        <a><img src="img/Rectangle_16.jpg"></a>
                        <div class="div-hover-buy">
                            <h3 class="hover-buy">BUY</h3>
                        </div>
                        <a class="love-list" href="#"><i class="fa-regular fa-heart "></i></a>
                    </div>
                    <a href="#" class="product-name">Abc xyz</a>
                    <p>Color</p>
                    <div class="product-price">
                        <p>XXX.XXXVND</p>
                        <p class="sale-text">XXX.XXXVND</p>
                    </div>
                </div>
                <div class="product-item">
                    <div class="img-sale">
                        <h3 class="label-sale">SALE OFF</h3>
                        <a><img src="img/Rectangle_16.jpg"></a>
                        <div class="div-hover-buy">
                            <h3 class="hover-buy">BUY</h3>
                        </div>
                        <a class="love-list" href="#"><i class="fa-regular fa-heart "></i></a>
                    </div>
                    <a href="#" class="product-name">Abc xyz</a>
                    <p>Color</p>
                    <div class="product-price">
                        <p>XXX.XXXVND</p>
                        <p class="sale-text">XXX.XXXVND</p>
                    </div>
                </div>
                <div class="product-item">
                    <div class="img-sale">
                        <h3 class="label-sale">SALE OFF</h3>
                        <a><img src="img/Rectangle_16.jpg"></a>
                        <div class="div-hover-buy">
                            <h3 class="hover-buy">BUY</h3>
                        </div>
                        <a class="love-list" href="#"><i class="fa-regular fa-heart "></i></a>
                    </div>
                    <a href="#" class="product-name">Abc xyz</a>
                    <p>Color</p>
                    <div class="product-price">
                        <p>XXX.XXXVND</p>
                        <p class="sale-text">XXX.XXXVND</p>
                    </div>
                </div>
            </div>
        </div>
        <%@include file = "footer.jsp" %>
        <script>
            document.querySelectorAll(".toggle-btn").forEach(button => {
                button.addEventListener("click", function () {
                    let parent = this.closest(".product-choice"); // Tìm div cha gần nhất
                    let choiceList = parent.querySelector(".choice-list"); // Chọn đúng dropdown trong div cha
                    let icon = parent.querySelector("i"); // `this` là icon đang bấm
                    let title = parent.querySelector("h3");

                    choiceList.classList.toggle("show");
                    title.classList.toggle("active");

                    // Đổi icon giữa chevron-down và chevron-up
                    if (choiceList.classList.contains("show")) {
                        icon.classList.replace("fa-chevron-down", "fa-chevron-up");
                    } else {
                        icon.classList.replace("fa-chevron-up", "fa-chevron-down");
                    }
                });
            });

            document.querySelectorAll(".toggle-btn").forEach(button => {
                button.addEventListener("click", function () {
                    let parent = this.closest(".product-choice"); // Tìm div cha gần nhất
                    let choiceList = parent.querySelector(".choice-list-color"); // Chọn đúng dropdown trong div cha
                    let icon = parent.querySelector("i"); // `this` là icon đang bấm
                    let title = parent.querySelector("h3");

                    choiceList.classList.toggle("show");
                    title.classList.toggle("active");

                    // Đổi icon giữa chevron-down và chevron-up
                    if (choiceList.classList.contains("show")) {
                        icon.classList.replace("fa-chevron-down", "fa-chevron-up");
                    } else {
                        icon.classList.replace("fa-chevron-up", "fa-chevron-down");
                    }
                });
            });

            document.querySelectorAll(".love-list").forEach(link => {
                link.addEventListener("click", function () {
                    let icon = this.querySelector("i");
                    event.preventDefault();
                    this.classList.toggle("added");

                    if (this.classList.contains("added")) {
                        icon.classList.replace("fa-regular", "fa-solid");
                    } else {
                        icon.classList.replace("fa-solid", "fa-regular");
                    }
                });
            });

            document.querySelectorAll(".product-gender a").forEach(link => {
                link.addEventListener("click", function () {
                    document.querySelectorAll(".product-gender a").forEach(item => item.classList.remove("active"));

                    this.classList.add("active");
                });
            });

            document.querySelectorAll(".choice-list a").forEach(link => {
                link.addEventListener("click", function () {
                    this.classList.toggle("active");
                });
            });

            document.querySelectorAll(".choice-list-color div").forEach(link => {
                link.addEventListener("click", function () {
                    this.classList.toggle("active");
                });
            });
        </script>
    </body>
</html>
