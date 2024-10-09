<%-- 
    Document   : Menu
    Created on : 8 thg 10, 2024, 21:32:39
    Author     : ASUS
--%>

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
  <link href="assets/css/Menu.css" rel="stylesheet">


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
            <li><a href="index.html">Trang Chủ<br></a></li>
            <li><a href="index.html#about">About</a></li>
          
            <li><a href="#">Menu</a></li>

          
          <!--<li><a href="#events">Sự Kiện</a></li>-->
<!--          <li class="dropdown"><a href="#"><span>Sự Kiện</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
                <li><a href="DamHoi.html">Đám Hỏi</a></li>
                <li><a href="DamGio.html">Đám Giỗ</a></li>
                <li><a href="Khac.html">Khác</a></li>
            </ul>
          </li>-->
          <!--<li><a href="#chefs">Chefs</a></li>-->
          <!--<li><a href="#gallery">Gallery</a></li>-->
<!--          <li class="dropdown"><a href="#"><span>Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="#">Dropdown 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                <ul>
                  <li><a href="#">Deep Dropdown 1</a></li>
                  <li><a href="#">Deep Dropdown 2</a></li>
                  <li><a href="#">Deep Dropdown 3</a></li>
                  <li><a href="#">Deep Dropdown 4</a></li>
                  <li><a href="#">Deep Dropdown 5</a></li>
                </ul>
              </li>
              <li><a href="#">Dropdown 2</a></li>
              <li><a href="#">Dropdown 3</a></li>
              <li><a href="#">Dropdown 4</a></li>
            </ul>
          </li>
          <li><a href="#contact">Contact</a></li>-->
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>
        
<div class="user-menu">
        <a class="btn-getstarted"><%=user.getUserName()%></a>
        <a class="btn-logout" href="index.html">Đăng xuất</a>
    </div>
    </div>
  </header>

        <main id="MainMenu">
        <body>
            <section>
            <div class="text-center" >
            <div class="row" >
              <%
                List<MenuItems> l = (List<MenuItems>) request.getAttribute("l");
                if (l != null) {
                    for (MenuItems menuItem : l) {
              %>
              <div class="col-lg-3 col-md-6 mb-4">
                <div class="card">
                  <div class="bg-image hover-zoom ripple ripple-surface ripple-surface-light "
                    data-mdb-ripple-color="light">
                      <img id="imgMenu" src="<%= menuItem.getImage() %>" class="w-100" />
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
                  <div class="card-body">
                    <a href="" class="text-reset">
                      <h5 class="card-title mb-2"><%= menuItem.getName() %></h5>
                    </a>
                    <a href="" class="text-reset">
                      <p><%= menuItem.getCategory() %></p>
                    </a>
                    <h6 class="mb-3 price"><%= menuItem.getPrice() %>$</h6>
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
        </body>
    </main>
 <!--Main layout-->

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

    <div class="container copyright text-center mt-4">
      <p>© <span>Copyright</span> <strong class="px-1 sitename">Yummy</strong> <span>All Rights Reserved</span></p>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you've purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer>

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