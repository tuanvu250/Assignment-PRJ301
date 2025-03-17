<%-- 
    Document   : favouriteList
    Created on : Mar 8, 2025, 10:00:57 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            * {
                font-family: "Montserrat", sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                text-decoration: none;
                outline: none;
                border: none;
                list-style-type: none;
            }

            body {
                background-color: #EAE4DA;
            }

            * {
                user-select: none;
                cursor: default;
            }

            input:hover, select:hover {
                cursor: pointer;
            }

            .favourite {
                margin: 80px;
            }

            @media (max-width: 992px) {
                .favourite {
                    margin: 40px 20px;
                }
            }

            .favourite h1 {
                text-align: center;
                margin-bottom: 60px;    
            }

            .favourite-container {
                display: flex;
                flex-direction: column;
            }

            .favourite-item {
                display: flex;
                gap: 36px;
                justify-content: center;
                align-items: center;
                padding: 30px 80px;
            }

            @media (max-width: 1200px) {
                .favourite-item {
                    padding: 30px 40px;
                }
            }

            @media (max-width: 992px) {
                .favourite-item {
                    padding: 30px 20px;
                }
            }

            @media (max-width: 768px) {
                .favourite-item {
                    flex-direction: column;
                    text-align: center;
                    padding: 20px 10px;
                }

                .favourite-info {
                    align-items: center;
                }

                .favourite-btn {
                    flex-direction: row;
                }
            }

            .favourite-info {
                display: flex;
                flex-direction: column;
                gap: 22px;
                justify-content: flex-start;
                flex: 2;
            }

            .favourite-price {
                display: flex;
                gap: 30px;
            }

            .sale-price {
                text-decoration: line-through;
                color: #888;
            }

            .favourite-choice {
                display: flex;
                gap: 20px;
                align-items: flex-end;
                flex-wrap: wrap;
            }

            @media (max-width: 768px) {
                .favourite-choice {
                    justify-content: center;
                }
            }

            .favourite-color {
                display: flex;
                gap: 8px;
            }

            .favourite-color a {
                display: inline-block;
                height: 30px;
                width: 30px;
                background-color: red;  
                border-radius: 50%;
                transition: transform 0.2s ease;
            }

            .favourite-color a:hover {
                transform: scale(1.1);
            }

            .favourite-color div {
                height: 40px;
                width: 40px;
                display: flex;
                justify-content: center;
                align-items: center;
                transition: all 0.2s ease;
            }

            .favourite-size {
                display: flex;
                flex-direction: column;
                gap: 4px;
            }

            .favourite-size select {
                font-size: 18px;
                width: 80px;
                height: 40px;
                text-align: center;
                border: 1px solid #1d1d1b;
                background-color: #fff;
                border-radius: 4px;
            }

            .favourite-btn {
                display: flex;
                flex-direction: column;
                gap: 16px;
                text-align: center;
            }

            .favourite-btn a {
                padding: 16px 32px;
                font-size: 18px;
                width: 10vw;
                min-width: 120px;
                border-radius: 4px;
                transition: all 0.3s ease;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            @media (max-width: 992px) {
                .favourite-btn a {
                    width: 150px;
                }
            }

            .favourite-cart {
                background-color: #EAE4DA;
                color: #1d1d1b;
                border: 2px solid #1d1d1b;
            }

            .favourite-delete {
                background-color: #1d1d1b;
                color: #EAE4DA;
            }

            .favourite-name {
                font-size: 18px;
                color: #1d1d1b;
                font-weight: 600;
                transition: color 0.3s ease;
            }

            .favourite-name:hover {
                color: #C63F3E;
                cursor: pointer;
            }

            .favourite-item {
                border-bottom: dashed #1d1d1b 1px;
            }

            .favourite-item:first-child {
                border-top: solid #1d1d1b 2px;
            }

            .favourite-item:last-child {
                border-bottom: solid #1d1d1b 2px;
            }

            .favourite-btn a:hover {
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                cursor: pointer;
                transform: translateY(-2px);
            }

            .favourite-footer {
                margin-top: 40px;
                display: flex;
                justify-content: space-between;
                text-align: center;
            }

            .favourite-footer a {
                width: 10vw;
                min-width: 120px;
                color: #EAE4DA;
                background-color: #1d1d1b;
                padding: 16px 0;
                border-radius: 4px;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            @media (max-width: 768px) {
                .favourite-footer a {
                    width: 45%;
                }
            }

            .favourite-footer a:hover {
                background-color: #C63F3E;
                cursor: pointer;
                transform: translateY(-2px);
            }

            .favourite-cart.added {
                background-color: #C63F3E;
                color: #FFF;
            }

            .favourite-color div.added {
                border: solid 2px #1d1d1b;
                border-radius: 50%;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Favourite Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="favourite">
            <h1>FAVOURITE LIST</h1>
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
                        <a class="favourite-cart"><i class="fa-solid fa-cart-shopping"></i></a>
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
                        <a class="favourite-cart"><i class="fa-solid fa-cart-shopping"></i></a>
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
                        <a class="favourite-cart"><i class="fa-solid fa-cart-shopping"></i></a>
                        <a class="favourite-delete"><i class="fa-solid fa-trash"></i></a>
                    </div>
                </div>
            </div>
            <div class="favourite-footer">
                <a>Clear All</a>
                <a>Continue</a>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script>
            document.querySelectorAll(".favourite-cart").forEach(link => {
                link.addEventListener("click", function () {
                    this.classList.toggle("added");
                });
            });
            document.querySelectorAll(".favourite-color div").forEach(link => {
                link.addEventListener("click", function () {
                    this.classList.toggle("added");
                });
            });
        </script>
    </body>
</html>
