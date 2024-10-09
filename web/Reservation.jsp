<%-- 
    Document   : Reservation
    Created on : 9 thg 10, 2024, 13:14:03
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.Users"%>
<%@ page import="java.util.List" %>
<%@ page import="Entity.MenuItems" %>
<%
    Users user = (Users) session.getAttribute("user");
    List<MenuItems> l = (List<MenuItems>) session.getAttribute("l");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>GT - Giao Thoa</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/img/favicon-GT.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="assets/css/main.css" rel="stylesheet">
    <link href="assets/css/Menu.css" rel="stylesheet">

    <style>
        .Form {
            font-family: Arial, sans-serif;
            background: url('assets/img/events-2.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
            width: 300px;
        }
        h2 {
            text-align: center;
        }
        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #e74c3c;
            border: none;
            border-radius: 5px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body class="starter-page-page">

    <header id="header" class="header d-flex align-items-center sticky-top">
        <div class="container position-relative d-flex align-items-center justify-content-between">
            <a href="index.html" class="logo d-flex align-items-center me-auto me-xl-0">
                <img src="assets/img/icon1.png" alt="">
                <h1 class="sitename">GT</h1>
                <span>.</span>
            </a>
            <nav id="navmenu" class="navmenu">
                <ul>
                    <li><a href="Home.jsp">Trang Chủ</a></li>
                    <li><a href="Reservation.jsp">Đặt bàn</a></li>          
                    <li><a href="/Project/menu">Menu</a></li>
                </ul>
                <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
            </nav>
            <div class="user-menu">
                <a class="btn-getstarted"><%= user.getUserName() %></a>
                <a class="btn-logout" href="index.html">Đăng xuất</a>
            </div>
        </div>
    </header>

    <section id="hero" class="hero section light-background">
        <div class="container">
            <div class="row gy-4 justify-content-center justify-content-lg-between">
                <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                    <img src="assets/img/gallery/gallery-1.jpg" class="img-fluid animated" alt="">
                </div>
                <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                    <img src="assets/img/gallery/gallery-3.jpg" class="img-fluid animated" alt="">
                </div>
            </div>
        </div>
    </section>

    <div class="Form">
        <div class="form-container">
            <h2>Đặt Bàn</h2>
            <form>
                <label for="table-type">Loại Bàn:</label>
                <select id="table-type" required>
                    <option value="vip">Bàn VIP</option>
                    <option value="normal">Bàn Bình Thường</option>
                </select>

                <label for="date">Ngày Đặt:</label>
                <input type="date" id="date" required>

                <label for="people">Số Người:</label>
                <input type="number" id="people" min="1" required>

                <label for="notes">Lưu Ý:</label>
                <textarea id="notes" rows="3" placeholder="Nhập lưu ý cho nhà hàng..."></textarea>

                <button type="submit">Đặt Bàn</button>
            </form>
        </div>
    </div>

</body>
</html>