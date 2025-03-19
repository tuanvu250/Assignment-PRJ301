<%-- 
    Document   : users
    Created on : Mar 14, 2025, 8:53:54 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/manageUsers.css">    

    </head>
    <body>
        <div class="page-container">
            <%@include file="../includes/sidebar.jsp" %>
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
