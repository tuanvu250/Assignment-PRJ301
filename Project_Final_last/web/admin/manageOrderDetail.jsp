<%-- 
    Document   : manageOrderDetail
    Created on : Mar 26, 2025, 10:31:09 AM
    Author     : ADMIN
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="utils.AuthUtils"%>
<%@page import="dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.OrderDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/orderDetail.css">
    </head>
    <body>
        <%
            if (request.getAttribute("order") != null && request.getAttribute("listOD") != null) {
                OrderDTO order = (OrderDTO) request.getAttribute("order");
                List<CartDTO> listOD = (List<CartDTO>) request.getAttribute("listOD");
                NumberFormat currencyVN = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
        %>
        <div class="container">
            <div class="header">
                <h1>Order Details</h1>
                <div class="order-id">Order ID: #<%=order.getOrder_id()%></div>
                <div class="order-id">Date: <%=order.getDate_ordered()%></div>
            </div>

            <div class="section">
                <h2>Customer Information</h2>
                <div class="info-grid">
                    <div class="info-item">
                        <span class="label">Full Name:</span>
                        <span class="value"><%=order.getFullName()%></span>
                    </div>
                    <div class="info-item">
                        <span class="label">Phone:</span>
                        <span class="value"><%=order.getPhone()%></span>
                    </div>
                    <div class="info-item">
                        <span class="label">Email:</span>
                        <span class="value"><%=order.getEmail()%></span>
                    </div>
                    <div class="info-item">
                        <span class="label">Payment Method:</span>
                        <span class="value"><%=order.getMethod_pay()%></span>
                    </div>
                    <div class="info-item">
                        <span class="label">Address:</span>
                        <span class="value"><%=order.getAddress()%></span>
                    </div>
                    <div class="info-item">
                        <span class="label">Status:</span>
                        <span class="value"><%=order.getStatus()%></span>
                    </div>
                </div>

            </div>

            <div class="section">
                <h2>Product Details</h2>
                <table class="product-table">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (CartDTO elem : listOD) {
                        %>
                        <tr>
                            <td><%=AuthUtils.nameShoes(elem.getShoes_id())%></td>
                            <td><%=AuthUtils.nameColor(elem.getColor_id())%></td>
                            <td><%=AuthUtils.sizeNum(elem.getSize_id())%></td>
                            <td><%=elem.getQuantity()%></td>
                            <td><%=currencyVN.format(elem.getPrice())%></td>
                        </tr> <%}%>
                    </tbody>
                </table>
            </div>

            <div class="section">
                <h2>Order Summary</h2>
                <div class="order-summary">
                    <div class="summary-row">
                        <span>Subtotal:</span>
                        <span><%=currencyVN.format(order.getSubtotal())%></span>
                    </div>
                    <div class="summary-row">
                        <span>Discount:</span>
                        <span class="discount">-<%=currencyVN.format(order.getDiscount())%></span>
                    </div>
                    <div class="summary-row">
                        <span>Total Order:</span>
                        <span><%=currencyVN.format(order.getTotal_price())%></span>
                    </div>
                </div>
            </div>

            <div class="buttons">
                <a href="<%= request.getContextPath()%>/OrderController?action=manageOrders"
                   class="btn">Cancel</a>
            </div>
        </div> <%}%>
    </body>
</html>
