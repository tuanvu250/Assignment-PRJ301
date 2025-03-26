<%-- 
    Document   : dashboard
    Created on : Mar 15, 2025, 12:26:26 PM
    Author     : ADMIN
--%>

<%@page import="dao.VoucherDAO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="dao.ProductColorDAO"%>
<%@page import="dao.ProductStyleDAO"%>
<%@page import="dao.ProductMaterialDAO"%>
<%@page import="dao.ProductLineDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.ShoesProductDAO"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/dashboard.css">    
    </head>
    <body>
        <%
            if (AuthUtils.checkIsAdmin(session)) {
                ShoesProductDAO pdao = new ShoesProductDAO();
                UserDAO usdao = new UserDAO();
                ProductLineDAO pdldao = new ProductLineDAO();
                ProductMaterialDAO matdao = new ProductMaterialDAO();
                ProductStyleDAO styledao = new ProductStyleDAO();
                ProductColorDAO colordao = new ProductColorDAO();
                OrderDAO orderDAO = new OrderDAO();
                VoucherDAO vouDAO = new VoucherDAO();
        %>


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
                            <div class="metric-value"><%=usdao.getTotalAccount()%></div>
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
                            <div class="metric-value"><%=pdao.getTotalShoesProduct()%></div>
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
                            <div class="metric-value"><%=orderDAO.getTotalQuantity()%></div>
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
                            <div class="metric-value"><%=pdldao.getTotalProductLine()%></div>
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
                            <div class="metric-value"><%=matdao.getTotalMaterial()%></div>
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
                            <div class="metric-value"><%=styledao.getTotalStyle()%></div>
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
                            <div class="metric-value"><%=colordao.getTotalColor()%></div>
                        </div>
                    </div>
                </a>
                        
                <a href="#" class="metric-link">
                    <div class="metric-card">
                        <div class="icon-container">
                            <i class="fa-solid fa-ticket icon-purple"></i>
                        </div>
                        <div class="metric-info">
                            <div class="metric-label">Total Voucher</div>
                            <div class="metric-value"><%=vouDAO.getTotalVoucher()%></div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <%
            }
        %>
    </body>
</html>
