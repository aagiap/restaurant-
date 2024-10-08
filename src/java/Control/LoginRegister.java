/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Dao.UsersDAO;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "LoginRegister", urlPatterns = {"/LoginRegister", "/login", "/register"})
public class LoginRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.equals("/login")) {
            doLogin(request, response);
        } else if (path.equals("/register")) {
            doRegister(request, response);
        }
    }

    protected void doLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UsersDAO u = new UsersDAO();
        Users user = u.getUser(email, password);
        if (user != null) {
           // Đăng nhập thành công
            HttpSession sL = request.getSession();
            sL.setAttribute("user", user);
            response.sendRedirect("Home.jsp"); // Chuyển hướng đến trang chào mừng
        } else {
            // Đăng nhập thất bại
            request.setAttribute("errorMessage", "Email hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
        }
    }

    protected void doRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
String userName = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
UsersDAO u = new UsersDAO();
       
        Users existingUser = u.getUserByEmail(email);
        if (existingUser == null) {
            // Đăng ký thành công
            u.insertUser(userName, password, email);
            Users user = u.getUserByEmail(email);
            HttpSession sR = request.getSession();
            sR.setAttribute("user", user);
            response.sendRedirect("Home.jsp"); // Chuyển hướng đến trang đăng nhập
        } else {
            // Email đã tồn tại
            request.setAttribute("errorMessage", "Email đã được sử dụng.");
            request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
        }
    }

}
