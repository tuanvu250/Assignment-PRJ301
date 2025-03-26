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
        <style>
            input, textarea, select {
                width: 300px;
                border: initial;
                border: 1px #1d1d1b solid;
                padding: 4px 8px;
                border-radius: 10px;
                font-size: 15px;
            }
        </style>
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
        <form class="container" action="<%= request.getContextPath()%>/OrderController">
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
                        <input class="value" value="<%=order.getFullName()%>" name="fullName" required/>
                    </div>
                    <div class="info-item">
                        <span class="label">Phone:</span>
                        <input class="value" value="<%=order.getPhone()%>" name="phone" required/>
                    </div>
                    <div class="info-item">
                        <span class="label">Email:</span>
                        <input class="value" value="<%=order.getEmail()%>" name="email" required/>
                    </div>
                    <div class="info-item">
                        <span class="label">Payment Method:</span>
                        <select class="value" name="paymentMethod">
                            <option value="Online" <%if (order.getMethod_pay().equals("Online")) {%> selected<%}%>
                                    >Online</option>
                            <option value="Offline" <%if (order.getMethod_pay().equals("Offline")) {%> selected<%}%>
                                    >Offline</option>
                        </select>
                    </div>
                    <div class="info-item">
                        <span class="label">Address:</span>
                        <textarea class="value" name="address" required><%=order.getAddress()%></textarea>
                    </div>
                    <div class="info-item">
                        <span class="label">Status:</span>
                        <select class="value" name="status">
                            <option <%if (order.getStatus().equals("Pending")) {%> selected hidden <%}%>
                                                                                   value="Pending" >Pending</option>
                            <option <%if (order.getStatus().equals("Processing")) {%> selected hidden<%}%> 
                                                                                      value="Processing" >Processing</option>
                            <option <%if (order.getStatus().equals("Shipped")) {%> selected hidden<%}%>
                                                                                   value="Shipped" >Shipped</option>
                            <option <%if (order.getStatus().equals("Delivered")) {%> selected hidden<%}%>
                                                                                     value="Delivered" >Delivered</option>
                            <option <%if (order.getStatus().equals("Cancelled")) {%> selected hidden<%}%>
                                                                                     value="Cancelled" >Canceled</option>
                        </select>
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
                    <input type="hidden" name="action" value="updateDetail"/>
                    <input type="hidden" name="orderId" value="<%=order.getOrder_id()%>" />
            <div class="buttons">
                <a href="<%= request.getContextPath()%>/OrderController?action=manageOrders"
                   style="color: #1d1d1b; background-color: #ddd" class="btn">Cancel</a>
                   <button class="btn" style="font-size: 15px" type="submit">Update</button>
            </div>
        </form> <%}%>
    </body>
</html>
