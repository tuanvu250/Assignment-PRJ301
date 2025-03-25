<%-- 
    Document   : orderDetail
    Created on : Mar 25, 2025, 6:07:01 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Detail</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/orderDetail.css">
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <div class="container">
            <div class="header">
                <h1>Order Details</h1>
                <div class="order-id">Order ID: #12345</div>
            </div>

            <div class="section">
                <h2>Customer Information</h2>
                <div class="info-grid">
                    <div class="info-item">
                        <span class="label">Full Name:</span>
                        <span class="value">John Doe</span>
                    </div>
                    <div class="info-item">
                        <span class="label">Phone:</span>
                        <span class="value">+1 (555) 123-4567</span>
                    </div>
                    <div class="info-item">
                        <span class="label">Email:</span>
                        <span class="value">john.doe@example.com</span>
                    </div>
                    <div class="info-item">
                        <span class="label">Payment Method:</span>
                        <span class="value">Credit Card (Visa ****1234)</span>
                    </div>
                </div>
                <div class="info-item" style="margin-top: 10px;">
                    <span class="label">Address:</span>
                    <span class="value">123 Main Street, Apt 4B, New York, NY 10001, United States</span>
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
                        <tr>
                            <td>Premium Cotton T-Shirt</td>
                            <td>Navy Blue</td>
                            <td>Medium</td>
                            <td>2</td>
                            <td>$29.99</td>
                        </tr>
                        <tr>
                            <td>Slim Fit Jeans</td>
                            <td>Dark Wash</td>
                            <td>32x30</td>
                            <td>1</td>
                            <td>$49.99</td>
                        </tr>
                        <tr>
                            <td>Leather Belt</td>
                            <td>Brown</td>
                            <td>Medium</td>
                            <td>1</td>
                            <td>$24.99</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="section">
                <h2>Order Summary</h2>
                <div class="order-summary">
                    <div class="summary-row">
                        <span>Subtotal:</span>
                        <span>$134.96</span>
                    </div>
                    <div class="summary-row">
                        <span>Shipping:</span>
                        <span>$5.99</span>
                    </div>
                    <div class="summary-row">
                        <span>Discount:</span>
                        <span class="discount">-$13.50</span>
                    </div>
                    <div class="summary-row">
                        <span>Total Order:</span>
                        <span>$127.45</span>
                    </div>
                </div>
            </div>

            <div class="buttons">
                <a href="#" class="btn">Back to Home</a>
                
            </div>
        </div>
        <%@include file="../includes/footer.jsp" %>
    </body>
</html>
