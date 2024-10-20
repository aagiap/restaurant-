
<%@ page import="Entity.Users"%>
<%@ page import="Entity.MenuItems" %>
<%@ page import="java.util.List" %>
<%@ page import="Entity.DiscountItem" %>
<%@ page import="Dao.DiscountItemDAO" %>
<%
    Users user = (Users) session.getAttribute("user");
    
    DiscountItemDAO dD = new DiscountItemDAO();
    
    String msg = (String) request.getAttribute("msg");
    if (msg == null) {
    msg="";
    }
    
List<DiscountItem> lD = dD.getDiscountItems();//danh sách mã giảm
boolean checkDiscountCondition = dD.checkDiscountCondition();//kiểm tra có mã nào apply chưa


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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


    </head>

    <body class="starter-page-page">
        <!--HeaderTag-->
        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container position-relative d-flex align-items-center justify-content-between">

                <a href="index.html" class="logo d-flex align-items-center me-auto me-xl-0">
                    <img src="assets/img/icon1.png" alt=""> 
                    <h1 class="sitename">GT</h1>
                    <span>.</span>
                </a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="#hero">Trang Chủ<br></a></li>
                        <li><a href="AdminReservation.jsp">Thông tin đặt bàn </a></li>          
                        <li><a href="menu">Menu</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>

                <div class="user-menu">
                    <a href="#" class="btn-getstarted"><%=user.getUserName()%></a>
                    <a class="btn-logout" href="index.html">Đăng xuất</a>
                </div>

            </div>
        </header>
        <!--EndHeaederTag-->



        <!--MainTag-->
        <main class="main">
            <!-- Page Title -->
            <!-- Hero Section -->
            <section id="hero" class="hero section light-background">
                <div class="container">
                    <div class="row gy-4 justify-content-center justify-content-lg-between">
                        <!--Slogan-->
                        <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                            <h1 data-aos="fade-up">Cùng thưởng thức món ăn truyền thống-Lành mạnh</h1>
                        </div>
                        <!--EndSlogun-->

                        <!--ImgMainHead-->
                        <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
                            <img src="assets/img/events-2.jpg" class="img-fluid animated" alt="" >
                        </div>
                        <!--EndImgMainHead-->
                    </div>
                </div>
            </section>
            <!-- /Hero Section -->
            <!-- End Page Title -->

            <!-- Starter Section Section -->
            <section id="starter-section" class="starter-section section">
                <!-- About Title -->
                <div class="container section-title" data-aos="fade-up">
                    <h2>About</h2>
                    <p><span>Section Title</span> <span class="description-title">Direda Flowed</span></p>
                </div>
                <!-- End About Title -->
            </section>
            <!-- /Starter Section Section -->
        </main>
        <!--EndMainTag-->

        <!--Discount-->

        <div class="row" style="padding: 2%; margin: 2%; background-color: rgba(0, 0, 0, 0.7); border-radius: 20px">
            <div class="col-6">
                <form action="CreateDiscount" method="POST">
                    <table>           
                        <tr>
                            <td>
                                <label for="value"><h2 style="color: white">giá trị</h2></label>
                            </td>
                            <td>
                                <input type="text" name="discountPercent" value="" style="width: 100%;" required oninput="updateVoucher()">
                            </td>
                        </tr>       
                    </table>
                    <button type="submit" style="width: auto">Tạo</button>
                </form>
            </div>

            <div class="col-6">
                <div style="position: relative;  width: 100%; height: auto;">
                    <div>
                        <img src="assets/img/voucher.png" alt="alt" style="width: 100%; height: auto;"/>
                    </div>
                    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; color: white;">
                        <p>Giao Thoa</p>
                        <h2>VOUCHER</h2>
                        <h1 id="displayCode" style="color: red">%</h1>
                        <p id="displayDescription">Mô tả</p>
                        <h5 id="displayDate">Thời Gian</h5>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function updateVoucher() {
                // Lấy giá trị từ input
                var code = document.getElementById('value').value;
                var description = document.getElementById('Description').value;
                var date = document.getElementById('Date').value;
                var date1 = document.getElementById('Date1').value;

                // Cập nhật các giá trị tương ứng trên voucher
                document.getElementById('displayCode').textContent = code ? code : '%';
                document.getElementById('displayDescription').textContent = description ? description : 'Mô tả';
                document.getElementById('displayDate').textContent = (date && date1) ? date + ' - ' + date1 : 'Thời Gian';
            }
        </script>


        <!--EndDiscount-->

        <section id="starter-section" class="starter-section section">
            <!-- About Title -->
            <div class="container section-title" data-aos="fade-up">
                <p><span>Danh Sách</span> <span class="description-title"> vourche</span></p>
            </div>
            <!-- End About Title -->
        </section>

        <!--        <div class="col-6" style="padding: 10%">
        
                    <div style="position: relative;  width: 100%; height: auto;">
                        <div>
                            <img src="assets/img/voucher.png" alt="alt" style="width: 100%; height: auto;"/>
                        </div>
                        <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; color: white;">
                            <p>Giao Thoa</p>
                            <h2>VOUCHER</h2>
                            <h1 style="color: red">%</h1>
                            <p>text</p>
                            <h5>Hiệu Lực</h5>
                        </div>
                    </div>
                </div>-->

        <div class="col-6 col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
            <h3 style="text-align: center">Danh Sách Bàn Ăn</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="col-6" scope="col">Khuyến mãi</th>
                        <th class="col-6" scope="col">Giá trị(%)</th>
                        <th class="col-6" scope="col">Trạng thái</th>
                        <th class="col-6" scope="col"></th>
                        <th class="col-6" scope="col"></th>
                        <th class="col-6" scope="col"><%=msg%></th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (DiscountItem d : lD) { 
                    %>
                    <tr>
                        <td><%= d.getDiscountId() %></td>
                        <td><%= d.getDiscountPercent()  %></td>
                        <td><%= d.getCondition()  %></td>
                        <td>
                            <form action="RemoveDiscount" method="POST">    
                                <input type="hidden" name="discountId" value="<%= d.getDiscountId() %>" />
                                <input type="hidden" name="discountPercent" value="<%= d.getDiscountPercent() %>" />
                                <input type="hidden" name="condition" value="<%= d.getCondition() %>" />
                                <input type="submit" class="btn btn-success" value="Đặt lại" style="border: #6610f2 solid; background: white; font-size: 10px; cursor: pointer; color: #6610f2;">
                            </form>
                        </td>
                        <td>
                            <form action="ApplyDiscount" method="POST">    
                                <input type="hidden" name="discountId" value="<%= d.getDiscountId() %>" />
                                <input type="hidden" name="discountPercent" value="<%= d.getDiscountPercent() %>" />
                                <input type="hidden" name="condition" value="<%= d.getCondition() %>" />
                                <input type="submit" class="btn btn-success" value="Áp dụng" style="border: #6610f2 solid; background: white; font-size: 10px; cursor: pointer; color: #6610f2;">
                            </form>
                        </td>
                    </tr>
                    <% 
                        } 
                    %>
                </tbody>
            </table>
        </div>

        <!--FooterTag-->
        <footer id="footer" class="footer dark-background">
            <div class="container">
                <div class="row gy-3">
                    <div class="col-lg-3 col-md-6 d-flex">
                        <i class="bi bi-geo-alt icon"></i>
                        <div class="address">
                            <h4>Address</h4>
                            <p>A108 Adam Street</p>
                            <p>New York, NY 535022</p>
                            <p></p>
                        </div>
                    </div>



                    <div class="col-lg-3 col-md-6 d-flex">
                        <i class="bi bi-telephone icon"></i>
                        <div>
                            <h4>Contact</h4>
                            <p>
                                <strong>Phone:</strong> <span>+1 5589 55488 55</span><br>
                                <strong>Email:</strong> <span>info@example.com</span><br>
                            </p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 d-flex">
                        <i class="bi bi-clock icon"></i>
                        <div>
                            <h4>Opening Hours</h4>
                            <p>
                                <strong>Mon-Sat:</strong> <span>11AM - 23PM</span><br>
                                <strong>Sunday</strong>: <span>Closed</span>
                            </p>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6">
                        <h4>Follow Us</h4>
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
