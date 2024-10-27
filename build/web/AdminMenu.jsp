<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.Users"%>
<%@ page import="java.util.List" %>
<%@ page import="Entity.MenuItems" %>
<%
    Users user = (Users) session.getAttribute("user"); 
%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">

        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>GT - Giao Thoa</title>
        <meta name="description" content="">
        <meta name="keywords" content="">

        <!-- Favicons -->
        <link href="assets/img/favicon-GT.png" rel="icon">
        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Amatic+SC:wght@400;700&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="assets/css/main.css" rel="stylesheet">
        <style>
            body{
                background-color: whitesmoke;
            }
            #imgMenu{
                height: 200px;
            }
            #MainMenuenu > a > p{
                text-decoration: underline;
            }
            #MenuNameCate> a > h2{
                font-weight: bold;
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
        </style>

    </head>

    <body class="starter-page-page">

        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container position-relative d-flex align-items-center justify-content-between">

                <a href="#" class="logo d-flex align-items-center me-auto me-xl-0">
                    <img src="assets/img/icon1.png" alt=""> 
                    <h1 class="sitename">GT</h1>
                    <span>.</span>
                </a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="AdminHome.jsp">Trang Chủ<br></a></li>
                        <li><a href="AdminReservation.jsp">Thông tin đặt bàn</a></li>

                        <li><a href="#MenuHead">Menu</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>

                <div class="user-menu">
                    <a href="#" class="btn-getstarted"><%=user.getUserName()%></a>
                    <a class="btn-logout" href="index.html">Đăng xuất</a>
                </div>
            </div>
        </header>

        <div class="row" style="padding: 2%; margin: 2%; background-color: rgba(0, 0, 0, 0.7); border-radius: 20px;">
            <div class="col-6" style="text-align: center; width: 50%">

                <!--themmon-->

                <form action="AddItems" method="POST" style="display: flex; flex-direction: column; align-items: flex-start; gap: 10px">
                    <table style="text-align: left">
                        <tr class="form-group">
                            <td>
                                <label for="category"><h2 style="color: white">Chọn Phân Loại</h2></label>
                            </td>
                            <td>
                                <select id="category" name="categoryFilter" class="form-select" style="width: 200px;">
                                    <option value=""></option>
                                    <option value="Món chính">Món chính</option>
                                    <option value="Hoa quả">Hoa quả</option>
                                    <option value="Đồ uống">Đồ uống</option>
                                    <option value="Đồ ngọt">Đồ ngọt</option>
                                    <option value="Ăn nhanh">Đồ ăn nhanh</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td>
                                <label for="name"><h2 style="color: white">Nhập Tên</h2></label>
                            </td>
                            <td>
                                <input type="text" id="name" name="name" style="width: 200px;" required>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td>
                                <label for="price"><h2 style="color: white">Nhập Giá</h2></label>
                            </td>
                            <td>
                                <input type="number" id="price" name="price" style="width: 200px;" min="1000"required>
                            </td>
                        </tr>
                        <tr class="form-group">
                            <td>
                                <label for="image"><h2 style="color: white">Nhập URL Ảnh</h2></label>
                            </td>
                            <td>
                                <input type="text" id="image" name="image" style="width: 200px;" oninput="updateImagePreview()" required>
                            </td>
                        </tr>
                    </table>
                    <button type="submit" style="width: auto">Thêm Món</button>
                </form>


                <!--EndThemMon-->
            </div>

            <div class="col-6" style="text-align: center; width: 50%; align-items: center; justify-content: center;">
                <a href="" class="glightbox">
                    <img id="imagePreview" src="" class="img-fluid" alt="">
                </a>
            </div>
        </div>

        <script>
            // Hàm cập nhật URL ảnh khi người dùng nhập
            function updateImagePreview() {
                const imageUrl = document.getElementById("image").value;
                const imagePreview = document.getElementById("imagePreview");

                if (imageUrl) {
                    imagePreview.src = imageUrl;  // Cập nhật đường dẫn ảnh
                } else {
                    imagePreview.src = "";  // Xóa ảnh nếu không có URL
                }
            }
        </script>



        <!--MenuTab-->
        <div id="MenuHead" class="container section-title" data-aos="fade-up" style="scroll-margin-top: 25vh; padding-bottom: unset">  
            <p><span class="description-title">Menu</span></p>
        </div>
        <select id="categoryFilter" class="form-select" onchange="filterByCategory()" style="text-align: center;width: 10%; margin: 0% auto">
            <option value="all">Tất cả</option>
            <option value="Món chính">Món chính</option>
            <option value="Hoa quả">Hoa quả</option>
            <option value="Đồ uống">Đồ uống</option>
            <option value="Đồ ngọt">Đồ ngọt</option>
            <option value="Ăn nhanh">Đồ ăn nhanh</option>
        </select>
        <!--/MenuTab-->
        <!--MainMenu-->
        <main id="MainMenu" style="background: transparent">
            <section style="background: transparent; padding: 2%">
                <div class="text-center" style="background: transparent">

                    <div class="row">
                        <%
                          List<MenuItems> l = (List<MenuItems>) session.getAttribute("l");
                          if (l != null) {
                              for (MenuItems menuItem : l) {
                        %>
                        <!-- Thêm data-category để lưu danh mục món ăn -->
                        <div class="col-lg-3 col-md-6 mb-4 menu-item" data-category="<%= menuItem.getCategory() %>">
                            <div class="card">
                                <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light" data-mdb-ripple-color="light">
                                    <a href="<%= menuItem.getImage() %>" class="glightbox"><img src="<%= menuItem.getImage() %>" class="menu-img img-fluid" alt=""></a>
                                    <a href="#!">
                                        <div class="mask">
                                            <div class="d-flex justify-content-start align-items-end h-100">
                                                <h5><span class="badge bg-dark ms-2">NEW</span></h5>
                                            </div>
                                        </div>
                                        <div class="hover-overlay">
                                            <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                        </div>
                                    </a>
                                </div>


                                <div style="padding: 3.5%">
                                    <!--Update-->
                                    <form action="UpdateItem" method="POST" id="MenuNameCate" style="text-align: -webkit-center">

                                        <select id="categoryFilter" name="category" class="form-select" style="; width: 100%;text-align: center">
                                            <option value="<%= menuItem.getCategory() %>"><%= menuItem.getCategory() %></option>
                                            <option value="Món chính">Món chính</option>
                                            <option value="Hoa quả">Hoa quả</option>
                                            <option value="Đồ uống">Đồ uống</option>
                                            <option value="Đồ ngọt">Đồ ngọt</option>
                                            <option value="Ăn nhanh">Đồ ăn nhanh</option>
                                        </select>
                                        <h2><input style="text-align: center; width: 100%" type="text" placeholder="<%= menuItem.getName() %>" name="name" value="<%= menuItem.getName() %>"/></h2>
                                        <input type="hidden" name="itemId" value="<%= menuItem.getItemId() %>" />

                                        <h1><input style="text-align: center; width: 100%" type="number" min="1000" placeholder="<%= menuItem.getPrice() %>" name="price" value="<%= menuItem.getPrice() %>"/></h1>
                                        <input  type="submit" class="btn btn-success" value="Lưu Thông Tin" style="border: #6610f2 solid; background: white; font-size: 10px; cursor: pointer; color: #6610f2; width: 100%">

                                    </form>
                                    <!--EndUpdate-->

                                    <!--DeleteMenuItem-->
                                    <form action="DeleteItem" method="POST">
                                        <input type="hidden" name="itemId" value="<%= menuItem.getItemId() %>" />
                                        <input  type="submit" class="btn btn-success" value="&#10006;" style="border: #6610f2 solid; background: white; font-size: 10px; cursor: pointer; color: #6610f2; width: 100%">
                                    </form>
                                    <!--DeleteMenuItem-->


                                </div>
                            </div>
                        </div>
                        <%
                              }
                          }
                        %>
                    </div>
                </div>
            </section>
        </main>
        <script>
            function filterByCategory() {
                var selectedCategory = document.getElementById("categoryFilter").value;
                var menuItems = document.getElementsByClassName("menu-item");

                for (var i = 0; i < menuItems.length; i++) {
                    var category = menuItems[i].getAttribute("data-category");

                    if (selectedCategory === "all" || category === selectedCategory) {
                        menuItems[i].style.display = "block";
                    } else {
                        menuItems[i].style.display = "none";
                    }
                }
            }
        </script>
        <!--/MainMenu -->

        <!--FooterTag-->
        <footer id="footer" class="footer dark-background">
            <div class="container">
                <div class="row gy-3">
                    <div class="col-lg-3 col-md-6 d-flex">
                        <i class="bi bi-geo-alt icon"></i>
                        <div class="address">
                            <h4>Địa chỉ</h4>
                            <p>12 thị trấn Hữu Lũng</p>
                            <p>Lạng Sơn</p>
                            <p></p>
                        </div>
                    </div>



                    <div class="col-lg-3 col-md-6 d-flex">
                        <i class="bi bi-telephone icon"></i>
                        <div>
                            <h4>Liên hệ</h4>
                            <p>
                                <strong>SĐT:</strong> <span>+84344276687</span><br>
                                <strong>Email:</strong> <span>giaothoa@example.com</span><br>
                            </p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 d-flex">
                        <i class="bi bi-clock icon"></i>
                        <div>
                            <h4>Giờ mở cửa</h4>
                            <p>
                                <strong>Thứ hai-Thứ bảy: </strong> <span>11AM - 23PM</span><br>
                                <strong>Chủ nhật</strong>: <span>Đóng cửa</span>
                            </p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <h4>Theo dõi</h4>
                        <div class="social-links d-flex">
                            <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
                            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>

                </div>
            </div>
        </footer>
        <!--EndFooterTag-->

        <!-- Scroll Top -->
        <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Preloader -->
        <div id="preloader"></div>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

        <!-- Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>