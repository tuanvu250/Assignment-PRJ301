<%-- 
    Document   : productForm
    Created on : Mar 18, 2025, 9:10:42 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/productForm.css">    

    </head>
    <body>
        <div class="container">
            <div class="form-container">
                <h1>Add New Product</h1>
                <form id="productForm" method="post" action="">
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Product Name</label>
                                <input type="text" id="name" name="name" required>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="produceDate">Produce Date</label>
                                <input type="date" id="produceDate" name="produceDate" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="number" id="price" name="price" step="0.01" required>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="quantity">Quantity</label>
                                <input type="number" id="quantity" name="quantity" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <select id="gender" name="gender" required>
                                    <option value="" disabled selected>Select gender</option>
                                    <option value="Men">Men</option>
                                    <option value="Women">Women</option>
                                    <option value="Unisex">Unisex</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="status">Status</label>
                                <select id="status" name="status" required>
                                    <option value="" disabled selected>Select status</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="style">Style</label>
                                <select id="style" name="style" required>
                                    <option value="" disabled selected>Select style</option>
                                    <option value="Casual">Casual</option>
                                    <option value="Modern">Modern</option>
                                    <option value="Sporty">Sporty</option>
                                    <option value="Elegant">Elegant</option>
                                    <option value="Vintage">Vintage</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-col">
                            <div class="form-group">
                                <label for="productLine">Product Line</label>
                                <select id="productLine" name="productLine" required>
                                    <option value="" disabled selected>Select product line</option>
                                    <option value="Summer Collection">Summer Collection</option>
                                    <option value="Winter Collection">Winter Collection</option>
                                    <option value="Spring Collection">Spring Collection</option>
                                    <option value="Autumn Collection">Autumn Collection</option>
                                    <option value="Denim Collection">Denim Collection</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="material">Material</label>
                        <select id="material" name="material" required>
                            <option value="" disabled selected>Select material</option>
                            <option value="Cotton">Cotton</option>
                            <option value="Denim">Denim</option>
                            <option value="Polyester">Polyester</option>
                            <option value="Leather">Leather</option>
                            <option value="Cotton Blend">Cotton Blend</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea id="description" name="description" required></textarea>
                    </div>

                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add Product</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
