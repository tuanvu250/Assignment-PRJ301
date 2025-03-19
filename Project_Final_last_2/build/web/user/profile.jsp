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
                <form action="ProfileController" method="post">
                    <input type="hidden" name="action" value="updateInfo">
                    <div class="user-info">
                        <h2>INFORMATION</h2>

                        <label for="fullname">Full Name</label>
                        <input type="text" id="fullname" name="fullname" value="<%= user.getFull_name()%>" required>

                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="<%= user.getEmail()%>" required>

                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" value="<%= user.getPhone_number()%>" required>

                        <div class="buttons">
                            <button type="submit">Save Changes</button>
                            <a href="<%= request.getContextPath()%>/ProfileController?"><button type="button" id="changePassword">Change Password</button></a>
                            <a href="<%= request.getContextPath()%>/UserController?action=logout"><button type="button" id="logout">Sign out</button></a>
                        </div>
                    </div>
                </form>

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
    </body>
</html>
