<%-- 
    Document   : Reservation
    Created on : 9 thg 10, 2024, 13:14:03
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.Users"%>
<%@ page import="java.util.List" %>
<%@ page import="Entity.MenuItems" %>
<%@ page import="Entity.Tables" %>
<%@ page import="Dao.TablesDAO" %>

<%
    Users user = (Users) session.getAttribute("user");
    List<MenuItems> l = (List<MenuItems>) session.getAttribute("l");
    
       TablesDAO tablesDAO = new TablesDAO();
       List<Tables> a = tablesDAO.getListTables();
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
/*                background: url('assets/img/events-2.jpg') no-repeat center center fixed;*/
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
                        <h3>Danh Sách Bàn Ăn</h3>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Bàn Số</th>
                                    <th scope="col">Loại</th>
                                    <th scope="col">Tình Trạng</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    for (Tables table : a) { 
                                %>
                                <tr>
                                    <td><%= table.getTableNumber() %></td>
                                    <td><%= table.getLocation() %></td>
                                    <td><%= table.getCondition().equals("blank") ? "Trống" : "Đầy" %></td>
                                </tr>
                                <% 
                                    } 
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                        <img src="assets/img/gallery/gallery-3.jpg" class="img-fluid animated" alt="">
                    </div>
                </div>
            </div>
        </section>

        <!-- Form to input user reservation details -->
        <div class="Form">
            <div class="form-container">
                <h2>Đặt Bàn</h2>

                <!-- Displaying Tomorrow's Date -->
                <div id="reservation-date-display">
                    <strong>Ngày Đặt:</strong> 
                    <span id="reservation-date"></span>
                </div>


                <form action="/Project/reservate" method="POST">
                    <input type="hidden" name="userId" value="<%=user.getUsersId()%>" />

                    <!-- Table Type Selection -->
                    <label for="table-type">Loại Bàn:</label>
                    <select id="table-type" name="table-type" required onchange="filterTables()">
                        <option value="VIP">Bàn VIP</option>
                        <option value="Normal">Bàn Bình Thường</option>
                    </select>

                    <!-- Table Number (Filtered by Type and Availability) -->
                    <label for="table-number">Bàn Số:</label>
                    <select id="table-number" name="table-number" required>
                        <% 
                            for (Tables table : a) { 
                                if (table.getCondition().equals("blank")) { // Show only available tables
                        %>
                        <option value="<%= table.getTableNumber() %>" data-type="<%= table.getLocation() %>">
                            Bàn số <%= table.getTableNumber() %> - <%= table.getLocation() %>
                        </option>
                        <% 
                                }
                            } 
                        %>
                    </select>
                   
                    <!-- Number of People -->
                    <label for="people">Số Người:</label>
                    <input type="number" id="people" name="number-of-people" min="1" required>

                    <!-- Submit Button -->
                    <button type="submit">Đặt Bàn</button>
                </form>

                <script>
                    function filterTables() {
                        var selectedType = document.getElementById("table-type").value;
                        var tableSelect = document.getElementById("table-number");

                        for (var i = 0; i < tableSelect.options.length; i++) {
                            var option = tableSelect.options[i];
                            var tableType = option.getAttribute("data-type");

                            if (tableType === selectedType) {
                                option.style.display = "block";
                            } else {
                                option.style.display = "none";
                            }
                        }

                        tableSelect.selectedIndex = 0;
                    }

                    // Set default date to tomorrow and display it below the heading
                    window.onload = function () {
                        var dateDisplay = document.getElementById("reservation-date");
                        var today = new Date();
                        var tomorrow = new Date();
                        tomorrow.setDate(today.getDate() + 1);  // Set tomorrow's date

                        // Định dạng ngày theo kiểu YYYY-MM-DD
                        var year = tomorrow.getFullYear();
                        var month = ('0' + (tomorrow.getMonth() + 1)).slice(-2);
                        var day = ('0' + tomorrow.getDate()).slice(-2);

                        // Gán giá trị cho trường ẩn và hiển thị ngày dưới tiêu đề nếu cần
                        dateDisplay.value = year + '-' + month + '-' + day; // Gán giá trị cho trường ẩn
                    };

                </script>

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
    </body>
</html>