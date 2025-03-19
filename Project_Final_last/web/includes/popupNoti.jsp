<%-- 
    Document   : popupNoti
    Created on : Mar 19, 2025, 5:17:46 PM
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

            * {
                user-select: none;
                cursor: default;
            }

            a:hover {
                cursor: pointer;
            }
            .modal-bg {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.6);
                display: flex;
                justify-content: center;
                align-items: center;
                visibility: hidden;
                opacity: 0;
                transition: opacity 0.3s ease, visibility 0.3s ease;
                z-index: 1000;
            }

            .modal-bg.show {
                visibility: visible;
                opacity: 1;
            }

            .modal-box {
                background: #ffffff;
                width: 350px;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
                transform: scale(0.9);
                transition: transform 0.3s ease;
            }

            .modal-bg.show .modal-box {
                transform: scale(1);
            }

            .modal-header {
                text-align: center;
                font-size: 1.5rem;
                font-weight: bold;
                color: #333;
                margin-bottom: 15px;
            }

            .modal-actions {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .btn-cancel, .btn-login {
                padding: 12px 24px;
                border-radius: 6px;
                font-size: 0.9rem;
                font-weight: bold;
                cursor: pointer;
                transition: background 0.2s ease;
            }

            .btn-cancel {
                background: #e0e0e0;
                color: #333;
            }

            .btn-cancel:hover {
                background: #d6d6d6;
            }

            .btn-login {
                background: #C63F3E;
                color: white;
            }

            .btn-login:hover {
                background: #e04350;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="modal-bg" id="modal-bg">
            <div class="modal-box" role="dialog" aria-labelledby="modal-title" aria-modal="true">
                <div class="modal-header" id="modal-title">Please login to continue</div>
                <div class="modal-actions">
                    <button class="btn-cancel" type="button">Cancel</button>
                    <button class="btn-login" onclick="location.href='<%= request.getContextPath()%>/user/login.jsp'">Login</button>
                </div>
            </div>
        </div>
    </body>
</html>
