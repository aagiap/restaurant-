

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.Users"%>
<%@ page import="java.util.List" %>
<%@ page import="Entity.MenuItems" %>
<%
    Users user = (Users) session.getAttribute("user"); 
%>

<script>
    // Hàm fun() để chuyển hướng
    function fun() {
        window.location.href = "AdminMenu.jsp";
    }

    // Kiểm tra nếu vai trò là admin thì gọi hàm fun()
    <% if (user.getRole().equals("admin")) { %>
    fun(); // Gọi hàm fun() nếu user là admin
    <% } %>
</script>

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
                        <li><a href="Home.jsp">Trang Chủ<br></a></li>
                        <li><a href="Reservation.jsp">Đặt bàn</a></li>

                        <li><a href="#MenuHead">Menu</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>

                <div class="user-menu">
                    <a href="tabled.jsp" class="btn-getstarted"><%=user.getUserName()%></a>
                    <a class="btn-logout" href="index.html">Đăng xuất</a>
                </div>
            </div>
        </header>
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
                                <div class="card-body" id="MenuNameCate">
                                    <a href="" class="text-reset">
                                        <p><%= menuItem.getCategory() %></p>
                                    </a>
                                    <a href="" class="text-reset">
                                        <h2 class="card-title mb-2"><%= menuItem.getName() %></h2>
                                    </a>
                                    <h1 class="mb-3 price"><%= menuItem.getPrice() %> VND</h1>
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