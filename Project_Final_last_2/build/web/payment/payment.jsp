<%-- 
    Document   : payment
    Created on : Mar 8, 2025, 1:48:18 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/payment.css">    
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
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
        <%@include file="../includes/footer.jsp" %>
    </body>
</html>
