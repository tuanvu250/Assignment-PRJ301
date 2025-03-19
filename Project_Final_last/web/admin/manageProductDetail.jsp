<%-- 
    Document   : manageProductDetail
    Created on : Mar 18, 2025, 9:01:56 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/manageProductDetail.css">    
    </head>
    <body>
        <div class="page-container" >
            <%@include file="../includes/sidebar.jsp" %>
            <div class="container">
                <div class="header">
                    <h1>Product Detail</h1>
                    <a href="manage-products.html" class="back-link">
                        <i class="fas fa-arrow-left"></i> Back to Manage Products
                    </a>
                </div>

                <div class="product-info">
                    <div class="info-row">
                        <div class="info-label">Product ID:</div>
                        <div class="info-value">P001</div>
                    </div>
                    <div class="info-row">
                        <div class="info-label">Name:</div>
                        <div class="info-value">Classic T-Shirt</div>
                    </div>
                </div>

                <table class="product-table">
                    <thead>
                        <tr>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Quantity</th>
                            <th>Images</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Indigo Color, Size 35 -->
                        <tr>
                            <td class="color-cell">
                                <div class="color-indicator" style="background-color: #3F51B5;"></div>
                                <span>Indigo (#3F51B5)</span>
                            </td>
                            <td><span class="size-badge">35</span></td>
                            <td class="quantity-cell">25</td>
                            <td>
                                <div class="images-grid">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 1" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 2" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 3" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 4" class="product-image">
                                </div>
                            </td>
                            <td>
                                <div class="row-actions">
                                    <a href="edit-variant.html?color=3F51B5&size=35" class="row-action row-edit" title="Edit Variant">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="delete-variant.html?color=3F51B5&size=35" class="row-action row-delete" title="Delete Variant">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <!-- Indigo Color, Size 36 -->
                        <tr>
                            <td class="color-cell">
                                <div class="color-indicator" style="background-color: #3F51B5;"></div>
                                <span>Indigo (#3F51B5)</span>
                            </td>
                            <td><span class="size-badge">36</span></td>
                            <td class="quantity-cell">18</td>
                            <td>
                                <div class="images-grid">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 1" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 2" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 3" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 4" class="product-image">
                                </div>
                            </td>
                            <td>
                                <div class="row-actions">
                                    <a href="edit-variant.html?color=3F51B5&size=36" class="row-action row-edit" title="Edit Variant">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="delete-variant.html?color=3F51B5&size=36" class="row-action row-delete" title="Delete Variant">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <!-- Indigo Color, Size 37 -->
                        <tr>
                            <td class="color-cell">
                                <div class="color-indicator" style="background-color: #3F51B5;"></div>
                                <span>Indigo (#3F51B5)</span>
                            </td>
                            <td><span class="size-badge">37</span></td>
                            <td class="quantity-cell">12</td>
                            <td>
                                <div class="images-grid">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 1" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 2" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 3" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 4" class="product-image">
                                </div>
                            </td>
                            <td>
                                <div class="row-actions">
                                    <a href="edit-variant.html?color=3F51B5&size=37" class="row-action row-edit" title="Edit Variant">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="delete-variant.html?color=3F51B5&size=37" class="row-action row-delete" title="Delete Variant">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <!-- Red Color, Size 35 -->
                        <tr>
                            <td class="color-cell">
                                <div class="color-indicator" style="background-color: #F44336;"></div>
                                <span>Red (#F44336)</span>
                            </td>
                            <td><span class="size-badge">35</span></td>
                            <td class="quantity-cell">15</td>
                            <td>
                                <div class="images-grid">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 1" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 2" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 3" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 4" class="product-image">
                                </div>
                            </td>
                            <td>
                                <div class="row-actions">
                                    <a href="edit-variant.html?color=F44336&size=35" class="row-action row-edit" title="Edit Variant">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="delete-variant.html?color=F44336&size=35" class="row-action row-delete" title="Delete Variant">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <!-- Red Color, Size 37 -->
                        <tr>
                            <td class="color-cell">
                                <div class="color-indicator" style="background-color: #F44336;"></div>
                                <span>Red (#F44336)</span>
                            </td>
                            <td><span class="size-badge">37</span></td>
                            <td class="quantity-cell">8</td>
                            <td>
                                <div class="images-grid">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 1" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 2" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 3" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 4" class="product-image">
                                </div>
                            </td>
                            <td>
                                <div class="row-actions">
                                    <a href="edit-variant.html?color=F44336&size=37" class="row-action row-edit" title="Edit Variant">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="delete-variant.html?color=F44336&size=37" class="row-action row-delete" title="Delete Variant">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>

                        <!-- Green Color, Size 36 -->
                        <tr>
                            <td class="color-cell">
                                <div class="color-indicator" style="background-color: #4CAF50;"></div>
                                <span>Green (#4CAF50)</span>
                            </td>
                            <td><span class="size-badge">36</span></td>
                            <td class="quantity-cell">20</td>
                            <td>
                                <div class="images-grid">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 1" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 2" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 3" class="product-image">
                                    <img src="/placeholder.svg?height=80&width=140" alt="Product Image 4" class="product-image">
                                </div>
                            </td>
                            <td>
                                <div class="row-actions">
                                    <a href="edit-variant.html?color=4CAF50&size=36" class="row-action row-edit" title="Edit Variant">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="delete-variant.html?color=4CAF50&size=36" class="row-action row-delete" title="Delete Variant">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

                <div class="action-buttons">
                    <a href="add-variant.html" class="action-button add-button">
                        <i class="fas fa-plus"></i> Add Variant
                    </a>
                    <a href="edit-product.html" class="action-button edit-button">
                        <i class="fas fa-edit"></i> Edit Product
                    </a>
                    <a href="delete-product.html" class="action-button delete-button">
                        <i class="fas fa-trash"></i> Delete Product
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
