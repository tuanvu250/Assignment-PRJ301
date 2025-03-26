<%-- 
    Document   : sidebar
    Created on : Mar 14, 2025, 8:48:37 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/sidebar.css">    
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="<%= request.getContextPath()%>/admin/dashboard.jsp" class="logo">
                        <span class="nav-item">Admin DashBoard</span>
                    </a></li>
                <li><a href="<%= request.getContextPath()%>/AccountController?action=manageAccount">
                        <i class="fa-solid fa-users"></i>
                        <span class="nav-item">Accounts</span>
                    </a></li>
                <li><a href="<%= request.getContextPath()%>/OrderController?action=manageOrders">
                        <i class="fas fa-user"></i>
                        <span class="nav-item">Invoice</span>
                    </a></li>
                <li><a href="<%= request.getContextPath()%>/ProductController?action=manageProduct">
                        <i class="fas fa-box"></i>
                        <span class="nav-item">Products</span>
                    </a></li>
                <li><a href="<%= request.getContextPath()%>/ProductLineController?action=managePDL">
                        <i class="fas fa-tags"></i>
                        <span class="nav-item">Product Line</span>
                    </a></li>
                <li><a href="<%= request.getContextPath()%>/ProductMaterialController?action=manageMAT">
                        <i class="fas fa-layer-group"></i>
                        <span class="nav-item">Material</span>
                    </a></li>
                <li><a href="<%= request.getContextPath()%>/ProductStyleController?action=manageStyle">
                        <i class="fas fa-tshirt"></i>
                        <span class="nav-item">Style</span>
                    </a></li>
                <li><a href="<%= request.getContextPath()%>/ProductColorController?action=manageColor">
                        <i class="fa-solid fa-palette"></i>
                        <span class="nav-item">Color</span>
                    </a></li>
                <li><a href="<%= request.getContextPath()%>/VoucherController?action=manageVoucher">
                        <i class="fa-solid fa-ticket"></i>
                        <span class="nav-item">Voucher</span>
                    </a></li>
                <li><a href="<%= request.getContextPath()%>/home/home.jsp" class="logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <span class="nav-item">Exit</span>
                    </a></li>
                
            </ul>
        </nav>
    </body>
</html>
