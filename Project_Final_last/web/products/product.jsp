<%-- 
    Document   : product
    Created on : Mar 6, 2025, 9:20:36 PM
    Author     : ADMIN
--%>

<%@page import="dao.ShoesProductDAO"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.ProductStyleDTO"%>
<%@page import="dao.ProductStyleDAO"%>
<%@page import="utils.AuthUtils"%>
<%@page import="utils.DBUtils"%>
<%@page import="dto.ShoesProductDTO"%>
<%@page import="dto.ProductColorDTO"%>
<%@page import="dao.ProductColorDAO"%>
<%@page import="dto.ProductMaterialDTO"%>
<%@page import="dao.ProductMaterialDAO"%>
<%@page import="dao.ProductLineDAO"%>
<%@page import="java.util.List"%>
<%@page import="dto.ProductLineDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/product.css">    

    </head>
    <body>
        <%@include file="../includes/header.jsp"%>
        <div class="product">
            <div class="product-list">
                <div class="product-gender">
                    <a href="" 
                       data-filter="gender" data-value="">ALL</a> 
                    <a href=""
                       data-filter="gender" data-value="Male">MALE</a>
                    <a href=""
                       data-filter="gender" data-value="Female">FEMALE</a>
                </div>
                <div class="product-choice">    
                    <h3 class="active toggle-btn">STATUS <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <a  data-filter="status" data-value="Sale">Sale off <i class="fa-solid fa-xmark hidden"></i></a>
                        <a data-filter="status" data-value="Soldout">Pre-order <i class="fa-solid fa-xmark hidden"></i></a>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="active toggle-btn">STYLE <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <%
                            ProductStyleDAO styDAO = new ProductStyleDAO();
                            List<ProductStyleDTO> listProductSty = styDAO.readAll();
                            for (ProductStyleDTO sty : listProductSty) {
                        %>
                        <a data-filter="style" data-value="<%=sty.getStyle_id()%>"><%=sty.getStyle_name()%> <i class="fa-solid fa-xmark"></i></a>
                            <%}%>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="active toggle-btn">PRODUCT LINE <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <%
                            ProductLineDAO lineDAO = new ProductLineDAO();
                            List<ProductLineDTO> listProductLine = lineDAO.readAll();
                            for (ProductLineDTO line : listProductLine) {
                        %>
                        <a data-filter="productLine" data-value="<%=line.getLine_id()%>"><%=line.getLine_name()%> <i class="fa-solid fa-xmark"></i></a>
                            <%}%>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="active toggle-btn">PRICE <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <a data-filter="price" data-value="600k">> 600k VND <i class="fa-solid fa-xmark"></i></a>
                        <a data-filter="price" data-value="500k-599k">500k - 599k VND <i class="fa-solid fa-xmark"></i></a>
                        <a data-filter="price" data-value="400k-499k">400k - 499k VND <i class="fa-solid fa-xmark"></i></a>
                        <a data-filter="price" data-value="300k-399k">300k - 399k VND <i class="fa-solid fa-xmark"></i></a>
                        <a data-filter="price" data-value="300k">< 300k VND <i class="fa-solid fa-xmark"></i></a>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="active toggle-btn">MATERIAL <i class="fa-solid fa-chevron-up"></i></h3>
                    <div class="choice-list show">
                        <%
                            ProductMaterialDAO matDAO = new ProductMaterialDAO();
                            List<ProductMaterialDTO> listProductMat = matDAO.readAll();
                            for (ProductMaterialDTO mat : listProductMat) {
                        %>
                        <a data-filter="material" data-value="<%=mat.getMat_id()%>"><%=mat.getMat_name()%> <i class="fa-solid fa-xmark"></i></a>
                            <%}%>
                    </div>
                </div>
                <div class="product-choice">
                    <h3 class="toggle-btn">COLOR <i class="fa-solid fa-chevron-down"></i></h3>
                    <div class="choice-list-color">
                        <%
                            ProductColorDAO colDAO = new ProductColorDAO();
                            List<ProductColorDTO> listProductColor = colDAO.readAll();
                            for (ProductColorDTO color : listProductColor) {
                        %>
                        <div>
                            <a data-filter="color" data-value="<%=color.getColor_id()%>" style="background-color: <%=color.getColor_code()%>"></a>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
            <div>
                <div class="product-detail">
                    <%
                        if (request.getAttribute("listShoesProduct") != null) {
                            ShoesProductDAO shoesDAO = new ShoesProductDAO();

                            List<ShoesProductDTO> listShoes = (List<ShoesProductDTO>) request.getAttribute("listShoesProduct");
                            for (ShoesProductDTO shoes : listShoes) {
                                List<ProductColorDTO> listColor = shoesDAO.colorOfShoes(shoes.getShoes_id());
                                String colorMain = listColor.get(0).getColor_id();
                    %>
                    <div class="product-item" onclick="redirectToProduct(this)" style="cursor: pointer;">
                        <div class="img-sale">
                            <% if (AuthUtils.isSale(shoes)) { %>
                            <h3 class="label-sale">SALE OFF</h3> 
                            <%} else if (AuthUtils.isSoldout(shoes)) {%>
                            <h3 class="label-sale">SOLDOUT</h3>
                            <%}%>
                            <a href="ShoesProductController?shoesId=<%=shoes.getShoes_id()%>">
                                <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorMain%>_1.jpg">
                                <img class="hidden-img" src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorMain%>_2.jpg">
                            </a>
                            <div class="div-hover-buy" <% if (AuthUtils.isSoldout(shoes)) { %> style="background-color: rgba(0,0,0,0.3);"<%}%>>
                                <a class="hover-buy"<% if (AuthUtils.isSoldout(shoes)) { %> style="background-color: #1d1d1b; opacity: 1;"<%} else {%> 
                                   href="ShoesProductController?shoesId=<%=shoes.getShoes_id()%>&colorIndex=1"<%}%>>
                                    <% if (AuthUtils.isSoldout(shoes)) { %>PRE-ORDER<%} else {%>BUY<%}%>
                                </a>
                            </div>
                            <%
                                if (shoesDAO.checkFav(shoes.getShoes_id(), username)) {
                            %> 
                            <a class="love-list" href="FavController?action=delete&username=<%=username%>&shoesId=<%=shoes.getShoes_id()%>" 
                               id="fav-link"><i class="fa-solid fa-heart "></i></a>
                                <%} else {%>
                            <a class="love-list" href="FavController?action=add&username=<%=username%>&shoesId=<%=shoes.getShoes_id()%>" 
                               id="fav-link"><i class="fa-regular fa-heart "></i></a> <%}%>
                        </div>
                        <a href="ShoesProductController?shoesId=<%=shoes.getShoes_id()%>&colorIndex=1"
                           class="product-name"><%=shoes.getShoes_name()%></a>
                        <p>Color</p>
                        <div class="product-price">
                            <p><%=shoes.getPrice()%> VND</p>
                            <% if (AuthUtils.isSale(shoes)) { %>
                            <p class="sale-text">XXX.XXX VND</p>
                            <%}%>
                        </div>
                    </div>
                    <%}
                        }%>
                </div>
                <% int currentPage = (int) request.getAttribute("currentPage");
                    int totalPages = (int) request.getAttribute("totalPages");
                %>

                <nav aria-label="Pagination">
                    <ul class="pagination">
                        <li>
                            <a  onclick="updatePage(event, <%= (currentPage > 1) ? (currentPage - 1) : 1%>)" 
                                class="pagination-button pagination-prev" aria-label="Previous page">
                                Previous
                            </a>
                        </li>
                        <% for (int i = 1; i <= totalPages; i++) {%>
                        <li>
                            <a onclick="updatePage(event, <%= i%>)" 
                               class="pagination-button <%= (i == currentPage) ? "active" : ""%>" aria-current="page">
                                <%=i%></a>
                        </li>
                        <%}%>
                        <li>
                            <a onclick="updatePage(event, <%= (currentPage < totalPages) ? (currentPage + 1) : totalPages%>)" 
                               class="pagination-button pagination-next" aria-label="Next page">
                                Next
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <%@include file="../includes/popupNoti.jsp"%>
        <%@include file="../includes/footer.jsp" %>
        <script src="<%= request.getContextPath()%>/assets/js/searchFilter.js"></script>
        <script src="<%= request.getContextPath()%>/assets/js/product.js"></script>
        <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    const favLinks = document.querySelectorAll('.love-list');
                                    const cartLink = document.getElementById('cart-link');
                                    const overlay = document.getElementById('modal-bg');
                                    const cancelButton = document.querySelector('.btn-cancel');


                                    let isLogin = <%=AuthUtils.isLoggedIn(session) ? "true" : "false"%>;

                                    favLinks.forEach(link => {
                                        link.addEventListener('click', function (event) {
                                            if (!isLogin) {
                                                event.preventDefault(); // Ngăn chuyển trang nếu chưa đăng nhập
                                                overlay.classList.add('show');
                                                document.body.style.overflow = 'hidden';
                                            }
                                        });
                                    });

                                    // Đóng popup khi bấm Cancel
                                    cancelButton.addEventListener('click', function () {
                                        overlay.classList.remove('show');
                                        document.body.style.overflow = ''; // Cho phép cuộn lại
                                    });

                                    // Đóng popup khi click ra ngoài
                                    overlay.addEventListener('click', function (event) {
                                        if (event.target === overlay) {
                                            overlay.classList.remove('show');
                                            document.body.style.overflow = ''; // Cho phép cuộn lại
                                        }
                                    });
                                });
        </script>
    </body>
</html>
