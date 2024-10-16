<%-- 
    Document   : tabled
    Created on : Oct 12, 2024, 10:32:21 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.Users"%>
<%@ page import="java.util.List" %>
<%@ page import="Entity.MenuItems" %>
<%@ page import="Entity.Tables" %>
<%@ page import="Dao.TablesDAO" %>


<%@ page import="Dao.OrderDAO" %>
<%@ page import="Entity.Orders" %>
<%@ page import="Dao.MenuItemDao" %>
<%@ page import="Entity.MenuItemJoinOrder" %>

<%
    Users user = (Users) session.getAttribute("user");
    List<MenuItems> l = (List<MenuItems>) session.getAttribute("l");
    
       TablesDAO tablesDAO = new TablesDAO();
       List<Tables> a = tablesDAO.getListTables();
       
       Boolean tableType = (Boolean) session.getAttribute("tableTypes");
%>
<style>
    body{
        background-color: whitesmoke;
    }
</style>
<!DOCTYPE html>
<html>
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
    <body>
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
            <li><a href="Reservation.jsp">Đặt Bàn</a></li>
          
            <li><a href="Menu.jsp">Menu</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

              <div class="user-menu">
          <a href="tabled.jsp" class="btn-getstarted"><%=user.getUserName()%></a>
        <a class="btn-logout" href="index.html">Đăng xuất</a>
    </div>

    </div>
  </header>
        
        
        
<div class="row" style="margin: 0% auto; padding: 2%">

                <div class="col-6" style="text-align: center; width: 50%">
                    <%
                        if(tableType == null){
                    %>
                    <h1>Không có bàn nào được đặt</h1>
                    <%
                        }else if(tableType==true){
                    %>
                    <h1>Bàn Thường</h1>
                    <a href="assets/img/gallery/gallery-1.jpg" class="glightbox">
                        <img src="assets/img/gallery/gallery-1.jpg" class="img-fluid" alt="Bàn Thường" title="Bàn Thường">
                    </a>
                    <% }else{ %>
                    <h1>Bàn VIP</h1>
                    <a href="assets/img/gallery/gallery-3.jpg" class="glightbox">
                        <img src="assets/img/gallery/gallery-3.jpg" class="img-fluid" alt="Bàn VIP" title="Bàn VIP">
                    </a>
                    <%
                        }
                    %>
                    
                    <%
                        if(tableType == null){
                    %>
                    <table>
                            <tr>
                                <td> <h1>Người Đặt</h1> </td>
                                <td> <h1>: </h1> </td>
                            </tr>
                            <tr>
                                <td>Ngày Đặt</td>
                                <td> <h1>:  </h1> </td>
                            </tr>
                            <tr>
                                <td>Số Người</td>
                                <td> <h1>:  </h1> </td>
                            </tr>
                    </table>
                    <% }else{ %>
                    <table>
                            <tr>
                                <td> <h1>Người Đặt</h1> </td>
                                <td> <h1>: <%=user.getUserName()%> </h1> </td>
                            </tr>
                            <tr>
                                <td>Ngày Đặt</td>
                                <td> <h1>:  </h1> </td>
                            </tr>
                            <tr>
                                <td>Số Người</td>
                                <td> <h1>:  </h1> </td>
                            </tr>
                    </table>
                    <%
                        }
                    %>
                </div>
                <div class="col-6" style="text-align: center; width: 50%">
                    <h1>Danh sách món đã đặt</h1>
                    <table class="table" style="text-align: center">
                        <thead>
                            <tr>
                                <th>Tên món</th>
                                <th>Số lượng</th>
                                <th>Giá tiền (VND)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                OrderDAO o = new OrderDAO();                                     
                                List<MenuItemJoinOrder> orderedItems = o.getOrderListByUserId(user.getUsersId());
                                if (tableType != null && orderedItems != null && !orderedItems.isEmpty()) {
                                    for (MenuItemJoinOrder orderDetail : orderedItems) {
                            %>
                            <tr>
                                <td><%= orderDetail.getName() %></td>
                                <td><%= orderDetail.getQuantity() %></td>
                                <td><%= orderDetail.getPrice() %> VND</td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="3" class="text-center">Không có món nào được đặt</td>
                            </tr>
                            <%
                                }
                            %>    
                        </tbody>
                    </table>
                            <%
                                if (tableType == null) { 
                            %>
                                <a href="Reservation.jsp" class="btn-complete" style="padding: 10px 20px; color: white; background-color: crimson; border-radius: 5px">Đặt Bàn</a>
                            <%
                                }
                            %>
                </div>
            </div>
                        
                        
                        
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
