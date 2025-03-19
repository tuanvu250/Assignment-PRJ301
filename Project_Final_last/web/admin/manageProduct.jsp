<%-- 
    Document   : products
    Created on : Mar 15, 2025, 2:40:55 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/manageProduct.css">    
    </head>
    <body>
        <div class="page-container">
            <%@include file="../includes/sidebar.jsp" %>
            <div class="container">
                <div class="header">
                    <h1>Manage Products</h1>
                    <div class="search-bar">
                        <input type="text" placeholder="Search product name">
                        <button class="search-button">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Product ID</th>
                                <th>Name</th>
                                <th>Produce Date</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Gender</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Style</th>
                                <th>Product Line</th>
                                <th>Material</th>
                                <th>
                                    <a href="add-product.php" class="add-button">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>P001</td>
                                <td>Classic T-Shirt</td>
                                <td>2023-05-15</td>
                                <td>$29.99</td>
                                <td>120</td>
                                <td>Men</td>
                                <td class="truncate">Comfortable cotton t-shirt with classic fit</td>
                                <td class="status-active">Active</td>
                                <td>Casual</td>
                                <td>Summer Collection</td>
                                <td>Cotton</td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="product-detail.php?id=P001" class="detail-button">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="edit-product.php?id=P001" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="delete-product.php?id=P001" class="delete-button">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>P002</td>
                                <td>Slim Fit Jeans</td>
                                <td>2023-06-20</td>
                                <td>$59.99</td>
                                <td>85</td>
                                <td>Women</td>
                                <td class="truncate">Stylish slim fit jeans with stretch fabric</td>
                                <td class="status-active">Active</td>
                                <td>Modern</td>
                                <td>Denim Collection</td>
                                <td>Denim</td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="product-detail.php?id=P002" class="detail-button">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="edit-product.php?id=P002" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="delete-product.php?id=P002" class="delete-button">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>P003</td>
                                <td>Hooded Sweatshirt</td>
                                <td>2023-07-10</td>
                                <td>$45.99</td>
                                <td>65</td>
                                <td>Unisex</td>
                                <td class="truncate">Warm and comfortable hooded sweatshirt for all seasons</td>
                                <td class="status-active">Active</td>
                                <td>Sporty</td>
                                <td>Winter Collection</td>
                                <td>Cotton Blend</td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="product-detail.php?id=P003" class="detail-button">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="edit-product.php?id=P003" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="delete-product.php?id=P003" class="delete-button">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>P004</td>
                                <td>Summer Dress</td>
                                <td>2023-04-05</td>
                                <td>$79.99</td>
                                <td>42</td>
                                <td>Women</td>
                                <td class="truncate">Lightweight floral summer dress with adjustable straps</td>
                                <td class="status-inactive">Inactive</td>
                                <td>Elegant</td>
                                <td>Spring Collection</td>
                                <td>Polyester</td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="product-detail.php?id=P004" class="detail-button">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="edit-product.php?id=P004" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="delete-product.php?id=P004" class="delete-button">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>P005</td>
                                <td>Leather Jacket</td>
                                <td>2023-08-15</td>
                                <td>$129.99</td>
                                <td>28</td>
                                <td>Men</td>
                                <td class="truncate">Premium quality leather jacket with quilted lining</td>
                                <td class="status-active">Active</td>
                                <td>Vintage</td>
                                <td>Autumn Collection</td>
                                <td>Leather</td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="product-detail.php?id=P005" class="detail-button">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="edit-product.php?id=P005" class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="delete-product.php?id=P005" class="delete-button">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
