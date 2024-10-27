<%@ page import="Entity.Users"%>
<%@ page import="Entity.MenuItems" %>
<%@ page import="Entity.Review" %>
<%@ page import="Dao.ReviewDAO" %>
<%@ page import="java.util.List" %>
<%
    Users user = (Users) session.getAttribute("user");
    
    ReviewDAO re = new ReviewDAO();
    List<Review> reviews = re.getReview();
    boolean checkReview = re.checkReview(user.getUsersId());
    boolean checkReviewExist = re.checkReviewExist(user.getUsersId());

// Tính trung bình rating
    double avgRating = 0;
    if (!reviews.isEmpty()) {
        int totalRating = 0;
        for (Review review : reviews) {
            totalRating += review.getRating();
        }
        avgRating = (double) totalRating / reviews.size();
    }
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

        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container position-relative d-flex align-items-center justify-content-between">

                <a href="#" class="logo d-flex align-items-center me-auto me-xl-0">
                    <img src="assets/img/icon1.png" alt=""> 
                    <h1 class="sitename">GT</h1>
                    <span>.</span>
                </a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="#hero">Trang Chủ<br></a></li>
                        <li><a href="Reservation.jsp">Đặt bàn</a></li>

                        <li><a href="menu">Menu</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>

                <div class="user-menu">
                    <a href="tabled.jsp" class="btn-getstarted"><%=user.getUserName()%></a>
                    <a class="btn-logout" href="index.html">Đăng xuất</a>
                </div>

            </div>
        </header>

        <main class="main">

            <!-- Page Title -->
            <!-- Hero Section -->
            <section id="hero" class="hero section light-background">

                <div class="container">
                    <div class="row gy-4 justify-content-center justify-content-lg-between">
                        <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                            <h1 data-aos="fade-up">Cùng thưởng thức món ăn truyền thống-Lành mạnh</h1>

                        </div>
                        <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
                            <img src="assets/img/events-2.jpg" class="img-fluid animated" alt="" >
                        </div>
                    </div>
                </div>
            </section><!-- /Hero Section -->

            <!-- End Page Title -->

            <!-- Starter Section Section -->
            <section id="starter-section" class="starter-section section">
                <!-- About Title -->
                <div class="container section-title" data-aos="fade-up">
                    <p><span>Nhà hàng</span> <span class="description-title">Giao Thoa</span></p>
                </div><!-- End About Title -->
            </section>
            <!-- /Starter Section Section -->

            <!-- Reviews Section -->
            <section id="reviews" class="section light-background">
                <div class="container">
                    <h2>Đánh giá</h2>

                    <!-- 1. Danh sách đánh giá và tính trung bình rating -->
                    <%
                        if (reviews.isEmpty()) {
                    %>
                    <p>Không có đánh giá nào.</p>
                    <%
                        } else {
                    %>
                    <h4>Trung bình đánh giá: <%= String.format("%.2f", avgRating) %></h4>
                    <ul class="list-group">
                        <%
                            for (Review review : reviews) {
                        %>
                        <li class="list-group-item">
                            <strong>Người dùng:</strong> <%= review.getUserId() %><br>
                            <strong>Đánh giá:</strong> <%= review.getRating() %><br>
                            <strong>Bình luận:</strong> <%= review.getComment() %><br>
                            <strong>Ngày đánh giá:</strong> <%= review.getReviewDate() %>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                    <%
                        }
                    %>

                    <!-- 2. Form review -->
                    <%
                        if (checkReview && !checkReviewExist) {
                    %>
                    <h3>Đánh giá của bạn</h3>
                    <form action="ReviewServlet" method="POST">
                        <div class="form-group">
                            <label for="rating">Đánh giá (1-5):</label>
                            <input type="number" id="rating" name="rating" min="1" max="5" required>
                        </div>
                        <div class="form-group">
                            <label for="comment">Bình luận:</label>
                            <textarea id="comment" name="comment" rows="4" cols="50" required></textarea>
                        </div>
                        <input type="hidden" name="userId" value="<%= user.getUsersId() %>">
                        <button type="submit" class="btn btn-primary">Gửi đánh giá</button>
                    </form>
                    <%
                        } else if (!checkReview) {
                    %>
                    <p>Chưa đủ điều kiện để đánh giá.</p>
                    <%
                        } else if (checkReviewExist) {
                    %>
                    <p>Bạn đã đánh giá rồi.</p>
                    <%
                        }
                    %>
                </div>
            </section>


        </main>

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
