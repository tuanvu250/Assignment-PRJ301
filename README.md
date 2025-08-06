# Bloom on Foot - E-commerce Shoe Store

## 📋 Project Description

**Bloom on Foot** is an online shoe retail web application developed using Java Servlet/JSP. The system provides comprehensive features for an online store with both admin dashboard and customer interface.

> "Bloom on Foot serves as a gentle reminder that every step is the beginning of endless creativity, freshness, and continuous growth."

## 🛠️ Technologies Used

- **Backend**: Java Servlet/JSP
- **Frontend**: HTML, CSS, JavaScript
- **Database**: SQL Server (JDBC)
- **Server**: Apache Tomcat
- **Build Tool**: Ant (NetBeans)
- **Libraries**: 
  - JavaMail API 1.6.2
  - SQL Server JDBC Driver (sqljdbc4.jar)

## 📁 Project Structure

```
Project_Final_last/
├── src/java/
│   ├── controller/          # Servlet Controllers
│   ├── dao/                 # Data Access Objects
│   ├── dto/                 # Data Transfer Objects
│   ├── services/            # Business Logic Services
│   └── utils/               # Utility Classes
├── web/
│   ├── admin/               # Admin Dashboard Pages
│   ├── assets/              # CSS, JS, Images
│   ├── cart/                # Shopping Cart Pages
│   ├── favourite/           # Wishlist Pages
│   ├── home/                # Home & About Pages
│   ├── includes/            # Shared Components (header, footer, sidebar)
│   ├── payment/             # Payment & Order Pages
│   ├── products/            # Product Display Pages
│   └── user/                # User Authentication Pages
├── lib/                     # External Libraries
└── nbproject/               # NetBeans Configuration
```

## ✨ Key Features

### 👥 For Customers
- **Product Browsing**: Browse shoe catalog with filters by gender, color, size, price, brand
- **Product Details**: View images, descriptions, prices, available colors and sizes
- **Shopping Cart**: Add/remove products, update quantities
- **Wishlist**: Save favorite products
- **Order Placement**: Complete checkout process
- **Account Management**: Registration, login, profile, order history
- **Vouchers**: Apply discount codes
- **Email**: Send OTP verification, forgot password

### 🔧 For Admin
- **Dashboard**: Overview statistics (users, products, orders, revenue)
- **Product Management**: CRUD operations for shoes, colors, sizes, materials
- **Order Management**: View and update order status
- **User Management**: Add/edit/delete user accounts
- **Voucher Management**: Create and manage discount codes
- **Category Management**: Product lines, styles, materials, colors

## 🚀 Installation and Setup

### System Requirements
- Java 8 or higher
- Apache Tomcat 8.5+
- SQL Server
- NetBeans IDE (recommended)

### Step 1: Clone the project
```bash
git clone <repository-url>
cd Project_Final_last
```

### Step 2: Database Configuration
1. Create SQL Server database
2. Import schema and data (if backup file available)
3. Update connection string in `context.xml`:
```xml
<Context path="/Project_Final_last"/>
```

### Step 3: Library Configuration
Ensure the following libraries are added to classpath:
- `sqljdbc4.jar` (SQL Server JDBC Driver)
- `javax.mail-1.6.2.jar` (JavaMail API)

### Step 4: Deploy on Tomcat
1. Open project in NetBeans
2. Right-click project → Run
3. Or build WAR file and deploy to Tomcat server

### Step 5: Access the Application
- **User Interface**: `http://localhost:8080/Project_Final_last/`
- **Admin Dashboard**: `http://localhost:8080/Project_Final_last/admin/dashboard.jsp`

## GUI Overview

### Homepage
- Banner with "DISCOVER" slogan
- Product categories: Sale, Male, Female
- Navigation menu with Products, About Us

### Product Page
- Filter sidebar (Status, Style, Product Line, Price, Material, Color)
- Grid view with product images
- Pagination
- Add to cart/wishlist functionality

### Admin Dashboard
- Metrics cards (Total Accounts, Products, Orders, etc.)
- Sidebar navigation for management modules
- Responsive design

## 🗄️ Database Schema

### Main Tables:
- **Users**: User account management
- **ShoesProduct**: Shoe product information
- **ProductColor**: Product colors
- **ProductSize**: Shoe sizes
- **Cart**: Shopping cart
- **Orders**: Order management
- **Voucher**: Discount codes
- **ProductLine**: Product lines
- **ProductMaterial**: Materials
- **ProductStyle**: Styles

## 📄 Controllers

### User Controllers:
- `/UserController` - Registration, login, profile
- `/ProductController` - Product management
- `/CartController` - Shopping cart
- `/OrderController` - Order placement
- `/FavController` - Wishlist

### Admin Controllers:
- `/AccountController` - User management
- `/VoucherController` - Voucher management
- `/ProductLineController` - Product line management

## Demo
Video: https://drive.google.com/file/d/1VyuoANawHL9Umzldald-kY8oiUh6MRoV/view?usp=sharing

## 📝 License

This project was developed for educational purposes in the PRJ301 course.

---

**Bloom on Foot – Let Every Step Blossom** 🌸👟
