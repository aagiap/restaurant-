/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Entity.Orders;
import Dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
public class OrderItemServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            OrderDAO od = new OrderDAO();
            // Lấy thông tin từ form
            int userId = Integer.parseInt(request.getParameter("user_id"));
            int itemId = Integer.parseInt(request.getParameter("item_id"));
            String itemName = request.getParameter("item_name");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double itemPrice = Double.parseDouble(request.getParameter("item_price"));
            od.insertOrder(userId, itemId, quantity, itemPrice);
            response.sendRedirect("Order.jsp"); // Chuyển hướng đến trang chào mừng

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAO od = new OrderDAO();
            // Lấy thông tin từ form
            
            String itemName = request.getParameter("item_name");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double itemPrice = Double.parseDouble(request.getParameter("price"));
            od.deleteOrderItem(itemName, quantity, itemPrice);
            response.sendRedirect("Order.jsp"); // Chuyển hướng đến trang chào mừng
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
