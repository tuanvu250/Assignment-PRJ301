<%-- 
    Document   : favouriteList
    Created on : Mar 8, 2025, 10:00:57 AM
    Author     : ADMIN
--%>

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
                        List<ShoesProductDTO> listFav = (List<ShoesProductDTO>) session.getAttribute("listFav");
                        for (ShoesProductDTO shoes : listFav) {
                            ShoesProductDAO shoesdao = new ShoesProductDAO();
                            List<ProductColorDTO> listColor = shoesdao.colorOfShoes(shoes.getShoes_id());
                            int size = listColor.size();
                %>
                <div class="favourite-item">
                    <img src="asset/<%=shoes.getShoes_id()%>_1.jpg" style="max-width: 250px;">
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
                                <div>
                                    <a href=""
                                       style="background-color: <%=color.getColor_code()%>"> </a>
                                </div>
                                <%;
                                    }%>
                            </div>
                            <div class="favourite-size">
                                <label>Size</label>
                                <select>
                                    <option selected hidden></option>
                                    <option>35</option>
                                    <option>36</option>
                                    <option>37</option>
                                </select>
                            </div>
                            <div class="favourite-size">
                                <label>Quantity</label>
                                <select>
                                    <option selected hidden></option>
                                    <%
                                        for (int i = 1; i <= 10; i++) {
                                    %>
                                    <option><%=i%></option>
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
