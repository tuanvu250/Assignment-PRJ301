<%-- 
    Document   : dashboard
    Created on : Mar 15, 2025, 12:26:26 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/dashboard.css">    
    </head>
    <body>
        <div class="page-container">
            <%@include file="../includes/sidebar.jsp" %>
            <div class="dashboard">
                <a href="#" class="metric-link">
                    <div class="metric-card">
                        <div class="icon-container">
                            <i class="fas fa-user-circle icon-blue"></i>
                        </div>
                        <div class="metric-info">
                            <div class="metric-label">Total Accounts</div>
                            <div class="metric-value">1245</div>
                        </div>
                    </div>
                </a>

                <a href="#" class="metric-link">
                    <div class="metric-card">
                        <div class="icon-container">
                            <i class="fas fa-box icon-green"></i>
                        </div>
                        <div class="metric-info">
                            <div class="metric-label">Total Products</div>
                            <div class="metric-value">6145</div>
                        </div>
                    </div>
                </a>

                <a href="#" class="metric-link">
                    <div class="metric-card">
                        <div class="icon-container">
                            <i class="fas fa-shopping-cart icon-blue"></i>
                        </div>
                        <div class="metric-info">
                            <div class="metric-label">Total Products Sold</div>
                            <div class="metric-value">1408</div>
                        </div>
                    </div>
                </a>

                <a href="#" class="metric-link">
                    <div class="metric-card">
                        <div class="icon-container">
                            <i class="fas fa-tags icon-purple"></i>
                        </div>
                        <div class="metric-info">
                            <div class="metric-label">Total Product Line</div>
                            <div class="metric-value">24</div>
                        </div>
                    </div>
                </a>

                <a href="#" class="metric-link">
                    <div class="metric-card">
                        <div class="icon-container">
                            <i class="fas fa-layer-group icon-orange"></i>
                        </div>
                        <div class="metric-info">
                            <div class="metric-label">Total Material</div>
                            <div class="metric-value">38</div>
                        </div>
                    </div>
                </a>

                <a href="#" class="metric-link">
                    <div class="metric-card">
                        <div class="icon-container">
                            <i class="fas fa-tshirt icon-red"></i>
                        </div>
                        <div class="metric-info">
                            <div class="metric-label">Total Style</div>
                            <div class="metric-value">52</div>
                        </div>
                    </div>
                </a>

                <a href="#" class="metric-link">
                    <div class="metric-card">
                        <div class="icon-container">
                            <i class="fas fa-palette icon-green"></i>
                        </div>
                        <div class="metric-info">
                            <div class="metric-label">Total Color</div>
                            <div class="metric-value">76</div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </body>
</html>
