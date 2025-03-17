<%-- 
    Document   : users
    Created on : Mar 14, 2025, 8:53:54 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style> 
            .page-container {
                display: flex;
                align-items: center;
            }
            .container {
                max-width: 1200px;
                margin: 0 auto;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
                padding: 20px;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .header h1 {
                font-size: 24px;
                color: #333;
            }

            .search-bar {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .search-bar input {
                padding: 8px 12px;
                border: 1px solid #ddd;
                border-radius: 4px;
                width: 250px;
                font-size: 14px;
            }

            .search-button {
                background: none;
                border: none;
                color: #666;
                cursor: pointer;
                padding: 8px;
            }

            .table-container {
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                white-space: nowrap;
            }

            th, td {
                padding: 12px 16px;
                text-align: left;
                border-bottom: 1px solid #eee;
            }

            th {
                font-weight: 600;
                color: #333;
                background-color: #f8f9fa;
            }

            td {
                color: #444;
            }

            .avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
            }

            .add-button {
                background-color: #4caf50;
                color: white;
                border: none;
                border-radius: 4px;
                width: 32px;
                height: 32px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: background-color 0.2s;
            }

            .add-button:hover {
                background-color: #45a049;
            }

            .edit-button {
                background-color: #2196F3;
                color: white;
                border: none;
                border-radius: 4px;
                width: 32px;
                height: 32px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: background-color 0.2s;
            }

            .edit-button:hover {
                background-color: #0b7dda;
            }

            .delete-button {
                background-color: #ff4444;
                color: white;
                border: none;
                border-radius: 4px;
                width: 32px;
                height: 32px;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: background-color 0.2s;
            }

            .delete-button:hover {
                background-color: #cc0000;
            }

            .action-buttons {
                display: flex;
                gap: 8px;
            }

            /* Responsive styles */
            @media (max-width: 768px) {
                .header {
                    flex-direction: column;
                    gap: 15px;
                }

                .search-bar {
                    width: 100%;
                }

                .search-bar input {
                    width: 100%;
                }

                th, td {
                    padding: 8px;
                }
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="page-container">
            <%@include file="sidebar.jsp" %>
            <div class="container">
        <div class="header">
            <h1>Manage Account</h1>
            <div class="search-bar">
                <input type="text" placeholder="Search user name">
                <button class="search-button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>

        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Full name</th>
                        <th>Avatar</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>
                            <a href="add-user.php" class="add-button">
                                <i class="fas fa-plus"></i>
                            </a>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Ngo Dang Quang</td>
                        <td>
                            <img src= "../img/avt-user-test.jpg" alt="Avatar" class="avatar">
                        </td>
                        <td>phuthanh2003</td>
                        <td>phuthanh@example.com</td>
                        <td>0707054154</td>
                        <td>Admin</td>
                        <td>
                            <div class="action-buttons">
                                <a href="edit-user.php?id=1" class="edit-button">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="delete-user.php?id=1" class="delete-button">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>John Doe</td>
                        <td>
                            <img src="/placeholder.svg?height=40&width=40" alt="Avatar" class="avatar">
                        </td>
                        <td>john_doe</td>
                        <td>john.doe@example.com</td>
                        <td>12345678901</td>
                        <td>Admin</td>
                        <td>
                            <div class="action-buttons">
                                <a href="edit-user.php?id=2" class="edit-button">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="delete-user.php?id=2" class="delete-button">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>John Doe</td>
                        <td>
                            <img src="/placeholder.svg?height=40&width=40" alt="Avatar" class="avatar">
                        </td>
                        <td>john_doeee</td>
                        <td>john.doeee@example.com</td>
                        <td>12345678901</td>
                        <td>Customer</td>
                        <td>
                            <div class="action-buttons">
                                <a href="edit-user.php?id=3" class="edit-button">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="delete-user.php?id=3" class="delete-button">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Ngu di</td>
                        <td>
                            <img src="/placeholder.svg?height=40&width=40" alt="Avatar" class="avatar">
                        </td>
                        <td>124au</td>
                        <td>ngudi@example.com</td>
                        <td>3456789012</td>
                        <td>Customer</td>
                        <td>
                            <div class="action-buttons">
                                <a href="edit-user.php?id=4" class="edit-button">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="delete-user.php?id=4" class="delete-button">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Dan ong dich thuc</td>
                        <td>
                            <img src="/placeholder.svg?height=40&width=40" alt="Avatar" class="avatar">
                        </td>
                        <td>53kia</td>
                        <td>danong@example.com</td>
                        <td>9012345678</td>
                        <td>Customer</td>
                        <td>
                            <div class="action-buttons">
                                <a href="edit-user.php?id=5" class="edit-button">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="delete-user.php?id=5" class="delete-button">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    </body>
</html>
