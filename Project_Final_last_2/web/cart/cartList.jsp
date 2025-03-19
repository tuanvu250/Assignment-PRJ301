<%-- 
    Document   : cartList
    Created on : Mar 8, 2025, 11:54:55 AM
    Author     : ADMIN
--%>

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
                    <div class="favourite-item">
                        <img src="img/Rectangle_43.png">
                        <div class="favourite-info">
                            <a href="#" class="favourite-name">Abc xyz</a>
                            <div class="favourite-price">
                                <p>XXX.XXX VND</p>
                                <p class="sale-price">XXX.XXX VND</p>
                            </div>
                            <div class="favourite-choice">
                                <div class="favourite-color">
                                    <div>
                                        <a></a>
                                    </div>
                                    <div>
                                        <a></a>
                                    </div>
                                    <div>
                                        <a></a>
                                    </div>
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
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="favourite-btn">
                            <a class="favourite-cart"><i class="fa-regular fa-heart"></i></a>
                            <a class="favourite-delete"><i class="fa-solid fa-trash"></i></a>
                        </div>
                    </div>
                    <div class="favourite-item">
                        <img src="img/Rectangle_43.png">
                        <div class="favourite-info">
                            <a href="#" class="favourite-name">Abc xyz</a>
                            <div class="favourite-price">
                                <p>XXX.XXX VND</p>
                                <p class="sale-price">XXX.XXX VND</p>
                            </div>
                            <div class="favourite-choice">
                                <div class="favourite-color">
                                    <div>
                                        <a></a>
                                    </div>
                                    <div>
                                        <a></a>
                                    </div>
                                    <div>
                                        <a></a>
                                    </div>
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
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="favourite-btn">
                            <a class="favourite-cart"><i class="fa-regular fa-heart"></i></a>
                            <a class="favourite-delete"><i class="fa-solid fa-trash"></i></a>
                        </div>
                    </div>
                </div>
                <div class="favourite-footer">
                    <a>Clear All</a>
                    <a>Back to product</a>
                </div>

            </div>
            <div class="cart-bill">
                <h1>BILL</h1>
                <form>
                    <input type="text" placeholder="DISCOUNT CODE" class="discount-code">
                    <input type="submit" class="discount-btn" value="APPLY">
                </form>
                <div class="cart-price">
                    <div>
                        <p>Order</p>
                        <p>XXX.XXX VND</p>
                    </div>
                    <div>
                        <p>Discount</p>
                        <p>XXX.XXX VND</p>
                    </div>
                </div>
                <div class="cart-total">
                    <h3>Temporary total</h3>
                    <p>X.XXX.XXX VND</p>
                </div>
                <a class="cart-btn">CONTINUE</a>
            </div>
        </div>
        <%@include file="../includes/footer.jsp" %>
        <script src="../assets/js/cartList.js"></script>
    </body>
</html>
