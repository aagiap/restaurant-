/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Dao.MenuItemDao;
import Dao.UsersDAO;
import Entity.MenuItems;
import Entity.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "LoginRegister", urlPatterns = {"/LoginRegister", "/login", "/register", "/logout"})
public class LoginRegister extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.equals("/login")) {
            doLogin(request, response);
        } else if (path.equals("/register")) {
            doRegister(request, response);
        } else if (path.equals("/logout")) {
            doLogOut(request, response);
        }
    }

    protected void doLogOut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sL = request.getSession(false); // lấy session nếu có
        if (sL != null) {
            sL.invalidate(); // Kết thúc session
        }
    response.sendRedirect("index.html"); // Redirect to normal user page

}

protected void doLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UsersDAO u = new UsersDAO();
        Users user = u.getUser(email, password);
 
        if (user != null) {
            // Successful login
            HttpSession sL = request.getSession();
            sL.setAttribute("user", user);
  MenuItemDao m = new MenuItemDao();
        try {
            List<MenuItems> l = m.getListMenuItems();
            sL.setAttribute("l", l);
        } catch (SQLException ex) {
            Logger.getLogger(LoginRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
            // Check the user's role
            if (user.getRole().equalsIgnoreCase("admin")) {
                response.sendRedirect("AdminHome.jsp"); // Redirect to admin page
            } else {
                response.sendRedirect("Home.jsp"); // Redirect to normal user page
            }
        } else {
            // Failed login
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
            MenuItemDao m = new MenuItemDao();
        try {
            List<MenuItems> l = m.getListMenuItems();
            sR.setAttribute("l", l);
        } catch (SQLException ex) {
            Logger.getLogger(LoginRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            response.sendRedirect("Home.jsp"); // Chuyển hướng đến trang đăng nhập
        } else {
            // Email đã tồn tại
            request.setAttribute("errorMessage", "Email đã được sử dụng.");
            request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
        }
    }

}
