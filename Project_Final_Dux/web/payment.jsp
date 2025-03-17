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

            * {
                user-select: none;
                cursor: default;
            }

            input:hover, button:hover, label:hover {
                cursor: pointer;
            }

            .payment {
                padding: 40px 30px;
                display: flex;  
                gap: 40px;
            }

            @media (max-width: 992px) {
                .payment {
                    flex-direction: column;
                    padding: 40px 20px;
                }
            }

            .payment-info {
                display: flex;
                flex-direction: column;
                gap: 30px;
                flex: 2;
            }

            @media (max-width: 992px) {
                .payment-info {
                    width: 100%;
                }
            }

            .deli-info, .payment-method {
                display: flex;
                flex-direction: column;
                gap: 20px;
                background-color: rgba(255, 255, 255, 0.5);
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            }

            .payment-info h2 {
                background-color: rgba(0, 0, 0, 0.1);
                padding: 12px 16px;
                width: 100%;
                border-radius: 4px;
                font-size: 18px;
            }

            .payment-form, .payment-checkbox {
                display: flex;
                flex-direction: column;
                gap: 20px;
                padding: 0 10px;
            }

            .payment-form input {
                width: 100%;
                padding: 12px 16px;
                border-radius: 4px;
                border: 1px solid #ddd;
                transition: border-color 0.3s ease, box-shadow 0.3s ease;
            }

            .payment-form input:focus {
                border-color: #C63F3E;
                box-shadow: 0 0 0 2px rgba(198, 63, 62, 0.2);
            }

            .payment-checkbox div {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .payment-checkbox input[type="checkbox"] {
                width: 18px;
                height: 18px;
                accent-color: #C63F3E;
            }

            .payment-checkbox label {
                font-size: 16px;
            }

            .pay-bill {
                flex: 1;
                display: flex;
                flex-direction: column;
                gap: 20px;
                background-color: #FFF;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                align-self: flex-start;
            }

            .pay-bill h1 {
                border-bottom: 3px solid #1d1d1b;
                padding-bottom: 16px;
                font-size: 24px;
            }

            .bill-items {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .bill-detail {
                display: flex;
                flex-direction: column;
                gap: 8px;
                padding-bottom: 12px;
                border-bottom: 1px dashed rgba(0, 0, 0, 0.1);
            }

            .bill-detail:last-child {
                border-bottom: none;
            }

            .bill-detail div {
                display: flex;
                justify-content: space-between;
            }

            .bill-detail div:first-child {
                font-weight: 600;
            }

            .bill-detail div:last-child {
                color: #666;
                font-size: 14px;
            }

            .pay-price {
                display: flex;
                gap: 12px;
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
                font-size: 18px;
                padding: 10px 0;
            }

            .pay-bill button {
                font-size: 20px;
                text-align: center;
                background-color: #C63F3E;
                color: #FFF;
                padding: 16px 0;
                border-radius: 4px;
                font-weight: 600;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .pay-bill button:hover {
                background-color: #a53332;
                transform: translateY(-2px);
            }

            @media (max-width: 768px) {
                .payment {
                    padding: 20px 15px;
                }

                .pay-bill {
                    padding: 20px;
                    width: 100%;
                }

                .payment-form input {
                    width: 100%;
                }
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
