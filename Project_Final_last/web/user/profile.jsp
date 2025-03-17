<%-- 
    Document   : profile
    Created on : Mar 11, 2025, 4:10:13 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/profile.css">    

    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <div class="profile">
            <div class="profile-left">
                <form>
                    <h2>Profile picture</h2>
                    <img src="../assets/img/img-users/avt-user-test.jpg" alt="User Profile Picture">
                    <input type="file" name="file" accept="image/*">
                    <button type="submit">Update your picture</button>
                </form>
                <div class="history-nav">
                    <a href="#" id="showHistory">History orders</a>
                </div>
            </div>
            <div class="profile-right">
                <div class="user-info">
                    <h2>INFORMATION</h2>

                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" value="Nguyễn Văn A" readonly>

                    <label for="email">Email</label>
                    <input type="email" id="email" value="nguyenvana@example.com" readonly>

                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" value="0123456789" readonly>

                    <div class="buttons">
                        <button id="editProfile">Edit Profile</button>
                        <button id="changePassword">Change Password</button>
                        <button id="logout">Sign out</button>
                    </div>
                </div>

                <div class="order-history" id="orderHistory">
                    <h2>ORDER HISTORY</h2>
                    <table class="order-table">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Date</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#ORD-2025-001</td>
                                <td>Mar 15, 2025</td>
                                <td>$125.00</td>
                                <td><span class="order-status status-completed">Completed</span></td>
                                <td><a href="#" class="view-details">View Details</a></td>
                            </tr>
                            <tr>
                                <td>#ORD-2025-002</td>
                                <td>Mar 10, 2025</td>
                                <td>$78.50</td>
                                <td><span class="order-status status-completed">Completed</span></td>
                                <td><a href="#" class="view-details">View Details</a></td>
                            </tr>
                            <tr>
                                <td>#ORD-2025-003</td>
                                <td>Mar 5, 2025</td>
                                <td>$210.75</td>
                                <td><span class="order-status status-processing">Processing</span></td>
                                <td><a href="#" class="view-details">View Details</a></td>
                            </tr>
                            <tr>
                                <td>#ORD-2025-004</td>
                                <td>Feb 28, 2025</td>
                                <td>$45.99</td>
                                <td><span class="order-status status-cancelled">Cancelled</span></td>
                                <td><a href="#" class="view-details">View Details</a></td>
                            </tr>
                            <tr>
                                <td>#ORD-2025-005</td>
                                <td>Feb 20, 2025</td>
                                <td>$132.25</td>
                                <td><span class="order-status status-completed">Completed</span></td>
                                <td><a href="#" class="view-details">View Details</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <%@include file="../includes/footer.jsp" %>
        <script src="../assets/js/profile.js"></script>
    </body>
</html>
