-- Thêm dữ liệu vào USER_ROLE
INSERT INTO USER_ROLE (ROLE_ID, ROLE_NAME) VALUES 
(1, 'Admin'),
(2, 'Customer'),
(3, 'Seller'),
(4, 'Moderator'),
(5, 'Support');

-- Thêm dữ liệu vào USERS
INSERT INTO USERS (USER_ID, FULLNAME, USER_NAME, PASSWORD, EMAIL, PHONE, ROLE_ID) VALUES 
('U001', 'Nguyen Van A', 'A01', 'pw123', 'a@gmail.com', 123456789, 2),
('U002', 'Tran Thi B', 'tranthib', 'password2', 'b@gmail.com', 123456788, 2),
('U003', 'Le Van C', 'levanc', 'password3', 'c@gmail.com', 123456787, 3),
('U004', 'Pham Thi D', 'A02', 'pw123', 'd@gmail.com', 123456786, 1),
('U005', 'Hoang Van E', 'hoangvane', 'password5', 'e@gmail.com', 123456785, 4);

-- Thêm dữ liệu vào STYLE_PRODUCT
INSERT INTO STYLE_PRODUCT (STYLE_ID, STYLE_NAME) VALUES 
('S001', 'Casual'),
('S002', 'Sport'),
('S003', 'Formal'),
('S004', 'Sneakers'),
('S005', 'Boots');

-- Thêm dữ liệu vào PRODUCT_LINE
INSERT INTO PRODUCT_LINE (LINE_ID, LINE_NAME) VALUES 
('L001', 'Running'),
('L002', 'Basketball'),
('L003', 'Office'),
('L004', 'Hiking'),
('L005', 'Casual');

-- Thêm dữ liệu vào COLLECTIONS
INSERT INTO COLLECTIONS (COLL_ID, COLL_NAME) VALUES 
('C001', 'Summer 2024'),
('C002', 'Winter 2024'),
('C003', 'Spring 2025'),
('C004', 'Fall 2025'),
('C005', 'Exclusive Edition');

-- Thêm dữ liệu vào METERIAL
INSERT INTO METERIAL (MET_ID, MET_NAME) VALUES 
('M001', 'Leather'),
('M002', 'Mesh'),
('M003', 'Canvas'),
('M004', 'Synthetic'),
('M005', 'Rubber');

-- Thêm dữ liệu vào PRODUCT_COLOR
INSERT INTO PRODUCT_COLOR (COLOR_ID, COLOR_NAME) VALUES 
('CL001', 'Red'),
('CL002', 'Blue'),
('CL003', 'Black'),
('CL004', 'White'),
('CL005', 'Green');

-- Thêm dữ liệu vào SHOES_PRODUCT
INSERT INTO SHOES_PRODUCT (SHOES_ID, SHOES_NAME, PRODUCE_DATE, PRICE, SIZE, GENDER, DESCRIPTION, STATUS, STYLE_ID, LINE_ID, COLL_ID, MET_ID) VALUES 
('SP001', 'Nike Air Max', '2024-01-15', 150.00, 42.5, 'Male', 'Comfortable running shoes', 'Available', 'S002', 'L001', 'C001', 'M002'),
('SP002', 'Adidas Superstar', '2023-12-20', 120.00, 41.0, 'Unisex', 'Classic street style', 'Sale', 'S004', 'L005', 'C003', 'M003'),
('SP003', 'Puma Ignite', '2024-02-10', 130.00, 40.5, 'Female', 'High-performance sports shoes', 'Available', 'S002', 'L002', 'C002', 'M002'),
('SP004', 'Vans Old Skool', '2023-11-25', 80.00, 42.0, 'Unisex', 'Skateboard shoes', 'Soldout', 'S004', 'L005', 'C004', 'M003'),
('SP005', 'Timberland Boots', '2024-03-05', 200.00, 43.0, 'Male', 'Durable hiking boots', 'Available', 'S005', 'L004', 'C005', 'M001');

-- Thêm dữ liệu vào SHOES_COLOR
INSERT INTO SHOES_COLOR (SHOES_ID, COLOR_ID) VALUES 
('SP001', 'CL002'),
('SP002', 'CL003'),
('SP003', 'CL001'),
('SP004', 'CL004'),
('SP005', 'CL005');

-- Thêm dữ liệu vào CART
INSERT INTO CART (CART_ID, USER_ID) VALUES 
('CART001', 'U001'),
('CART002', 'U002'),
('CART003', 'U003'),
('CART004', 'U004'),
('CART005', 'U005');

-- Thêm dữ liệu vào CART_DETAIL
INSERT INTO CART_DETAIL (CART_ID, SHOES_ID, QUANTITY, PRICE) VALUES 
('CART001', 'SP001', 1, 150.00),
('CART002', 'SP002', 2, 120.00),
('CART003', 'SP003', 1, 130.00),
('CART004', 'SP004', 3, 80.00),
('CART005', 'SP005', 1, 200.00);

-- Thêm dữ liệu vào ORDERS
INSERT INTO ORDERS (ORDER_ID, STATUS, DATE_ORDERED, ADDRESS, TOTAL_PRICE, USER_ID) VALUES 
('O001', 'Pending', '2024-03-01', '123 Street, City A', 150.00, 'U001'),
('O002', 'Shipped', '2024-02-25', '456 Avenue, City B', 240.00, 'U002'),
('O003', 'Processing', '2024-03-02', '789 Road, City C', 130.00, 'U003'),
('O004', 'Delivered', '2024-02-28', '101 Blvd, City D', 240.00, 'U004'),
('O005', 'Cancelled', '2024-03-05', '555 Square, City E', 200.00, 'U005');

-- Thêm dữ liệu vào PAYMENT
INSERT INTO PAYMENT (PAYMENT_ID, USER_ID, ORDER_ID, DATE_PAY, METHOD_PAY, PRICE) VALUES 
('P001', 'U001', 'O001', '2024-03-01', 'Credit Card', 150.00),
('P002', 'U002', 'O002', '2024-02-26', 'PayPal', 240.00),
('P003', 'U003', 'O003', '2024-03-02', 'Bank Transfer', 130.00),
('P004', 'U004', 'O004', '2024-02-28', 'Cash on Delivery', 240.00),
('P005', 'U005', 'O005', '2024-03-05', 'Credit Card', 200.00);

-- Thêm dữ liệu vào ORDERS_DETAIL
INSERT INTO ORDERS_DETAIL (ORDER_ID, SHOES_ID, QUANTITY, PRICE) VALUES 
('O001', 'SP001', 1, 150.00),
('O002', 'SP002', 2, 120.00),
('O003', 'SP003', 1, 130.00),
('O004', 'SP004', 3, 80.00),
('O005', 'SP005', 1, 200.00);
