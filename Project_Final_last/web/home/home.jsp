<%-- 
    Document   : home
    Created on : Feb 28, 2025, 6:13:14 PM
    Author     : ADMIN
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/home.css">    
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <div class="banner">
            <img src="<%= request.getContextPath()%>/assets/img/img-home/banner.png">
            <h2>DISCOVER</h2>
        </div>

        <h1>CATEGORY</h1>

        <div class="container">
            <a  class="contain-left" onclick="updateFilter('status', 'Sale')">
                <img src="<%= request.getContextPath()%>/assets/img/img-home/home_sale.jpg">
                <h3>SALE OFF</h3>
            </a>
            <a  class="contain-mid" onclick="updateFilter('gender', 'Male')">
                <img src="<%= request.getContextPath()%>/assets/img/img-home/home_male.jpg">
                <h3>MALE</h3>
            </a>
            <a  class="contain-right" onclick="updateFilter('gender', 'Female')">
                <img src="<%= request.getContextPath()%>/assets/img/img-home/home_female.jpg">
                <h3>FEMALE</h3>
            </a>
        </div>

        <%@include file="../includes/footer.jsp" %>
        <script src="../assets/js/searchFilter.js" ></script>
    </body>
</html>
