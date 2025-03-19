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
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 1000;
                visibility: hidden;
                opacity: 0;
                transition: opacity 0.3s, visibility 0.3s;
            }

            .overlay.active {
                visibility: visible;
                opacity: 1;
            }

            .popup {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
                width: 90%;
                max-width: 300px;
                padding: 24px;
                transform: translateY(-20px);
                transition: transform 0.3s;
            }

            .overlay.active .popup {
                transform: translateY(0);
            }

            .popup-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .popup-title {
                font-size: 1.25rem;
                font-weight: 600;
                color: #111827;
                text-align: center;
            }

            label {
                display: block;
                margin-bottom: 6px;
                font-size: 0.875rem;
                font-weight: 500;
                color: #111827;
            }

            .popup-button {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            .cancel-button {
                background-color: #f3f4f6;
                color: #374151;
                border: none;
                padding: 16px 32px;
                border-radius: 6px;
                font-size: 0.875rem;
                font-weight: 500;
                cursor: pointer;
                transition: background-color 0.2s;
            }

            .login-button {
                background-color: #C63F3E;               
                border: none;
                padding: 16px 32px;
                border-radius: 6px;
                cursor: pointer;
                transition: background-color 0.2s;
            }
            
            .login-button a {
                color: white;
                font-size: 0.875rem;
                font-weight: 500;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <div class="overlay" id="overlay">
            <div class="popup" role="dialog" aria-labelledby="popup-title" aria-modal="true">
                <div class="popup-header">
                    <h2 class="popup-title" id="popup-title">You must login to continue</h2>
                </div>
                <div class="popup-button">
                    <button class="cancel-button" type="button">Cancel</button>
                    <button class="login-button"><a href="<%= request.getContextPath()%>/user/login.jsp"
                                                    >Login</a></button>
                </div>
            </div>
        </div>
    </body>
</html>
