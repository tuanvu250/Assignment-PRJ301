<%-- 
    Document   : summaryPayment
    Created on : Mar 25, 2025, 5:54:43 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Summary Payment</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/summaryPayment.css">
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <div class="container">
            <div class="header">
                <h1>Thank you for your order at Bloom On Foot!</h1>
            </div>

            <div class="order-details">
                <div class="detail-row">
                    <span class="label">Order ID:</span>
                    <span class="value">#12345</span>
                </div>
                <div class="detail-row">
                    <span class="label">Estimated Delivery:</span>
                    <span class="value">3-5 days</span>
                </div>
                <div class="detail-row">
                    <span class="label">Payment Status:</span>
                    <span class="value">Paid / Pending</span>
                </div>
                <div class="detail-row">
                    <span class="label">Total Amount:</span>
                    <span class="value">$XX.XX</span>
                </div>
            </div>

            <div class="message">
                Your order has been successfully placed. You will receive an email confirmation shortly.
            </div>

            <div class="buttons">
                <a href="#" class="btn">Back to Home</a>
                <a href="#" class="btn btn-secondary">View Order Details</a>
            </div>
        </div>
        <%@include file="../includes/footer.jsp" %>
    </body>
</html>
