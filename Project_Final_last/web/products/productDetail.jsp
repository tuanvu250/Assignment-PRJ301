<%-- 
    Document   : productDetail
    Created on : Mar 10, 2025, 12:04:53 PM
    Author     : ADMIN
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="dao.ProductLineDAO"%>
<%@page import="dto.ProductLineDTO"%>
<%@page import="dto.ProductSizeDTO"%>
<%@page import="dao.ProductSizeDAO"%>
<%@page import="java.util.List"%>
<%@page import="dto.ProductColorDTO"%>
<%@page import="dto.ShoesProductDTO"%>
<%@page import="dao.ShoesProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/productDetail.css">    
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <%
            if (request.getAttribute("shoesId") != null && request.getAttribute("colorIndex") != null) {
                shoesId = request.getAttribute("shoesId") + "";
                String colorIndex = request.getAttribute("colorIndex") + "";
                int index = Integer.parseInt(colorIndex) + 0;
                ShoesProductDAO shoesdao = new ShoesProductDAO();
                ProductLineDAO linedao = new ProductLineDAO();
                ShoesProductDTO shoes = shoesdao.readById(shoesId);
                ProductLineDTO line = linedao.readById(shoes.getLine_id());

                List<ProductColorDTO> listColor = shoesdao.colorOfShoes(shoesId);
                int size = listColor.size();
                String colorId = null;
                if (request.getAttribute("colorId") != null) {
                    colorId = request.getAttribute("colorId") + "";
                }
        %>
        <div class="product-link">
            <a onclick="updateFilter('gender', '')" >Product</a>
            <a onclick="updateFilter('productLine', '<%=shoes.getLine_id()%>')"><%=line.getLine_name()%></a>
            <a><%=shoes.getShoes_name()%></a>
        </div>
        <div class="detail-container">
            <div class="slider-container">
                <div class="img-slider">
                    <div class="img-list">
                        <div>
                            <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorId%>_1.jpg">
                        </div>
                        <div>
                            <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorId%>_2.jpg">
                        </div>
                        <div>
                            <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorId%>_3.jpg">
                        </div>
                        <div>
                            <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorId%>_4.jpg">
                        </div>
                    </div>
                    <div class="img-btn">
                        <button id="prev"><i class="fa-solid fa-chevron-left"></i></button>
                        <button id="next"><i class="fa-solid fa-chevron-right"></i></button>
                    </div>
                </div>
                <ul class="thumnails">
                    <li><img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorId%>_1.jpg" alt="thumnail_1"></li>
                    <li><img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorId%>_2.jpg" alt="thumnail_2"></li>
                    <li><img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorId%>_3.jpg" alt="thumnail_3"></li>
                    <li><img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorId%>_4.jpg" alt="thumnail_4"></li>
                </ul>
            </div>
            <div class="detail-info">
                <div class="detail-text">
                    <h2><%=shoes.getShoes_name()%></h2>
                    <p>Product ID <span><%=shoes.getShoes_id()%></span></p>
                    <% if (AuthUtils.isSale(shoes)) {%>
                    <div style="display: flex; justify-content: space-between">
                        <h2><%=currencyVN.format(shoes.getPrice().multiply(BigDecimal.valueOf(1 - AuthUtils.saleNum(shoes.getSale_id()))))%></h2>
                        <h2 class="sale-text" style="text-decoration: line-through; color: #888; font-weight: inherit"
                            ><%=currencyVN.format(shoes.getPrice())%></h2>
                    </div>
                    <%} else {%> 
                    <h2><%=currencyVN.format(shoes.getPrice())%></h2>
                    <%}%>
                </div>
                <div class="detail-color">
                    <%
                        for (int i = 1; i <= size; i++) {
                            ProductColorDTO color = listColor.get(i - 1);
                    %>
                    <div <%if (color.getColor_id().equals(colorId)) {%>
                        style="border: 2px #1d1d1b solid" <%}%>>
                        <a href="ShoesProductController?shoesId=<%=shoesId%>&colorIndex=<%=i%>"
                           style="background-color: <%=color.getColor_code()%>"> </a>
                    </div>
                    <%;
                        }%>
                </div>
                <div class="detail-btn">
                    <div class="size-quantity">
                        <div class="btn-size">
                            <label>Size</label>
                            <form action="<%= request.getContextPath()%>/CheckStockController">
                                <input type="hidden" name="shoesId" value="<%=shoesId%>"/>
                                <input type="hidden" name="colorId" value="<%=colorId%>"/>
                                <select name="sizeId" id="sizeId" onchange="this.form.submit()">
                                    <option value="" selected hidden></option>
                                    <%
                                        ProductSizeDAO sizeDAO = new ProductSizeDAO();
                                        List<ProductSizeDTO> sizeList = sizeDAO.checkSize(shoesId, colorId);
                                        for (ProductSizeDTO sizeShoes : sizeList) {
                                    %>
                                    <option value="<%=sizeShoes.getSize_id()%>"
                                            <%if (session.getAttribute("sizeId") != null && session.getAttribute("sizeId").equals(sizeShoes.getSize_id())) {%> 
                                            selected <%session.removeAttribute("sizeId");
                                                }%>
                                            ><%=sizeShoes.getSize_num()%></option>
                                    <%}%>
                                </select>
                            </form>
                        </div>
                        <div class="btn-quantity">
                            <label>Quantity</label>
                            <select name="quantity" id="quantity">
                                <option selected hidden></option>
                                <%
                                    if (session.getAttribute("stock") != null) {
                                        int stock = (int) session.getAttribute("stock");
                                        for (int i = 1; i <= 10; i++) {
                                            session.removeAttribute("stock");
                                            if (i <= stock) {
                                %>
                                <option value="<%=i%>"><%=i%></option>
                                <%}
                                        }
                                    }%>
                            </select>
                        </div>
                    </div>
                    <%
                        if (session.getAttribute("errorCart") != null) {
                    %>
                    <h3 style="color: #C63F3E;"><%=session.getAttribute("errorCart")%></h3>
                    <%session.removeAttribute("errorCart");
                        }%>
                    <div class="detail-cart">
                        <a href="CartController?action=add&username=<%=username%>&shoesId=<%=shoesId%>&colorId=<%=colorId%>&sizeId=&quantity=" 
                           class="cart-list" id="addToCart">Add to cart</a>
                        <%
                            ShoesProductDAO shoesDAO = new ShoesProductDAO();
                            if (shoesDAO.checkFav(shoes.getShoes_id(), username)) {
                        %> 
                        <a class="love-list" href="FavController?action=delete&username=<%=username%>&shoesId=<%=shoesId%>" 
                           id="fav-link" style="color: #C63F3E;"><i class="fa-solid fa-heart "></i></a>
                            <%} else {%>
                        <a class="love-list" href="FavController?action=add&username=<%=username%>&shoesId=<%=shoesId%>" 
                           id="fav-link"><i class="fa-regular fa-heart "></i></a> <%}%>
                    </div>
                    <div class="order-now">
                        <a href="AllCartController?action=buyNow&username=<%=username%>&shoesId=<%=shoesId%>&colorId=<%=colorId%>&sizeId=&quantity="
                           id="buy-now">ORDER NOW</a>
                    </div>
                </div>
                <div class="info-detail">
                    <h3 class="">Product infomation <i class="fa-solid fa-chevron-down"></i></h3>
                    <div>
                        <p><%=shoes.getDescription()%></p>
                        <img src="<%= request.getContextPath()%>/assets/img/img-home/info-table.jpg">
                    </div>
                </div>
            </div>
        </div>
        <%}%>
        <%@include file="../includes/popupNoti.jsp"%>
        <%@include file="../includes/footer.jsp" %>
        <script src="<%= request.getContextPath()%>/assets/js/productDetail.js"></script>
        <script>
                                    document.addEventListener('DOMContentLoaded', function () {
                                        const favLinks = document.querySelectorAll('.love-list');
                                        const cartLinks = document.querySelectorAll('.cart-list');
                                        const buyLink = document.getElementById('buy-now');
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

                                        cartLinks.forEach(link => {
                                            link.addEventListener('click', function (event) {
                                                if (!isLogin) {
                                                    event.preventDefault(); // Ngăn chuyển trang nếu chưa đăng nhập
                                                    overlay.classList.add('show');
                                                    document.body.style.overflow = 'hidden';
                                                }
                                            });
                                        });

                                        buyLink.addEventListener('click', function (event) {
                                            if (!isLogin) {
                                                event.preventDefault(); // Ngăn chuyển trang nếu chưa đăng nhập
                                                overlay.classList.add('show');
                                                document.body.style.overflow = 'hidden'; // Ngăn cuộn
                                            }
                                        });

                                        cartLink.addEventListener('click', function (event) {
                                            if (!isLogin) {
                                                event.preventDefault(); // Ngăn chuyển trang nếu chưa đăng nhập
                                                overlay.classList.add('show');
                                                document.body.style.overflow = 'hidden'; // Ngăn cuộn
                                            }
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
                                    document.addEventListener("DOMContentLoaded", function () {
                                        let sizeSelect = document.getElementById("sizeId");
                                        let quantitySelect = document.getElementById("quantity");
                                        let addToCartLink = document.getElementById("addToCart");

                                        function updateCartLink() {
                                            let sizeId = sizeSelect.value;
                                            let quantity = quantitySelect.value;
                                            let baseUrl = "CartController?action=add&username=<%=username%>&shoesId=<%=shoesId%>&colorId=<%=request.getAttribute("colorId")%>";
                                            addToCartLink.setAttribute("href", baseUrl + "&sizeId=" + sizeId + "&quantity=" + quantity);
                                        }

                                        // Gán sự kiện cho cả hai select
                                        sizeSelect.addEventListener("change", updateCartLink);
                                        quantitySelect.addEventListener("change", updateCartLink);
                                    });
                                    document.addEventListener("DOMContentLoaded", function () {
                                        let sizeSelect = document.getElementById("sizeId");
                                        let quantitySelect = document.getElementById("quantity");
                                        let addToCartLink = document.getElementById("buy-now");

                                        function updateBuyNow() {
                                            let sizeId = sizeSelect.value;
                                            let quantity = quantitySelect.value;
                                            let baseUrl = "AllCartController?action=buyNow&username=<%=username%>&shoesId=<%=shoesId%>&colorId=<%=request.getAttribute("colorId")%>";
                                            addToCartLink.setAttribute("href", baseUrl + "&sizeId=" + sizeId + "&quantity=" + quantity);
                                        }

                                        // Gán sự kiện cho cả hai select
                                        sizeSelect.addEventListener("change", updateBuyNow);
                                        quantitySelect.addEventListener("change", updateBuyNow);
                                    });
        </script>
    </body>
</html>
