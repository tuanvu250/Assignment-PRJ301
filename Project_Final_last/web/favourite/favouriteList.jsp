<%-- 
    Document   : favouriteList
    Created on : Mar 8, 2025, 10:00:57 AM
    Author     : ADMIN
--%>

<%@page import="dto.ProductSizeDTO"%>
<%@page import="dao.ProductSizeDAO"%>
<%@page import="dto.ProductColorDTO"%>
<%@page import="dao.ShoesProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="dto.ShoesProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Favourite Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/favouriteList.css">    

    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <div class="favourite">
            <h1>FAVOURITE LIST</h1>
            <div class="favourite-container">
                <%
                    if (session.getAttribute("listFav") != null) {
                        ShoesProductDAO shoesDAO = new ShoesProductDAO();
                        List<ShoesProductDTO> listFav = (List<ShoesProductDTO>) session.getAttribute("listFav");
                        for (ShoesProductDTO shoes : listFav) {
                            ShoesProductDAO shoesdao = new ShoesProductDAO();
                            List<ProductColorDTO> listColor = shoesdao.colorOfShoes(shoes.getShoes_id());
                            String colorId = listColor.get(0).getColor_id();
                            int size = listColor.size();
                %>
                <div class="favourite-item">
                    <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=shoes.getShoes_id()%>_<%=colorId%>_1.jpg" 
                         style="max-width: 250px;">
                    <div class="favourite-info">
                        <a href="ShoesProductController?shoesId=<%=shoes.getShoes_id()%>&colorIndex=1"
                           class="favourite-name"><%=shoes.getShoes_name()%></a>
                        <div class="favourite-price">
                            <p><%=shoes.getPrice()%> VND</p>
                            <p class="sale-price">XXX.XXX VND</p>
                        </div>
                        <div class="favourite-choice">
                            <div class="favourite-color">
                                <%
                                    for (int i = 1; i <= size; i++) {
                                        ProductColorDTO color = listColor.get(i - 1);
                                %>
                                <div <%if (color.getColor_id().equals(colorId)) {%>
                                    style="border: 2px #1d1d1b solid; border-radius: 50%;" <%}%>>
                                    <a href=""
                                       style="background-color: <%=color.getColor_code()%>"> </a>
                                </div>
                                <%;
                                    }%>
                            </div>
                            <div class="favourite-size">
                                <label>Size</label>
                                <select name="sizeId">
                                    <option value="" selected hidden></option>
                                    <%
                                        ProductSizeDAO sizeDAO = new ProductSizeDAO();
                                        List<ProductSizeDTO> sizeList = sizeDAO.checkSize(shoes.getShoes_id(), colorId);
                                        for (ProductSizeDTO sizeShoes : sizeList) {
                                    %>
                                    <option value="<%=sizeShoes.getSize_id()%>"><%=sizeShoes.getSize_num()%></option>
                                    <%}%>
                                </select>
                            </div>
                            <div class="favourite-size">
                                <label>Quantity</label>
                                <select name="quantity">
                                    <option value="" selected hidden></option>
                                    <%
                                        for (int i = 1; i <= 10; i++) {
                                    %>
                                    <option value="<%=i%>"><%=i%></option>
                                    <%}%> 
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="favourite-btn">
                        <a class="favourite-cart"><i class="fa-solid fa-cart-shopping"></i></a>
                        <a href="FavController?action=delete&username=<%=username%>&shoesId=<%=shoes.getShoes_id()%>"
                           class="favourite-delete"><i class="fa-solid fa-trash"></i></a>
                    </div>
                </div> 
                <%}
                } else {%> 
                <h3 style="text-align: center;">There are no more products in your favourite list.</h3>
                <%}%>
            </div>
            <div class="favourite-footer">
                <a href="AllFavController?action=deleteAll&username=<%=username%>">Clear All</a>
                <a onclick="updateFilter('gender', '')">Continue</a>
            </div>
        </div>
        <%@include file="../includes/footer.jsp" %>
        <script src="../assets/js/cartList.js"></script>
    </body>
</html>
