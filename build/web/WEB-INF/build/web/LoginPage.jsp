<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign in/up Form</title>
    <link rel="stylesheet" href="assets/css/styles.css">
    
</head>
<body>

    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="register" method="post">
                <h1>Đăng kí tài khoản</h1>
                <input type="text" placeholder="Tên" name="name"/>
                <input type="text" placeholder="Email" name="email"/>
                <input type="password" placeholder="Mật khẩu" name="password"/> 
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null) { %>
                    <p style="color: red;"><%= errorMessage %></p>
                <% } %>
                <button type="submit">Đăng kí</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="login" method="post">
                <h1>Đăng nhập</h1>
                <input type="text" placeholder="Email" name="email"/>
                <input type="password" placeholder="Mật khẩu" name="password"/>
                
                <% if (errorMessage != null) { %>
                    <p style="color: red;"><%= errorMessage %></p>
                <% } %>
                <a href="#">Quên mật khẩu?</a>
                <button type="submit">Đăng nhập</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Mừng trở lại!</h1><br>
                    
                    <button class="ghost" id="signIn">Đăng nhập</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Xin chào!</h1><br>

                    <button class="ghost" id="signUp">Đăng kí</button>
                </div>
            </div>
        </div>
    </div>

                <script src="assets/js/script.js"></script> <!-- Liên kết tệp JavaScript -->
</body>
</html>
