
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Entity.Users"%>
<%@ page import="java.util.List" %>
<%@ page import="Entity.MenuItems" %>
<%@ page import="Entity.Tables" %>
<%@ page import="Dao.TablesDAO" %>
<%@ page import="Dao.ReviewDAO" %>
<%@ page import="Dao.ReservationDAO" %>

<%
    Users user = (Users) session.getAttribute("user");
    //List<MenuItems> l = (List<MenuItems>) session.getAttribute("l");
    
       TablesDAO tablesDAO = new TablesDAO();
       List<Tables> a = tablesDAO.getListTables();
       
        Boolean check = (Boolean) request.getAttribute("check");
        String msg = (String) request.getAttribute("msg");
        if(msg==null){
    msg="";
    }
ReservationDAO r = new ReservationDAO();
boolean checkReservationToday = r.checkReservationToday(user.getUsersId());

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


        <style>
            #hero{
                background: transparent;
            }
            body{
                background-color: whitesmoke;
            }
            .Form {
                font-family: Arial, sans-serif;
                /*                background: url('assets/img/events-2.jpg') no-repeat center center fixed;*/
                background-size: cover;
                color: lightgrey;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-container {
                background-color: rgba(0, 0, 0, 0.7);
                padding: 20px;
                border-radius: 10px;
                width: 500px;
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
                        <li><a href="menu">Menu</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
                <div class="user-menu">
                    <a href="tabled.jsp" class="btn-getstarted"><%= user.getUserName() %></a>
                    <a class="btn-logout" href="index.html">Đăng xuất</a>
                </div>
            </div>
        </header>

        <section id="hero" class="hero section light-background">
            <div class="container">
                <div class="row gy-4 justify-content-center justify-content-lg-between">
                    <div class="col-6 col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                        <!--<img src="assets/img/gallery/gallery-1.jpg" class="img-fluid animated" alt="Bàn Thường" title="Bàn Thường">-->
                        <a style="margin: 0% auto" href="assets/img/gallery/gallery-1.jpg" class="glightbox"><img src="assets/img/gallery/gallery-1.jpg" class="menu-img img-fluid" alt="Bàn Thường" title="Bàn Thường"></a>
                        <h2 style="text-align: center">Bàn Thường</h2>
                    </div>


                    <div class="col-6 col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                        <!--<img src="assets/img/gallery/gallery-3.jpg" class="img-fluid animated" alt="Bàn VIP" title="Bàn VIP">-->
                        <a style="margin: 0% auto" href="assets/img/gallery/gallery-3.jpg" class="glightbox"><img src="assets/img/gallery/gallery-3.jpg" class="menu-img img-fluid" alt="Bàn VIP" title="Bàn VIP"></a>
                        <h2 style="text-align: center">Bàn VIP</h2>
                    </div>       
                </div>
                <!--</div>-->


                <!--<div class="container">-->
                <div class="row gy-4 justify-content-center justify-content-lg-between">
                    <!-- Form to input user reservation details -->
                    <div class="col-6 col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                        <h3 style="text-align: center">Danh Sách Bàn Ăn</h3>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="col-2" scope="col">Bàn Số</th>
                                    <th class="col-2" scope="col">Loại</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    for (Tables table : a) { 
                                %>
                                <tr>
                                    <td><%= table.getTableNumber() %></td>
                                    <td><%= table.getLocation() %></td>
                                </tr>
                                <% 
                                    } 
                                %>
                            </tbody>
                        </table>
                    </div>

                    <div class="Form col-6 col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
                        <div class="form-container">
                            <h2 style="color: white">Đặt Bàn</h2>

                            <% 
                                // Check if the user has already made a reservation for today
            
                                if (checkReservationToday) {
                            %>
                            <div class="alert alert-info">
                                Bạn đã đặt bàn rồi, hãy xem thông tin ở dưới đây:
                                <a href="tabled.jsp">Xem Thông Tin Đặt Bàn</a> <!-- Link to reservation details -->
                            </div>
                            <% 
                                } else { 
                            %>

                            <div>
                                <p style="color: white"><%=msg%>abc</p>
                            </div>

                            <form action="reservate" method="POST">
                                <input type="hidden" name="userId" value="<%= user.getUsersId() %>" />

                                <!-- Displaying Date Selection for the Next 3 Days -->
                                <div id="reservation-date-display">
                                    <strong>Đặt cho ngày:</strong>
                                    <select id="reservation-date" name="reservationDate">
                                        <!-- The options will be populated dynamically via JavaScript -->
                                    </select>
                                </div>


                                <!-- Table selection dropdown -->
                                <label for="tableId">Chọn bàn:</label>
                                <select name="tableId" id="tableId">
                                    <% 
                                        for (Tables table : a) { 
                                            
                                    %>
                                    <option value="<%= table.getTableId() %>">
                                        Bàn số <%= table.getTableNumber() %> - <%= table.getLocation() %>
                                    </option>
                                    <%                                       
                                        } 
                                    %>
                                </select>

                                <!-- Time slot selection -->
                                <label for="time-slot">Chọn khung giờ:</label>
                                <select id="time-slot" name="time-slot" required>
                                    <option value="morning">Sáng (8:00)</option>
                                    <option value="noon">Trưa (11:00)</option>
                                    <option value="evening">Tối (18:00)</option>
                                </select>

                                <!-- Number of People -->
                                <label for="people">Số Người:</label>
                                <input type="number" id="people" name="number-of-people" min="1" max="8" required>

                                <!-- Submit Button -->
                                <button type="submit">Đặt Bàn</button>
                            </form>

                            <% 
                            } 
                            %>

                            <script>
                                // Generate options for the next 3 days starting from tomorrow
                                window.onload = function () {
                                    var dateSelect = document.getElementById("reservation-date");
                                    var today = new Date();
                                    var tomorrow = new Date();
                                    tomorrow.setDate(today.getDate() + 1);  // Set tomorrow's date

                                    // Loop to generate the next 3 days
                                    for (var i = 0; i < 3; i++) {
                                        var optionDate = new Date();
                                        optionDate.setDate(tomorrow.getDate() + i);  // Increment day for each option

                                        // Format date as YYYY-MM-DD
                                        var year = optionDate.getFullYear();
                                        var month = ('0' + (optionDate.getMonth() + 1)).slice(-2);
                                        var day = ('0' + optionDate.getDate()).slice(-2);

                                        // Create option element for the date select dropdown
                                        var option = document.createElement("option");
                                        option.value = year + '-' + month + '-' + day;
                                        option.textContent = year + '-' + month + '-' + day;

                                        // Append the option to the select dropdown
                                        dateSelect.appendChild(option);
                                    }
                                };
                            </script>
                        </div>
                    </div>


                </div>                  
            </div>
        </section>

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





        <script>
            // Hàm fun() để hiển thị confirm và chuyển hướng
            function fun() {
                window.location.href = "Reservation.jsp";
                if (confirm("Bạn đã đặt bàn thành công! Bạn có muốn đặt món không?")) {
                    // Nếu người dùng bấm OK, chuyển đến table.jsp
                    window.location.href = "Order.jsp";
                }
            }

            // Kiểm tra giá trị của check và gọi hàm fun nếu check là true
            <% if (check != null && check) { %>
            fun(); // Gọi hàm fun() nếu check là true
            <% } %>
        </script>


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