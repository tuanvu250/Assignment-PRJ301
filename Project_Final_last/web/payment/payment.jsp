<%-- 
    Document   : payment
    Created on : Mar 8, 2025, 1:48:18 PM
    Author     : ADMIN
--%>

<%@page import="dto.ProductSizeDTO"%>
<%@page import="dao.ProductSizeDAO"%>
<%@page import="dao.VoucherDAO"%>
<%@page import="dao.ProductColorDAO"%>
<%@page import="dto.ProductColorDTO"%>
<%@page import="dto.ShoesProductDTO"%>
<%@page import="dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ShoesProductDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/payment.css">    
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <%
            String discountCode = "";
            BigDecimal discount = BigDecimal.valueOf(0);
            BigDecimal totalPrice = BigDecimal.valueOf(0);
            BigDecimal totalSale = BigDecimal.valueOf(0);
            if (session.getAttribute("listCart") != null) {
                ShoesProductDAO shoesDAO = new ShoesProductDAO();
                ProductColorDAO colorDAO = new ProductColorDAO();
                List<CartDTO> listCart = (List<CartDTO>) session.getAttribute("listCart");
                UserDTO user = AuthUtils.getUser(session);
        %>
        <form class="payment" action="<%= request.getContextPath()%>/OrderController">
            <div class="payment-info">
                <div class="deli-info">
                    <h2>DELIVERY INFORMATION</h2>
                    <div class="payment-form" >
                        <input type="text" placeholder="Full name" name="fullName" required
                               value="<%=user.getFull_name()%>"/>
                        <input type="tel" placeholder="Phone number" name="phone" required
                               value="<%=user.getPhone_number()%>"/>
                        <input type="email" placeholder="Email" name="email" required
                               value="<%=user.getEmail()%>"/>
                        <input type="text" placeholder="Address" name="address" required/> 
                    </div>
                </div>
                <div class="payment-method">
                    <h2>PAYMENT METHOD</h2>
                    <div class="payment-checkbox">
                        <div>
                            <input type="radio" value="Offline" name="paymentMethod" required/>
                            <label for="offline">Cash on Delivery</label>
                        </div>
                        <div>
                            <input type="radio" value="Online" name="paymentMethod"/>
                            <label for="online">Crebit / Debit Card / Smart Banking</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pay-bill">
                <h1>BILL</h1>
                <div class="bill-items">
                    <%
                        for (CartDTO cart : listCart) {
                            totalPrice = totalPrice.add(cart.getPrice());
                            ProductSizeDAO sizeDAO = new ProductSizeDAO();
                            ShoesProductDTO shoes = shoesDAO.readById(cart.getShoes_id());
                            if (AuthUtils.isSale(shoes)) {
                                BigDecimal sale = shoes.getPrice().multiply(BigDecimal.valueOf(AuthUtils.saleNum(shoes.getSale_id())));
                                totalSale = totalSale.add(sale.multiply(BigDecimal.valueOf(cart.getQuantity())));
                            }
                    %>
                    <div class="bill-detail">
                        <div>
                            <p><%=shoes.getShoes_name()%></p>
                            <p><%=currencyVN.format(shoes.getPrice())%></p>
                        </div>
                        <div>
                            <p><%=AuthUtils.nameColor(cart.getColor_id())%>, Size <%=AuthUtils.sizeNum(cart.getSize_id())%></p>
                            <p> x<%=cart.getQuantity()%> </p>
                        </div>
                    </div>
                    <%}%>
                </div>
                <%
                    VoucherDAO vouDAO = new VoucherDAO();     
                    discountCode = (String) session.getAttribute("discountCode");
                    discount = BigDecimal.valueOf(vouDAO.getDiscount(discountCode));
                    discount = discount.multiply(totalPrice.subtract(totalSale));
                    totalSale = totalSale.add(discount);
                %>
                <div class="pay-price">
                    <div>
                        <p>Subtotal</p>
                        <p><%=currencyVN.format(totalPrice)%></p>
                    </div>
                    <div>
                        <p>Discount</p>
                        <p>- <%=currencyVN.format(totalSale)%></p>
                    </div>
                    <div>
                        <p>Shipping charges</p>
                        <p><%=currencyVN.format(0)%></p>
                    </div>
                </div>
                <div class="pay-total">
                    <h3>TOTAL</h3>
                    <p><%=currencyVN.format(totalPrice.subtract(totalSale))%></p>
                </div>
                <input type="hidden" name="action" value="add"/>
                <input type="hidden" name="subtotal" value="<%=totalPrice%>"/>
                <input type="hidden" name="discount" value="<%=totalSale%>" />
                <input type="hidden" name="totalPrice" value="<%=totalPrice.subtract(totalSale)%>"/>
                <button type="submit">COMPLETE ORDER</button>
            </div>
        </form> <%}%>
        <%@include file="../includes/footer.jsp" %>
    </body>
</html>
