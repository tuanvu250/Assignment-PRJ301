<%-- 
    Document   : productDetailForm
    Created on : Mar 18, 2025, 9:12:54 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/productDetailForm.css">    
    </head>
    <body>
        <div class="container">
            <div class="form-container">
                <h1>Add Product Details</h1>
                <form id="productDetailsForm" method="post" action="" enctype="multipart/form-data">
                    <div class="form-row">
                        <!-- Color Selection as Select -->
                        <div class="form-col">
                            <div class="form-group">
                                <label for="color">Color</label>
                                <select id="color" name="color" required>
                                    <option value="" disabled selected>Select color</option>
                                    <option value="red" class="color-option">
                                        Red 
                                    </option>
                                    <option value="blue" class="color-option">
                                        Blue
                                    </option>
                                    <option value="black" class="color-option">
                                        Black
                                    </option>
                                    <option value="white" class="color-option">
                                        White
                                    </option>
                                </select>
                            </div>
                        </div>

                        <!-- Size Selection -->
                        <div class="form-col">
                            <div class="form-group">
                                <label for="size">Size</label>
                                <select id="size" name="size" required>
                                    <option value="" disabled selected>Select size</option>
                                    <option value="35">35</option>
                                    <option value="36">36</option>
                                    <option value="37">37</option>
                                    <option value="38">38</option>
                                    <option value="39">39</option>
                                    <option value="40">40</option>
                                    <option value="41">41</option>
                                    <option value="42">42</option>
                                    <option value="43">43</option>
                                    <option value="44">44</option>
                                    <option value="45">45</option>
                                    <option value="46">46</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Quantity -->
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <input type="number" id="quantity" name="quantity" min="1" required>
                    </div>

                    <!-- Image Uploads -->
                    <h2>Product Images</h2>
                    <div class="image-uploads">
                        <div class="image-upload" onclick="document.getElementById('image1').click()">
                            <input type="file" id="image1" name="image1" accept="image/*" style="display: none;" onchange="previewImage(this, 'preview1')">
                            <i class="fas fa-cloud-upload-alt" style="font-size: 24px; color: #666;"></i>
                            <p>Upload Main Image</p>
                            <img id="preview1" class="image-preview">
                        </div>
                        <div class="image-upload" onclick="document.getElementById('image2').click()">
                            <input type="file" id="image2" name="image2" accept="image/*" style="display: none;" onchange="previewImage(this, 'preview2')">
                            <i class="fas fa-cloud-upload-alt" style="font-size: 24px; color: #666;"></i>
                            <p>Upload Image 2</p>
                            <img id="preview2" class="image-preview">
                        </div>
                        <div class="image-upload" onclick="document.getElementById('image3').click()">
                            <input type="file" id="image3" name="image3" accept="image/*" style="display: none;" onchange="previewImage(this, 'preview3')">
                            <i class="fas fa-cloud-upload-alt" style="font-size: 24px; color: #666;"></i>
                            <p>Upload Image 3</p>
                            <img id="preview3" class="image-preview">
                        </div>
                        <div class="image-upload" onclick="document.getElementById('image4').click()">
                            <input type="file" id="image4" name="image4" accept="image/*" style="display: none;" onchange="previewImage(this, 'preview4')">
                            <i class="fas fa-cloud-upload-alt" style="font-size: 24px; color: #666;"></i>
                            <p>Upload Image 4</p>
                            <img id="preview4" class="image-preview">
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save Details</button>
                    </div>
                </form>
            </div>
        </div>
        <script src="<%= request.getContextPath()%>/assets/js/productDetailForm.js"></script>
    </body>
</html>
