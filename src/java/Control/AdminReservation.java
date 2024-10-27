/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Dao.MenuItemDao;
import Dao.OrderInforDAO;
import Entity.MenuItems;
import Dao.TablesDAO;
import Entity.OrderInfo;
import Entity.Tables;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AdminReservation", urlPatterns = {"/AdminReservation", "/AdminUpdateTable", "/tableInfo"})
public class AdminReservation extends HttpServlet {

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

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        if (path.equals("/AdminUpdateTable")) {
            doUpdateTable(request, response);
        } else if (path.equals("/tableInfo")) {
            doTableInfo(request, response);
        }
    }

    protected void doTableInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
             // Nhận các thông tin từ form
            String username = request.getParameter("userName");
            String reservationDate = request.getParameter("reservationDate");
            int numberOfPeople = Integer.parseInt(request.getParameter("numberOfPeople"));
            String timeSlot = request.getParameter("timeSlot");
            int tableNumber = Integer.parseInt(request.getParameter("tableNumber"));
            String location = request.getParameter("location");

            OrderInforDAO oD = new OrderInforDAO();
            List<OrderInfo> lO = oD.getListOrderInfoForTomorrow(username, reservationDate, numberOfPeople, timeSlot, tableNumber, location);
            request.setAttribute("lO", lO);
            request.getRequestDispatcher("AdminReservation_1.jsp").forward(request, response);
        
//        HttpSession session = request.getSession();
//session.setAttribute("lO", lO);
//response.sendRedirect("AdminReservation_1.jsp");

    }

    protected void doUpdateTable(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int tableId = Integer.parseInt(request.getParameter("tableId"));
        TablesDAO tablesDao = new TablesDAO();
        tablesDao.updateLocation(tableId, "blank");
        response.sendRedirect("AdminReservation.jsp"); // Chuyển hướng đến trang chào mừng
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
