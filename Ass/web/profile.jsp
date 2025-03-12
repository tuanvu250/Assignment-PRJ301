<%-- 
    Document   : profile
    Created on : Mar 11, 2025, 4:10:13 PM
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

            *{
                user-select: none;
                cursor: default;
            }

            input:hover {
                cursor:text;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="profile">
            <div class="profile-left">
                <form>
                    <h2>Profile picture</h2>
                    <img src="img/avt-user-test.jpg">
                    <input type="file" name="file" accept="image/*">
                    <button type="submit">Update your picture</button>
                </form>
            </div>
            <div class="profile-right">
                
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
