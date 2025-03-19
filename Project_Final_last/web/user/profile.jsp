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
                <form class="user-info">
                    <h2>INFORMATION</h2>

                    <label for="fullname">Full Name</label>
                    <input type="text" id="fullname" value="Nguyễn Văn A" readonly>

                    <label for="email">Email</label>
                    <input type="email" id="email" value="nguyenvana@example.com" readonly>

                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" value="0123456789" readonly>

                    <div class="buttons">
                        <button id="editProfile" type="submit">Edit Profile</button>
                        <button type="button" id="show-popup-btn" class="show-popup-btn">Change Password</button>
                        <button id="logout">Sign out</button>
                    </div>
                </form>
                <div class="overlay" id="overlay">
                    <div class="popup" role="dialog" aria-labelledby="popup-title" aria-modal="true">
                        <div class="popup-header">
                            <h2 class="popup-title" id="popup-title">Change Password</h2>
                            <button class="close-button" id="close-button" aria-label="Close">×</button>
                        </div>

                        <form id="password-form">
                            <div class="form-group">
                                <label for="current-password">Current Password</label>
                                <input 
                                    type="password" 
                                    id="current-password" 
                                    name="current-password" 
                                    required 
                                    autocomplete="current-password"
                                    >
                                <div class="error-message" id="current-password-error">Please enter your current password</div>
                            </div>

                            <div class="form-group">
                                <label for="new-password">New Password</label>
                                <input 
                                    type="password" 
                                    id="new-password" 
                                    name="new-password" 
                                    required 
                                    autocomplete="new-password"
                                    aria-describedby="password-requirements"
                                    >
                                <div class="password-requirements" id="password-requirements">
                                    Password must be at least 8 characters and include a number, a lowercase letter, an uppercase letter, and a special character.
                                </div>
                                <div class="error-message" id="new-password-error">Password doesn't meet requirements</div>
                            </div>

                            <div class="form-group">
                                <label for="confirm-password">Confirm New Password</label>
                                <input 
                                    type="password" 
                                    id="confirm-password" 
                                    name="confirm-password" 
                                    required 
                                    autocomplete="new-password"
                                    >
                                <div class="error-message" id="confirm-password-error">Passwords don't match</div>
                            </div>

                            <div class="actions">
                                <button type="button" class="cancel-button" id="cancel-button">Cancel</button>
                                <button type="submit" class="submit-button">Change Password</button>
                            </div>
                        </form>
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
        <script src="<%= request.getContextPath()%>/assets/js/profile.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const showPopupBtn = document.querySelector('.show-popup-btn');
                const overlay = document.querySelector('.overlay');
                const closeButton = document.querySelector('.close-button');
                const cancelButton = document.querySelector('.cancel-button');

                // Hiển thị popup
                function showPopup() {
                    overlay.classList.add('active');
                    document.body.style.overflow = 'hidden'; // Ngăn cuộn trang
                }

                // Ẩn popup
                function hidePopup() {
                    overlay.classList.remove('active');
                    document.body.style.overflow = ''; // Khôi phục cuộn trang
                }

                // Thêm sự kiện click cho các nút
                showPopupBtn.addEventListener('click', showPopup);
                closeButton.addEventListener('click', hidePopup);
                cancelButton.addEventListener('click', hidePopup);

                // Đóng popup khi click ra ngoài
                overlay.addEventListener('click', function (event) {
                    if (event.target === overlay) {
                        hidePopup();
                    }
                });
            });
        </script>
    </body>
</html>
