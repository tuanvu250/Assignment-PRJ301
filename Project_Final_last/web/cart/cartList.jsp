<%-- 
    Document   : cartList
    Created on : Mar 8, 2025, 11:54:55 AM
    Author     : ADMIN
--%>

<%@page import="dao.VoucherDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dto.ProductSizeDTO"%>
<%@page import="dao.ProductSizeDAO"%>
<%@page import="dto.CartDTO"%>
<%@page import="dto.ProductColorDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.ShoesProductDTO"%>
<%@page import="dao.ShoesProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/cartList.css">    
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <div class="cart">
            <div class="favourite">
                <h1>CART</h1>
                <div class="favourite-container">
                    <%
                        String discountCode = "";
                        BigDecimal discount = BigDecimal.valueOf(0);
                        BigDecimal totalPrice = BigDecimal.valueOf(0);
                        BigDecimal totalSale = BigDecimal.valueOf(0);
                        if (session.getAttribute("listCart") != null) {
                            ShoesProductDAO shoesDAO = new ShoesProductDAO();
                            List<CartDTO> listCart = (List<CartDTO>) session.getAttribute("listCart");
                            for (CartDTO cart : listCart) {
                                List<ProductColorDTO> listColor = shoesDAO.colorOfShoes(cart.getShoes_id());
                                String colorId = cart.getColor_id();
                                ShoesProductDTO shoes = shoesDAO.readById(cart.getShoes_id());
                                int size = listColor.size();
                                totalPrice = totalPrice.add(cart.getPrice());
                    %>
                    <div class="favourite-item">
                        <img src="<%= request.getContextPath()%>/assets/img/img-products/<%=cart.getShoes_id()%>_<%=colorId%>_1.jpg"
                             style="max-width: 250px;">
                        <div class="favourite-info">
                            <a href="ShoesProductController?shoesId=<%=shoes.getShoes_id()%>&colorIndex=1" 
                               class="favourite-name"><%=shoes.getShoes_name()%></a>
                            <div class="favourite-price">
                                <% if (AuthUtils.isSale(shoes)) {
                                        BigDecimal sale = shoes.getPrice().multiply(BigDecimal.valueOf(AuthUtils.saleNum(shoes.getSale_id())));
                                        totalSale = totalSale.add(sale.multiply(BigDecimal.valueOf(cart.getQuantity())));%>
                                <p><%=currencyVN.format(shoes.getPrice().multiply(BigDecimal.valueOf(1 - AuthUtils.saleNum(shoes.getSale_id()))))%></p>
                                <p class="sale-price"><%=currencyVN.format(shoes.getPrice())%></p>
                                <%} else {%> 
                                <p><%=currencyVN.format(shoes.getPrice())%></p>
                                <%}%>
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
                                    <%}%>
                                </div>
                                <div class="favourite-size">
                                    <label>Size</label>
                                    <select>
                                        <option value="" selected hidden></option>
                                        <%
                                            ProductSizeDAO sizeDAO = new ProductSizeDAO();
                                            List<ProductSizeDTO> sizeList = sizeDAO.checkSize(shoes.getShoes_id(), colorId);
                                            for (ProductSizeDTO sizeShoes : sizeList) {
                                        %>
                                        <option value="<%=sizeShoes.getSize_id()%>"
                                                <%if (cart.getSize_id().equals(sizeShoes.getSize_id())) {%>
                                                selected<%}%>
                                                ><%=sizeShoes.getSize_num()%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="favourite-size">
                                    <label>Quantity</label>
                                    <select>
                                        <option value="" selected hidden></option>
                                        <%
                                            for (int i = 1; i <= 10; i++) {
                                        %>
                                        <option value="<%=i%>" 
                                                <%if (cart.getQuantity() == i) {%>selected<%}%>
                                                ><%=i%></option>
                                        <%}%> 
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="favourite-btn">
                            <%
                                if (shoesDAO.checkFav(shoes.getShoes_id(), username)) {
                            %> 
                            <a href="FavController?action=delete&username=<%=username%>&shoesId=<%=cart.getShoes_id()%>"
                               class="favourite-cart"><i class="fa-solid fa-heart"></i></a> <%} else {%>

                            <a href="FavController?action=add&username=<%=username%>&shoesId=<%=cart.getShoes_id()%>"
                               class="favourite-cart"><i class="fa-regular fa-heart"></i></a><%}%>

                            <a href="CartController?action=delete&username=<%=username%>&shoesId=<%=cart.getShoes_id()%>&colorId=<%=cart.getColor_id()%>&sizeId=<%=cart.getSize_id()%>"
                               class="favourite-delete"><i class="fa-solid fa-trash"></i></a>
                        </div>
                    </div>

                    <%}
                    } else {%> 
                    <h3 style="text-align: center; color: #C63F3E">There are no more products in your cart list.</h3>
                    <%}%>
                </div>
                <div class="favourite-footer">
                    <a href="AllCartController?action=deleteAll&username=<%=username%>"
                       >Clear All</a>
                    <a onclick="updateFilter('gender', '')">Back to product</a>
                </div>

            </div>
            <div class="cart-bill">
                <h1>BILL</h1>
                <form action="ApplyVoucherController">

                    <input name="discountCode" type="text" placeholder="DISCOUNT CODE" class="discount-code">
                    <input type="submit" class="discount-btn" value="APPLY">
                </form>
                <%if (session.getAttribute("errorVoucherNull") != null) {%>
                <p style="color: #C63F3E"><%=session.getAttribute("errorVoucherNull")%></p>
                <%session.removeAttribute("errorVoucherNull");
                    }%>

                <%if (session.getAttribute("errorVoucher") != null) {%>
                <p style="color: #C63F3E"><%=session.getAttribute("errorVoucher")%></p>
                <%session.removeAttribute("errorVoucher");
                    }%>

                <%if (session.getAttribute("successVoucher") != null) {%>
                <p style="color: green"><%=session.getAttribute("successVoucher")%></p>
                <%session.removeAttribute("successVoucher");
                    VoucherDAO vouDAO = new VoucherDAO();     
                    discountCode = (String) session.getAttribute("discountCode");
                    discount = BigDecimal.valueOf(vouDAO.getDiscount(discountCode));}%>
                <%
                    session.setAttribute("discountCode", discountCode);
                    discount = discount.multiply(totalPrice.subtract(totalSale));
                    totalSale = totalSale.add(discount);
                %>
                <div class="cart-price">
                    <div>
                        <p>Order</p>
                        <p><%=currencyVN.format(totalPrice)%></p>
                    </div>
                    <div>
                        <p>Discount</p>
                        <p><%=currencyVN.format(totalSale)%></p>
                    </div>
                </div>
                <div class="cart-total">
                    <h3>Temporary total</h3>
                    <p><%=currencyVN.format(totalPrice.subtract(totalSale))%></p>
                </div>
                <a href="<%= request.getContextPath()%>/payment/payment.jsp"
                    class="cart-btn">CONTINUE</a>
            </div>
        </div>
        <%@include file="../includes/footer.jsp" %>
        <script src="../assets/js/cartList.js"></script>
    </body>
</html>
