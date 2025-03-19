<%-- 
    Document   : productDetail
    Created on : Mar 10, 2025, 12:04:53 PM
    Author     : ADMIN
--%>

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
            if(request.getAttribute("shoesId") != null && request.getAttribute("colorIndex") != null) {
                String shoesId = request.getAttribute("shoesId") + "";
                String colorIndex = request.getAttribute("colorIndex") + "";
                int index = Integer.parseInt(colorIndex) + 0;
                ShoesProductDAO shoesdao = new ShoesProductDAO();
                ShoesProductDTO shoes = shoesdao.readById(shoesId);
                List<ProductColorDTO> listColor = shoesdao.colorOfShoes(shoesId);
                int size = listColor.size();
        %>
        <div class="product-link">
            <a>Product</a>
            <a>Product line</a>
            <a><%=shoes.getShoes_name()%></a>
        </div>
        <div class="detail-container">
            <div class="slider-container">
                <div class="img-slider">
                    <div class="img-list">
                        <div>
                            <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=1 + 4 * (index - 1)%>.jpg">
                        </div>
                        <div>
                            <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=2 + 4 * (index - 1)%>.jpg">
                        </div>
                        <div>
                            <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=3 + 4 * (index - 1)%>.jpg">
                        </div>
                        <div>
                            <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=4 + 4 * (index - 1)%>.jpg">
                        </div>
                    </div>
                    <div class="img-btn">
                        <button id="prev"><i class="fa-solid fa-chevron-left"></i></button>
                        <button id="next"><i class="fa-solid fa-chevron-right"></i></button>
                    </div>
                </div>
                <ul class="thumnails">
                    <li><img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=1 + 4 * (index - 1)%>.jpg" alt="thumnail_1"></li>
                    <li><img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=2 + 4 * (index - 1)%>.jpg" alt="thumnail_2"></li>
                    <li><img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=3 + 4 * (index - 1)%>.jpg" alt="thumnail_3"></li>
                    <li><img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=4 + 4 * (index - 1)%>.jpg" alt="thumnail_4"></li>
                </ul>
            </div>
            <div class="detail-info">
                <div class="detail-text">
                    <h2><%=shoes.getShoes_name()%></h2>
                    <p>Product ID <span><%=shoes.getShoes_id()%></span></p>
                    <h2><%=shoes.getPrice()%> VND</h2>
                </div>
                <div class="detail-color">
                    <%
                        for(int i = 1; i <= size; i++) {
                            ProductColorDTO color = listColor.get(i-1);
                    %>
                    <div>
                        <a href="ShoesProductController?shoesId=<%=shoesId%>&colorIndex=<%=i%>"
                            style="background-color: <%=color.getColor_code()%>"> </a>
                    </div>
                    <%;}%>
                </div>
                <div class="detail-btn">
                    <div class="size-quantity">
                        <div class="btn-size">
                            <label>Size</label>
                            <select>
                                <option selected hidden></option>
                                <%
                                    String colorId = null;
                                    if(request.getAttribute("colorId") != null) {
                                        colorId = request.getAttribute("colorId") + "";
                                    }
                                    ProductSizeDAO sizeDAO = new ProductSizeDAO();
                                    List<ProductSizeDTO> sizeList = sizeDAO.checkSize(shoesId, colorId);
                                    for(ProductSizeDTO sizeShoes : sizeList) {
                                %>
                                <option><%=sizeShoes.getSize_num()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="btn-quantity">
                            <label>Quantity</label>
                            <select>
                                <option selected hidden></option>
                                <%
                                    for(int i = 1; i <= 10; i++) {
                                %>
                                <option><%=i%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="detail-cart">
                        <a>Add to cart</a>
                        <a><i class="fa-regular fa-heart"></i></a>
                    </div>
                    <div class="order-now">
                        <a>ORDER NOW</a>
                    </div>
                </div>
                <div class="info-detail">
                    <h3 class="">Product infomation <i class="fa-solid fa-chevron-down"></i></h3>
                    <div>
                        <p>abc xyz</p>
                        <p>abc xyz</p>
                        <p>abc xyz</p>
                        <p>abc xyz</p>
                        <img src="<%= request.getContextPath()%>/assets/img/img-home/info-table.jpg">
                    </div>
                </div>
            </div>
        </div>
                    <%}%>
        <%@include file="../includes/footer.jsp" %>
        <script src="<%= request.getContextPath()%>/assets/js/productDetail.js"></script>
    </body>
</html>
