    <%-- 
    Document   : users
    Created on : Mar 14, 2025, 8:53:54 PM
    Author     : ADMIN
--%>

<%@page import="dao.RoleDAO"%>
<%@page import="dto.UserDTO"%>
<%@page import="java.util.List"%>
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
                        <form action="<%= request.getContextPath()%>/AccountController">
                            <input type="hidden" name="action" value="searchUser">
                            <% String searchTerm = request.getAttribute("searchTerm") != null ? (String) request.getAttribute("searchTerm") : "";%>
                            <input type="text" placeholder="Search user name" name="searchTerm" value="<%=searchTerm%>">
                            <button type="submit" class="search-button">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <%
                    List<UserDTO> accounts = (List<UserDTO>) request.getAttribute("accounts");
                    if (accounts != null && !accounts.isEmpty()) {
                        RoleDAO rdao = new RoleDAO();

                %>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Full name</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>
                                    <a href="<%= request.getContextPath()%>/admin/userForm.jsp" class="add-button">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (UserDTO item : accounts) {%>
                            <tr>
                                <td><%=item.getFull_name()%></td>   
                                <td><%=item.getUser_name()%></td>
                                <td><%=item.getEmail()%></td>
                                <td><%=item.getPhone_number()%></td>
                                <td><%=rdao.readById(item.getRole_id()).getRole_name()%></td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="<%= request.getContextPath()%>/UserController?action=editAccount&accountId=<%=item.getUser_name()%>" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="<%= request.getContextPath()%>/AccountController?action=delete&accountId=<%=item.getUser_name()%>" class="delete-button">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>     
                            <%
                                }
                            %>

                        </tbody>
                    </table>
                </div>
                <%
                    }
                %>
            </div>
    </body>
</html>
