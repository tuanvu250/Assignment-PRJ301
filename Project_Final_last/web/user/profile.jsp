<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.UserDTO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/profile.css">    
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>

        <%
            UserDTO user = (UserDTO) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Lấy ảnh user từ session (nếu có), ngược lại dùng ảnh mặc định
            String imageUser = user.getImage();
            if (imageUser == null) {
                imageUser = request.getContextPath() + "/assets/img/img-users/default-avatar.jpg";
            } else {
                imageUser = request.getContextPath() + "/LoadImageController?image=" + imageUser;

            }
            String uploadFile = request.getAttribute("uploadFile") + "";
            uploadFile = uploadFile.equals("null") ? "" : uploadFile;
        %>

        <div class="profile">
            <div class="profile-left">
                <form action="<%= request.getContextPath()%>/ProfileController" method="post" enctype="multipart/form-data">
                    <h2>Profile Picture</h2>
                    <img src="<%= imageUser%>" alt="User Profile Picture" id="profileImagePreview">
                    <input type="hidden" name="action" value="updateImage">
                    <input type="file" name="profileImage" accept="image/*" id="profileImageInput">
                    <button type="submit">Update Picture</button>
                </form>
                <p><%=uploadFile%></p>
                <div class="history-nav">
                    <a href="#" id="showHistory">History Orders</a>
                </div>
            </div>
            <div class="profile-right">
                <form action="<%= request.getContextPath()%>/ProfileController" method="post">
                    <input type="hidden" name="action" value="updateInfo">
                    <div class="user-info">
                        <h2>INFORMATION</h2>

                        <label for="fullname">Full Name</label>
                        <input type="text" id="fullname" name="fullname" value="<%= user.getFull_name()%>" required>
                        <p style="color: red"><%=request.getAttribute("errorUpdateFullname") != null ? request.getAttribute("errorUpdateFullname") : ""%></p>
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="<%= user.getEmail()%>" required>
                        <p style="color: red"><%=request.getAttribute("errorUpdateEmail") != null ? request.getAttribute("errorUpdateEmail") : ""%></p>
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" value="<%= user.getPhone_number()%>" required>
                        <p style="color: red"><%=request.getAttribute("errorUpdatePhone") != null ? request.getAttribute("errorUpdateEmail") : ""%></p>
                        <div class="buttons">
                            <button type="submit">Save Changes</button>
                            <button type="button" class="show-popup-btn">Change Password</button>
                            <a href="<%= request.getContextPath()%>/UserController?action=logout"><button type="button" id="logout">Sign out</button></a>
                        </div>
                        <%
                            String changeSuccess = request.getAttribute("changeSuccess") + "";
                            changeSuccess = changeSuccess.equals("null") ? "" : changeSuccess;
                        %>
                        <div style="green"><%=changeSuccess%></div>
                    </div>
                </form>

                <div class="overlay" id="overlay">
                    <div class="popup" role="dialog" aria-labelledby="popup-title" aria-modal="true">
                        <div class="popup-header">
                            <h2 class="popup-title" id="popup-title">Change Password</h2>
                            <button class="close-button" id="close-button" aria-label="Close">×</button>
                        </div>

                        <form id="password-form" action="<%= request.getContextPath()%>/UserController" method="post">
                            <input type="hidden" name="action" value="changePassword">
                            <div class="form-group">
                                <label for="current-password">Current Password</label>
                                <input 
                                    type="password" 
                                    id="current-password" 
                                    name="currentPassword" 
                                    value="<%=session.getAttribute("currentPW") != null ? session.getAttribute("currentPW") : ""%>"
                                    required 
                                    >
                                <div class="error-message" id="current-password-error"><%= request.getAttribute("wrongCurrentPassword") != null ? request.getAttribute("wrongCurrentPassword") : ""%></div>
                            </div>

                            <div class="form-group">
                                <label for="new-password">New Password</label>
                                <input 
                                    type="password" 
                                    id="new-password" 
                                    name="newPassword" 
                                    required 
                                    >
                                <div class="password-requirements" id="password-requirements">
                                    Password must be at least 8 characters!
                                </div>
                                <div class="error-message" id="new-password-error"><%= request.getAttribute("sameCurrentPassword") != null ? request.getAttribute("sameCurrentPassword") : ""%></div>
                                <div class="error-message" id="new-password-error"><%= request.getAttribute("wrongNewPassword") != null ? request.getAttribute("wrongNewPassword") : ""%></div>
                            </div>

                            <div class="form-group">
                                <label for="confirm-password">Confirm New Password</label>
                                <input 
                                    type="password" 
                                    id="confirm-password" 
                                    name="confirmPassword" 
                                    required                                
                                    >
                                <div class="error-message" id="confirm-password-error"><%= request.getAttribute("notMatchPassword") != null ? request.getAttribute("notMatchPassword") : ""%></div>
                            </div>

                            <div class="actions">
                                <button type="reset" class="cancel-button" id="cancel-button">Cancel</button>
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
                            <!-- Dữ liệu sẽ được load từ database -->
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
                const passwordForm = document.getElementById('password-form');

                // Hiển thị popup
                function showPopup() {
                    overlay.classList.add('active');
                    document.body.style.overflow = 'hidden'; // Ngăn cuộn trang
                }

                // Ẩn popup, reset form và xóa session currentPW
                function hidePopup() {
                    overlay.classList.remove('active');
                    window.location.reload(); // Reload lại trang
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
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                let showForm = "<%= request.getAttribute("showChangePassword")%>";
                if (showForm === "true") {
                    document.getElementById("overlay").classList.add("active");
                } else {
                    document.getElementById("overlay").classList.remove("active");
                }
            });
        </script>



    </body>
</html>
