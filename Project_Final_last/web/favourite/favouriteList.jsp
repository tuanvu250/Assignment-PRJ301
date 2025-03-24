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
                            <p><%=currencyVN.format(shoes.getPrice())%></p>
                            <p class="sale-price">XXX.XXX VND</p>
                        </div>
                        <form class="favourite-choice" id="form_<%=shoes.getShoes_id()%>" action="<%= request.getContextPath()%>/CartController">
                            <input type="hidden" name="action" value="add"/>
                            <input type="hidden" name="username" value="<%=username%>"/>
                            <input type="hidden" id="colorId_<%=shoes.getShoes_id()%>" name="colorId" value="<%=colorId%>"/>
                            <input type="hidden" name="shoesId" value="<%=shoes.getShoes_id()%>"/>
                            <div class="favourite-color">
                                <%
                                    for (int i = 1; i <= size; i++) {
                                        ProductColorDTO color = listColor.get(i - 1);
                                %>
                                <div class="<%=shoes.getShoes_id()%>" onclick="updateColor('<%=shoes.getShoes_id()%>', '<%= color.getColor_id()%>', this)" 
                                     <%if (color.getColor_id().equals(colorId)) {%>
                                     style="border: 2px #1d1d1b solid; border-radius: 50%;" <%}%>>
                                    <a
                                        style="background-color: <%=color.getColor_code()%>"> </a>
                                </div>
                                <%}%>
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
                        </form>
                        <%
                            if (session.getAttribute("errorCart") != null && session.getAttribute("shoesId").equals(shoes.getShoes_id())) {
                        %>
                        <h3 style="color: #C63F3E;"><%=session.getAttribute("errorCart")%></h3>
                        <%session.setAttribute("errorCart", null);
                          session.setAttribute("shoesId", null);
                        }%>
                    </div>
                    <div class="favourite-btn">
                        <button form="form_<%=shoes.getShoes_id()%>" type="submit">
                            <a class="favourite-cart"><i class="fa-solid fa-cart-shopping"></i></a>
                        </button>
                        <a href="FavController?action=delete&username=<%=username%>&shoesId=<%=shoes.getShoes_id()%>"
                           class="favourite-delete"><i class="fa-solid fa-trash"></i></a>
                    </div>
                </div> 
                <%}
                } else {%> 
                <h3 style="text-align: center; color: #C63F3E">There are no more products in your favourite list.</h3>
                <%}%>
            </div>
            <div class="favourite-footer">
                <a href="AllFavController?action=deleteAll&username=<%=username%>">Clear All</a>
                <a onclick="updateFilter('gender', '')">Continue</a>
            </div>
        </div>
        <%@include file="../includes/footer.jsp" %>
        <script src="../assets/js/cartList.js"></script>
        <script>
                    function updateColor(shoesId, colorId, element) {
                        // Cập nhật input hidden cho đúng sản phẩm
                        document.getElementById("colorId_" + shoesId).value = colorId;

                        // Chỉ xóa border của màu trong đúng sản phẩm đó
                        document.querySelectorAll("." + shoesId).forEach(box => {
                            box.style.border = "none";
                        });

                        // Thêm border vào màu được chọn
                        element.style.border = "2px solid #1d1d1b";
                        element.style.borderRadius = "50%";
                    }
        </script>
    </body>
</html>
