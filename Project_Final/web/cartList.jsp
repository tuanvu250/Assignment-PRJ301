<%-- 
    Document   : cartList
    Created on : Mar 8, 2025, 11:54:55 AM
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

            .favourite h1 {
                text-align: center;
                margin-bottom: 20px;    
            }

            .favourite-container {
                display: flex;
                flex-direction: column;
            }

            .favourite-item {
                display: flex;
                gap: 28px;
                justify-content: center;
                align-items: center;
                padding: 30px 0;
            }

            .favourite-info {
                display: flex;
                flex-direction: column;
                gap: 22px;
                justify-content: flex-start;
                flex: 2;
            }

            .favourite-price {
                display: flex;
                gap: 30px;
            }

            .sale-price {
                text-decoration: line-through;
                color: graytext;
            }

            .favourite-choice {
                display: flex;
                gap: 20px;
                align-items: flex-end;
            }

            .favourite-color {
                display: flex;
                gap: 8px;
            }

            .favourite-color a{
                display: inline-block;
                height: 30px;
                width: 30px;
                background-color: red;  
            }

            .favourite-color div {
                height: 40px;
                width: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .favourite-size{
                display: flex;
                flex-direction: column;
                gap: 4px;
            }

            .favourite-size select {
                font-size: 18px;
                width: 80px;
                height: 40px;
                text-align: center;
            }

            .favourite-btn {
                display: flex;
                flex-direction: column;
                gap: 16px;
                text-align: center;
            }

            .favourite-btn a {
                padding: 8px 16px;
                font-size: 18px;
                width: 100px;
            }

            .favourite-cart {
                background-color: #EAE4DA;
                color: #1d1d1b;
                border: 2px solid #1d1d1b;
            }

            .favourite-delete {
                background-color: #1d1d1b;
                color: #EAE4DA;
            }

            .favourite-name {
                font-size: 18px;
                color: #1d1d1b;
                font-weight: 600;
            }

            .favourite-name:hover {
                color: #C63F3E;
            }

            .favourite-item {
                border-bottom: dashed #1d1d1b 1px;
            }

            .favourite-item:last-of-type {
                border-bottom: solid #1d1d1b 2px;
            }


            .favourite-item:first-child {
                border-top: solid #1d1d1b 2px;
            }

            .favourite-btn a:hover {
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .favourite-footer {
                margin-top: 40px;
                display: flex;
                justify-content: space-between;
                text-align: center;
            }

            .favourite-footer a{
                width: 10vw;
                color: #EAE4DA;
                background-color: #1d1d1b;
                padding: 16px 0;
            }

            .favourite-footer a:hover{
                background-color: #C63F3E;
            }

            .cart {
                display: flex;
                margin: 80px;
                gap: 40px;
            }

            .cart-bill h1 {
                border-bottom: 3px solid #1d1d1b;
                padding-bottom: 16px;
            }

            .cart-bill {
                background-color: #FFF;
                width: 100%;
                padding: 20px 40px;
                display: flex;
                flex-direction: column;
                gap: 32px;
                align-self: flex-start;
            }

            .cart-bill form {
                display: flex;
                gap: 20px;
            }

            .discount-code {
                width: 100%;
                padding: 8px 16px;
                border: solid #1d1d1b 2px;
                text-transform: uppercase;
            }

            .discount-btn {
                padding: 8px 16px;
                color: #FFF;
                background-color: #1d1d1b;
                font-weight: 600;
            }

            .cart-price {
                display: flex;
                flex-direction: column;
                gap: 16px;
                padding: 20px 0;
                border-top: dashed 1px #1d1d1b;
                border-bottom: dashed 1px #1d1d1b;
            }

            .cart-price div {
                display: flex;
                justify-content: space-between;
            }

            .cart-total {
                display: flex;
                justify-content: space-between;
            }

            .cart-btn {
                font-size: 25px;
                text-align: center;
                background-color: #C63F3E;
                color: #FFF;
                padding: 20px 0;
            }

            .favourite-cart.added {
                background-color: #C63F3E;
            }

            .favourite-color div.added {
                border: solid 2px #1d1d1b;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="cart">
            <div class="favourite">
                <h1>CART</h1>
                <div class="favourite-container">
                    <div class="favourite-item">
                        <img src="img/Rectangle_43.png">
                        <div class="favourite-info">
                            <a href="#" class="favourite-name">Abc xyz</a>
                            <div class="favourite-price">
                                <p>XXX.XXX VND</p>
                                <p class="sale-price">XXX.XXX VND</p>
                            </div>
                            <div class="favourite-choice">
                                <div class="favourite-color">
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
                                <div class="favourite-size">
                                    <label>Size</label>
                                    <select>
                                        <option selected hidden></option>
                                        <option>35</option>
                                        <option>36</option>
                                        <option>37</option>
                                    </select>
                                </div>
                                <div class="favourite-size">
                                    <label>Quantity</label>
                                    <select>
                                        <option selected hidden></option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="favourite-btn">
                            <a class="favourite-cart"><i class="fa-regular fa-heart"></i></a>
                            <a class="favourite-delete"><i class="fa-solid fa-trash"></i></a>
                        </div>
                    </div>
                    <div class="favourite-item">
                        <img src="img/Rectangle_43.png">
                        <div class="favourite-info">
                            <a href="#" class="favourite-name">Abc xyz</a>
                            <div class="favourite-price">
                                <p>XXX.XXX VND</p>
                                <p class="sale-price">XXX.XXX VND</p>
                            </div>
                            <div class="favourite-choice">
                                <div class="favourite-color">
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
                                <div class="favourite-size">
                                    <label>Size</label>
                                    <select>
                                        <option selected hidden></option>
                                        <option>35</option>
                                        <option>36</option>
                                        <option>37</option>
                                    </select>
                                </div>
                                <div class="favourite-size">
                                    <label>Quantity</label>
                                    <select>
                                        <option selected hidden></option>
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="favourite-btn">
                            <a class="favourite-cart"><i class="fa-regular fa-heart"></i></a>
                            <a class="favourite-delete"><i class="fa-solid fa-trash"></i></a>
                        </div>
                    </div>
                </div>
                <div class="favourite-footer">
                    <a>Clear All</a>
                    <a>Back to product</a>
                </div>

            </div>
            <div class="cart-bill">
                <h1>BILL</h1>
                <form>
                    <input type="text" placeholder="DISCOUNT CODE" class="discount-code">
                    <input type="submit" class="discount-btn" value="APPLY">
                </form>
                <div class="cart-price">
                    <div>
                        <p>Order</p>
                        <p>XXX.XXX VND</p>
                    </div>
                    <div>
                        <p>Discount</p>
                        <p>XXX.XXX VND</p>
                    </div>
                </div>
                <div class="cart-total">
                    <h3>Temporary total</h3>
                    <p>X.XXX.XXX VND</p>
                </div>
                <a class="cart-btn">CONTINUE</a>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script>
            document.querySelectorAll(".favourite-cart").forEach(link => {
                link.addEventListener("click", function () {
                    this.classList.toggle("added");
                });
            });
            document.querySelectorAll(".favourite-color div").forEach(link => {
                link.addEventListener("click", function () {
                    this.classList.toggle("added");
                });
            });
        </script>
    </body>
</html>
