<%-- 
    Document   : dashboard
    Created on : Mar 15, 2025, 12:26:26 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        .page-container {
            display: flex;
            align-items: center;
        }

        .dashboard {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
            margin: 0 auto;
        }

        .metric-link {
            text-decoration: none;
            color: inherit;
            height: 100%;
            transition: transform 0.2s ease;
        }

        .metric-link:hover {
            transform: translateY(-5px);
        }

        .metric-link:hover .metric-card {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        .metric-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            transition: box-shadow 0.2s ease;
        }

        .icon-container {
            width: 48px;
            height: 48px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .icon-green {
            color: #2e7d32;
        }

        .icon-blue {
            color: #1565c0;
        }

        .icon-red {
            color: #c62828;
        }

        .icon-purple {
            color: #6a1b9a;
        }

        .icon-orange {
            color: #e65100;
        }

        .metric-info {
            text-align: right;
        }

        .metric-label {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }

        .metric-value {
            font-size: 24px;
            font-weight: 600;
            color: #333;
        }

        .icon-container i {
            font-size: 24px;
        }

        @media (max-width: 768px) {
            .dashboard {
                grid-template-columns: 1fr;
            }
        }

        /* For larger screens, make it 3 columns if there are more than 6 cards */
        @media (min-width: 1200px) {
            .dashboard {
                grid-template-columns: repeat(3, 1fr);
            }
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="page-container">
            <%@include file="sidebar.jsp" %>
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
