<%-- 
    Document   : payment
    Created on : Mar 8, 2025, 1:48:18 PM
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

            .payment {
                padding: 80px 30px;
                display: flex;  
                gap: 40px;
            }

            .payment-info {
                display: flex;
                flex-direction: column;
                gap: 20px;
                width: 70vw;
            }

            .deli-info, .payment-method {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .payment-info h2{
                background-color: rgba(0,0,0,0.1);
                padding: 8px 10px;
                width: 100%;
            }

            .payment-form , .payment-checkbox{
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .payment-form input{
                width: 80%;
                padding: 8px 10px;
            }

            .pay-bill {
                width: 100%;
                display: flex;
                flex-direction: column;
                gap: 20px;
                background-color: #FFF;
                padding: 20px 40px;  
            }

            .pay-bill h1 {
                border-bottom: 3px solid #1d1d1b;
                padding-bottom: 16px;
            }

            .bill-detail {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .bill-detail div {
                display: flex;
                justify-content: space-between;
            }

            .pay-price {
                display: flex;
                gap: 8px;
                flex-direction: column;
                padding: 20px 0;
                border-top: dashed 1px #1d1d1b;
                border-bottom: dashed 1px #1d1d1b;
            }

            .pay-price div {
                display: flex;
                justify-content: space-between;
            }

            .pay-total {
                display: flex;
                justify-content: space-between;
            }

            .pay-bill button {
                font-size: 25px;
                text-align: center;
                background-color: #C63F3E;
                color: #FFF;
                padding: 20px 0;
            }
            
            .bill-items {
                display: flex;
                flex-direction: column;
                gap: 12px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="payment">
            <form class="payment-info" id="thisform">
                <div class="deli-info">
                    <h2>DELIVERY INFORMATION</h2>
                    <div class="payment-form" >
                        <input type="text" placeholder="FULL NAME"/>
                        <input type="tel" placeholder="Phone number"/>
                        <input type="email" placeholder="Email"/>
                        <input type="text" placeholder="Address"/>
                    </div>
                </div>
                <div class="payment-method">
                    <h2>PAYMENT METHOD</h2>
                    <div class="payment-checkbox">
                        <div>
                            <input type="checkbox" id="offline"/>
                            <label for="offline">Cash on Delivery</label>
                        </div>
                        <div>
                            <input type="checkbox" id="online"/>
                            <label for="online">Crebit / Debit Card / Smart Banking</label>
                        </div>
                    </div>
                </div>
            </form>
            <div class="pay-bill">
                <h1>BILL</h1>
                <div class="bill-items">
                    <div class="bill-detail">
                        <div>
                            <p>ABC XYZ</p>
                            <p>XXX.XXX VND</p>
                        </div>
                        <div>
                            <p>Color, Size XX</p>
                            <p> x2 </p>
                        </div>
                    </div>
                    <div class="bill-detail">
                        <div>
                            <p>ABC XYZ</p>
                            <p>XXX.XXX VND</p>
                        </div>
                        <div>
                            <p>Color, Size XX</p>
                            <p> x1 </p>
                        </div>
                    </div>
                </div>
                <div class="pay-price">
                    <div>
                        <p>Order</p>
                        <p>XXX.XXX VND</p>
                    </div>
                    <div>
                        <p>Discount</p>
                        <p>- XXX.XXX VND</p>
                    </div>
                    <div>
                        <p>Shipping charges</p>
                        <p>XXX.XXX VND</p>
                    </div>
                </div>
                <div class="pay-total">
                    <h3>TOTAL</h3>
                    <p>X.XXX.XXX VND</p>
                </div>
                <button form="thisform">COMPLETE ORDER</button>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
