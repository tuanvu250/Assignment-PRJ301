<%-- 
    Document   : summaryPayment
    Created on : Mar 25, 2025, 5:54:43 PM
    Author     : ADMIN
--%>

<%@page import="dto.OrderDTO"%>
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
        <%
            if(request.getAttribute("order") != null) {
                OrderDTO order = (OrderDTO)request.getAttribute("order");
        %>
        <div class="container">
            <div class="header">
                <h1>Thank you for your order at Bloom On Foot!</h1>
            </div>
            
            <div class="order-details">
                <div class="detail-row">
                    <span class="label">Order ID:</span>
                    <span class="value">#<%=order.getOrder_id()%></span>
                </div>
                <div class="detail-row">
                    <span class="label">Estimated Delivery:</span>
                    <span class="value">3-5 days</span>
                </div>
                <div class="detail-row">
                    <span class="label">Payment Status:</span>
                    <span class="value"><%=order.getStatus()%></span>
                </div>
                <div class="detail-row">
                    <span class="label">Total Amount:</span>
                    <span class="value"><%=currencyVN.format(order.getTotal_price())%></span>
                </div>
            </div>

            <div class="buttons">
                <a href="<%= request.getContextPath()%>/home/home.jsp"
                   class="btn">Back to Home</a>
                <a href="<%= request.getContextPath()%>/OrderController?action=orderDetail&orderId=<%=order.getOrder_id()%>" 
                   class="btn btn-secondary">View Order Details</a>
            </div>
        </div> <%}%>
        <%@include file="../includes/footer.jsp" %>
    </body>
</html>
