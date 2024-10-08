<%-- 
    Document   : Home
    Created on : Oct 7, 2024, 1:15:28 PM
    Author     : admin
--%>

  <%@ page import="Entity.Users"%>
<%
    Users user = (Users) session.getAttribute("user");
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

      <a href="index.html" class="logo d-flex align-items-center me-auto me-xl-0">
        <img src="assets/img/icon1.png" alt=""> 
        <h1 class="sitename">GT</h1>
        <span>.</span>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="#hero">Trang Chủ<br></a></li>
          <li><a href="#about">Đặt bàn</a></li>
          
          <li><a href="/Project/menu">Menu</a></li>

          
          <!--<li><a href="#events">Sự Kiện</a></li>-->
          <li class="dropdown"><a href="#"><span>Sự Kiện</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
                <li><a href="DamHoi.html">Đám Hỏi</a></li>
                <li><a href="DamGio.html">Đám Giỗ</a></li>
                <li><a href="Khac.html">Khác</a></li>
            </ul>
          </li>
          <!--<li><a href="#chefs">Chefs</a></li>-->
          <!--<li><a href="#gallery">Gallery</a></li>-->
          <li class="dropdown"><a href="#"><span>Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="#VietNamMenu">Dropdown 1</a></li>
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
          <li><a href="#contact">Contact</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

      <div class="user-menu">
        <a class="btn-getstarted"><%=user.getUserName()%></a>
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
            <h1 data-aos="fade-up">Cùng thưởng thức món ăn truyền thống-Lành mạnh của Việt Nam</h1>
            <!--<p data-aos="fade-up" data-aos-delay="100">We are team of talented designers making websites with Bootstrap</p>-->
            <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
              <!--<a href="#book-a-table" class="btn-get-started">Booka a Table</a>-->
              <!--<a href="https://www.youtube.com/watch?v=Y7f98aduVJ8" class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>-->
            </div>
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

<!--Review Món Viẹt-->
      <div class="container section-title" data-aos="fade-up">
        <p><span>Món </span> <span class="description-title">Việt Nam</span> </p>
      </div>
      
      <div class="TopImg">
          <img src="assets/img/VietNamFoods/goi-cuon-274170.jpg" alt="Spring Rolls(Gỏi Quấn)" title="Spring Rolls(Gỏi Quấn)"/>
          <img src="assets/img/VietNamFoods/banh-xeo-274177.jpg" alt="Bánh Xèo" title="Bánh Xèo"/>
          <img src="assets/img/VietNamFoods/banh-khot-507261.jpg" alt="Bánh Khọt" title="Bánh Khọt"/>
          <img src="assets/img/VietNamFoods/hu-tieu-my-tho-507255.jpg" alt="Hủ Tiếu Mỹ Tho" title="Hủ Tiếu Mỹ Tho"/>
      </div>
       
<!--Review Món Tây-->
      <div class="container section-title" data-aos="fade-up">
        <p><span>Món </span> <span class="description-title">Tây</span></p>
      </div>
      
      <div class="TopImg">
          <img src="assets/img/NormalFoods/ChickWing1.jpg" alt="ChickWing" title="ChickWing"/>
          <img src="assets/img/NormalFoods/French fries2.jpg" alt="FrenchFries" title="FrenchFries"/>
          <img src="assets/img/NormalFoods/burrito.jpg" alt="Burrito" title="Burrito"/>
          <img src="assets/img/NormalFoods/hamburger1.jpg" alt="hamburger" title="hamburger"/>
      </div>
      
      
      
      
<!-- About Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>About</h2>
        <p><span>Section Title</span> <span class="description-title">Direda Flowed</span></p>
      </div><!-- End About Title -->
      
      
<!--VietNam Menu Section -->
      <div id="VietNamMenu"></div>
      <section id="menu" class="menu section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Menu</h2>
        <p><span>Các món</span> <span class="description-title">Việt Nam</span> </p>
      </div><!-- End Section Title -->

      <div class="container">

        <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="100">

          <li class="nav-item">
            <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#menu-starters">
              <h4>Ăn Sáng</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-breakfast">
              <h4>Món Nước</h4>
            </a><!-- End tab nav item -->

          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-lunch">
              <h4>Món Khô</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-dinner">
              <h4>Khác</h4>
            </a>
          </li><!-- End tab nav item -->

        </ul>

        <div class="tab-content" data-aos="fade-up" data-aos-delay="200">

          <div class="tab-pane fade active show" id="menu-starters">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Ăn Sáng</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/pho-274156.jpg" class="glightbox"><img src="assets/img/VietNamFoods/pho-274156.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Phở Bò( Beef Pho )</h4>
                
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/BanhMy2.jpg" class="glightbox"><img src="assets/img/VietNamFoods/BanhMy2.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bánh Mỳ</h4>

                <p class="price">
                 30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/ComRang.jpg" class="glightbox"><img src="assets/img/VietNamFoods/ComRangDuaBo.jpg" class="menu-img img-fluid" alt=""></a>
                  <h4>Cơm Rang Dưa Bò <br>( Fried Rice with Beef and Cucumber )</h4>
                 
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/BanhCuon.jpg" class="glightbox"><img src="assets/img/VietNamFoods/BanhCuon.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bánh Cuốn ( Rice Rolls )</h4>
          
                <p class="price">
                 30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/Xoi.jpg" class="glightbox"><img src="assets/img/VietNamFoods/Xoi.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Xôi ( Sticky rice )</h4>

                <p class="price">
                 30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/bun-cha-ca-quy-nhon-507277.jpg" class="glightbox"><img src="assets/img/VietNamFoods/bun-cha-ca-quy-nhon-507277.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bún Chả Cá</h4>
                 
                <p class="price">
                 30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Ăn Sáng Menu Content -->

          <div class="tab-pane fade" id="menu-breakfast">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Món Nước</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/banh-canh-trang-bang-507264.jpg" class="glightbox"><img src="assets/img/VietNamFoods/banh-canh-trang-bang-507264.jpg" class="menu-img img-fluid" alt=""></a>
                  <h4>Bánh canh Trảng Bàng <br>( Trang Bang noodle soup ) </h4>
 
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/bun-cha-ca-quy-nhon-507276.jpg" class="glightbox"><img src="assets/img/VietNamFoods/bun-cha-ca-quy-nhon-507276.jpg " class="menu-img img-fluid" alt=""></a>
                <h4>Bún Chả Cá ( Fish Noodle Soup )</h4>
  
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/cao-lau-274167.jpg" class="glightbox"><img src="assets/img/VietNamFoods/cao-lau-274167.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Cao Lầu</h4>
                
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/mi-quang-507284.jpg" class="glightbox"><img src="assets/img/VietNamFoods/mi-quang-507284.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Mỳ Quảng</h4>
                
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/sup-luon-507297.jpg" class="glightbox"><img src="assets/img/VietNamFoods/sup-luon-507297.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Suop Lươn ( eel soup )</h4>
          
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/hu-tieu-my-tho-507255.jpg" class="glightbox"><img src="assets/img/VietNamFoods/hu-tieu-my-tho-507255.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Hũ Tiếu </h4>
              
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Món Nước Menu Content -->

          <div class="tab-pane fade" id="menu-lunch">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Món Khô</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/banh-beo-507292.jpg" class="glightbox"><img src="assets/img/VietNamFoods/banh-beo-507292.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bánh Bèo</h4>
               
                <p class="price">
                 30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/banh-chungbanh-tet-274171.jpg" class="glightbox"><img src="assets/img/VietNamFoods/banh-chungbanh-tet-274171.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bánh Chưng</h4>
 
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/BanhMy2.jpg" class="glightbox"><img src="assets/img/VietNamFoods/BanhMy2.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Est Bánh Mỳ</h4>
               
                <p class="price">
                  30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/com-tam-507258.jpg" class="glightbox"><img src="assets/img/VietNamFoods/com-tam-507258.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Cơm Tấm</h4>
                 
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/ComRang.jpg" class="glightbox"><img src="assets/img/VietNamFoods/ComRang.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Com Rang</h4>
               
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/ComRangDuaBo.jpg" class="glightbox"><img src="assets/img/VietNamFoods/ComRangDuaBo.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Cơm Rang Dưa Bò</h4>
                
                <p class="price">
                  50.000 vnd ( $2.02 )
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Lunch Menu Content -->

          <div class="tab-pane fade" id="menu-dinner">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Món Khác</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/banh-beo-507292.jpg" class="glightbox"><img src="assets/img/VietNamFoods/banh-beo-507292.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bánh Bèo</h4>
                
                <p class="price">
                  30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/banh-xeo-274177.jpg" class="glightbox"><img src="assets/img/VietNamFoods/banh-xeo-274177.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bánh Xèo</h4>
               
                <p class="price">
                  30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/banh-khot-507261.jpg" class="glightbox"><img src="assets/img/VietNamFoods/banh-khot-507261.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Bánh Khọt</h4>
             
                <p class="price">
                  30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/com-chay-507298.jpg" class="glightbox"><img src="assets/img/VietNamFoods/com-chay-507298.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Cơm Cháy</h4>
                 
                <p class="price">
                  30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/VietNamChinkenWig.jpg" class="glightbox"><img src="assets/img/VietNamFoods/VietNamChinkenWig.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Cánh Gà</h4>
                 
                <p class="price">
                  30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/cha-muc-ha-long-507314.jpg" class="glightbox"><img src="assets/img/VietNamFoods/cha-muc-ha-long-507314.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Chả Mực</h4>
               
                <p class="price">
                  30.000 vnd ( $1.21 )
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Dinner Menu Content -->

        </div>

      </div>

    </section><!-- /VietNam Menu Section -->
    
<!--Tây Menu Section -->
      <div id="TayMenu"></div>        
    <section id="menu" class="menu section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Menu</h2>
        <p><span>Các Món</span> <span class="description-title">Tây</span></p>
      </div><!-- End Section Title -->

      <div class="container">

        <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="100">

          <li class="nav-item">
            <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#Menu-starters">
              <h4>Khai vị</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#Menu-breakfast">
              <h4>Bữa Sáng</h4>
            </a><!-- End tab nav item -->

          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#Menu-lunch">
              <h4>Bữa Trưa</h4>
            </a>
          </li><!-- End tab nav item -->

          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#Menu-dinner">
              <h4>Bữa Tối</h4>
            </a>
          </li><!-- End tab nav item -->

        </ul>

        <div class="tab-content" data-aos="fade-up" data-aos-delay="200">

          <div class="tab-pane fade active show" id="Menu-starters">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Khai Vị</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-1.png" class="glightbox"><img src="assets/img/menu/menu-item-1.png" class="menu-img img-fluid" alt=""></a>
                <h4>Magnam Tiste</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $5.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-2.png" class="glightbox"><img src="assets/img/menu/menu-item-2.png" class="menu-img img-fluid" alt=""></a>
                <h4>Aut Luia</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $14.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-3.png" class="glightbox"><img src="assets/img/menu/menu-item-3.png" class="menu-img img-fluid" alt=""></a>
                <h4>Est Eligendi</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $8.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-4.png" class="glightbox"><img src="assets/img/menu/menu-item-4.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-5.png" class="glightbox"><img src="assets/img/menu/menu-item-5.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-6.png" class="glightbox"><img src="assets/img/menu/menu-item-6.png" class="menu-img img-fluid" alt=""></a>
                <h4>Laboriosam Direva</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $9.95
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Starter Menu Content -->

          <div class="tab-pane fade" id="Menu-breakfast">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Bữa Sáng</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                  <a href="assets/img/VietNamFoods/BanhCuon.jpg" class="glightbox"><img src="assets/img/VietNamFoods/BanhCuon.jpg" class="menu-img img-fluid" alt=""></a>
                <h4>Magnam Tiste</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $5.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-2.png" class="glightbox"><img src="assets/img/menu/menu-item-2.png" class="menu-img img-fluid" alt=""></a>
                <h4>Aut Luia</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $14.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-3.png" class="glightbox"><img src="assets/img/menu/menu-item-3.png" class="menu-img img-fluid" alt=""></a>
                <h4>Est Eligendi</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $8.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-4.png" class="glightbox"><img src="assets/img/menu/menu-item-4.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-5.png" class="glightbox"><img src="assets/img/menu/menu-item-5.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-6.png" class="glightbox"><img src="assets/img/menu/menu-item-6.png" class="menu-img img-fluid" alt=""></a>
                <h4>Laboriosam Direva</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $9.95
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Breakfast Menu Content -->

          <div class="tab-pane fade" id="Menu-lunch">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Bữa Trưa</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-1.png" class="glightbox"><img src="assets/img/menu/menu-item-1.png" class="menu-img img-fluid" alt=""></a>
                <h4>Magnam Tiste</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $5.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-2.png" class="glightbox"><img src="assets/img/menu/menu-item-2.png" class="menu-img img-fluid" alt=""></a>
                <h4>Aut Luia</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $14.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-3.png" class="glightbox"><img src="assets/img/menu/menu-item-3.png" class="menu-img img-fluid" alt=""></a>
                <h4>Est Eligendi</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $8.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-4.png" class="glightbox"><img src="assets/img/menu/menu-item-4.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-5.png" class="glightbox"><img src="assets/img/menu/menu-item-5.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-6.png" class="glightbox"><img src="assets/img/menu/menu-item-6.png" class="menu-img img-fluid" alt=""></a>
                <h4>Laboriosam Direva</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $9.95
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Lunch Menu Content -->

          <div class="tab-pane fade" id="Menu-dinner">

            <div class="tab-header text-center">
              <p>Menu</p>
              <h3>Bữa Tối</h3>
            </div>

            <div class="row gy-5">

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-1.png" class="glightbox"><img src="assets/img/menu/menu-item-1.png" class="menu-img img-fluid" alt=""></a>
                <h4>Magnam Tiste</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $5.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-2.png" class="glightbox"><img src="assets/img/menu/menu-item-2.png" class="menu-img img-fluid" alt=""></a>
                <h4>Aut Luia</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $14.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-3.png" class="glightbox"><img src="assets/img/menu/menu-item-3.png" class="menu-img img-fluid" alt=""></a>
                <h4>Est Eligendi</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $8.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-4.png" class="glightbox"><img src="assets/img/menu/menu-item-4.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-5.png" class="glightbox"><img src="assets/img/menu/menu-item-5.png" class="menu-img img-fluid" alt=""></a>
                <h4>Eos Luibusdam</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $12.95
                </p>
              </div><!-- Menu Item -->

              <div class="col-lg-4 menu-item">
                <a href="assets/img/menu/menu-item-6.png" class="glightbox"><img src="assets/img/menu/menu-item-6.png" class="menu-img img-fluid" alt=""></a>
                <h4>Laboriosam Direva</h4>
                <p class="ingredients">
                  Lorem, deren, trataro, filede, nerada
                </p>
                <p class="price">
                  $9.95
                </p>
              </div><!-- Menu Item -->

            </div>
          </div><!-- End Dinner Menu Content -->

        </div>

      </div>

    </section><!-- / Tây Menu Section -->



    </section><!-- /Starter Section Section -->

  </main>

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
