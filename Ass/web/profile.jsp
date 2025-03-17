<%-- 
    Document   : profile
    Created on : Mar 11, 2025, 4:10:13 PM
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

            input:hover, 
            button:hover,
            a:hover {
                cursor: pointer;
            }

            input:hover {
                cursor: text;
            }

            .profile {
                display: flex;
                justify-content: center;
                padding:4vw;
                gap: 20px;
            }

            .profile-left {
                flex: 1;
                display: flex;
                flex-direction: column;
            }

            .profile-left img {
                width: 15vw;
                height: 15vw;
                object-fit: cover;
                border-radius: 50%;
                margin: auto;
            }

            .profile-left form {
                display: flex;
                flex-direction: column;
                text-align: center;
                gap: 3vh;
                background-color: #FFF;
                padding: 20px;
                margin-bottom: 8px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.05);
            }

            .profile-left input {
                width: 80%;
                margin: auto;
            }

            .profile-left button {
                width: 80%;
                margin: auto;
                padding: 12px 0;
                box-shadow: 0 0 20px rgba(0,0,0,0.1);
                background-color: #1d1d1b;
                color: #FFF;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .profile-left button:hover {
                background-color: #333;
            }

            .profile-left input[type="file"]::file-selector-button {
                padding: 8px 12px;
                background-color: #f5f5f5;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-right: 10px;
            }

            .profile-left input[type="file"] {
                color: #333;
                padding: 8px;
            }

            .history-nav {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 12vh;
                background-color: #FFF;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.05);
                margin-bottom: 8px;
            }

            .history-nav a {   
                padding: 12px 24px;
                background-color: #1d1d1b;
                color: #FFF;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .history-nav a:hover {
                background-color: #333;
            }

            .profile-right {
                flex: 2;
                background-color: #FFF;
                padding: 30px;
                box-shadow: 0 0 10px rgba(0,0,0,0.05);
                border-radius: 8px;
            }

            .profile-right h2 {
                margin-bottom: 30px;
                font-weight: 600;
                color: #1d1d1b;
            }

            .profile-right label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
                color: #333;
            }

            .profile-right input {
                width: 100%;
                padding: 12px;
                margin-bottom: 20px;
                background-color: #f5f5f5;
                border-radius: 4px;
            }

            .profile-right input:focus {
                background-color: #fff;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
            }

            .buttons {
                display: flex;
                gap: 15px;
                margin-top: 20px;
                flex-wrap: wrap;
            }

            .buttons button {
                padding: 12px 24px;
                background-color: #1d1d1b;
                color: #FFF;
                cursor: pointer;
                transition: background-color 0.3s;
                border-radius: 4px;
            }

            .buttons button:hover {
                background-color: #333;
            }

            /* Order History Table Styles */
            .order-history {
                margin-top: 30px;
                display: none;
            }

            .order-history h2 {
                margin-bottom: 20px;
            }

            .order-table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .order-table th, 
            .order-table td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .order-table th {
                background-color: #f5f5f5;
                font-weight: 600;
                color: #333;
            }

            .order-table tr:hover {
                background-color: #f9f9f9;
            }

            .order-status {
                padding: 5px 10px;
                border-radius: 20px;
                font-size: 0.9em;
                font-weight: 500;
                display: inline-block;
            }

            .status-completed {
                background-color: #e6f7e6;
                color: #2e7d32;
            }

            .status-processing {
                background-color: #fff8e1;
                color: #ff8f00;
            }

            .status-cancelled {
                background-color: #ffebee;
                color: #c62828;
            }

            .view-details {
                color: #1d1d1b;
                text-decoration: underline;
                cursor: pointer;
            }

            .view-details:hover {
                color: #333;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .profile {
                    flex-direction: column;
                }

                .profile-left img {
                    width: 30vw;
                    height: 30vw;
                }

                .buttons {
                    justify-content: center;
                }

                .order-table {
                    font-size: 0.9em;
                }
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="profile">
            <div class="profile-left">
                <form>
                    <h2>Profile picture</h2>
                    <img src="img/avt-user-test.jpg" alt="User Profile Picture">
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
        <%@include file="footer.jsp" %>
        <script>
            // Toggle between user info and order history
            document.getElementById('showHistory').addEventListener('click', function (e) {
                e.preventDefault();
                const userInfo = document.querySelector('.user-info');
                const orderHistory = document.getElementById('orderHistory');

                if (orderHistory.style.display === 'none' || orderHistory.style.display === '') {
                    userInfo.style.display = 'none';
                    orderHistory.style.display = 'block';
                    this.textContent = 'User Information';
                } else {
                    userInfo.style.display = 'block';
                    orderHistory.style.display = 'none';
                    this.textContent = 'History orders';
                }
            });

            // Edit profile functionality
            document.getElementById('editProfile').addEventListener('click', function () {
                const inputs = document.querySelectorAll('#fullname, #email, #phone');
                inputs.forEach(input => {
                    input.readOnly = !input.readOnly;
                    if (!input.readOnly) {
                        input.focus();
                    }
                });

                if (this.textContent === 'Edit Profile') {
                    this.textContent = 'Save Profile';
                } else {
                    this.textContent = 'Edit Profile';
                    // Here you would typically save the data
                    alert('Profile updated successfully!');
                }
            });
        </script>
    </body>
</html>
