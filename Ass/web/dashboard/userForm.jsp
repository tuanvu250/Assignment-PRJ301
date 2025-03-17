<%-- 
    Document   : userForm
    Created on : Mar 14, 2025, 10:57:02 PM
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
                background-color: #f5f7fb;
                color: #333;
                line-height: 1.6;
            }

            .container {
                max-width: 800px;
                margin: 40px auto;
                padding: 0 20px;
            }

            .form-container {
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                padding: 30px;
            }

            h1 {
                text-align: center;
                margin-bottom: 30px;
                color: #C63F3E;
                font-weight: 600;
            }

            .form-group {
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
            }

            input, select {
                width: 100%;
                padding: 6px;
                border: 1px solid #ddd; /* Re-adding border since the reset removes it */
                border-radius: 5px;
                font-size: 16px;
                transition: border-color 0.3s;
                background-color: #fff;
            }

            input:focus, select:focus {
                border-color: #4895ef;
                box-shadow: 0 0 0 3px rgba(72, 149, 239, 0.2);
            }

            .form-actions {
                display: flex;
                justify-content: flex-end;
                gap: 15px;
                margin-top: 30px;
            }

            .btn {
                padding: 12px 24px;
                border-radius: 5px;
                font-size: 16px;
                font-weight: 500;
                cursor: pointer;
                transition: background-color 0.3s, transform 0.1s;
            }

            .btn:active {
                transform: translateY(1px);
            }

            .btn-primary {
                background-color: #C63F3E;
                color: white;
            }

            .btn-primary:hover {
                background-color: #3f37c9;
            }

            .btn-secondary {
                background-color: #e9ecef;
                color: #495057;
            }

            .btn-secondary:hover {
                background-color: #dee2e6;
            }

            /* Responsive styles */
            @media (max-width: 600px) {
                .form-container {
                    padding: 20px;
                }

                .form-actions {
                    flex-direction: column;
                }

                .btn {
                    width: 100%;
                }
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="form-container">
                <h1>Add New User</h1>
                <form id="userForm" method="post" action="">
                    <div class="form-group">
                        <label for="fullname">Full Name</label>
                        <input type="text" id="fullname" name="fullname" required>
                    </div>

                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="tel" id="phone" name="phone" required>
                    </div>

                    <div class="form-group">
                        <label for="role_id">Role</label>
                        <select id="role_id" name="role_id" required>
                            <option value="" disabled selected>Select a role</option>
                            <option value="1">Admin</option>
                            <option value="2">User</option>
                        </select>
                    </div>

                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add User</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
