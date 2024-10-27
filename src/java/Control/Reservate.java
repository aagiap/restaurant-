/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Dao.UsersDAO;
import Entity.Users;
import Entity.Reservations;
import Entity.ReservationJoinTable;
import Dao.ReservationDAO;
import Entity.Tables;
import Dao.TablesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import static java.lang.System.out;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "Reservate", urlPatterns = {"/reservate"})
public class Reservate extends HttpServlet {

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

        int tableId = Integer.parseInt(request.getParameter("tableId"));
        int numberOfPeople = Integer.parseInt(request.getParameter("number-of-people"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String timeSlot = request.getParameter("time-slot");
        String reservationDateStr = request.getParameter("reservationDate");

// Định dạng ngày theo định dạng của chuỗi đầu vào
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.sql.Date reservationDate = null;

        try {
            // Chuyển đổi chuỗi thành java.util.Date
            java.util.Date utilReservationDate = dateFormat.parse(reservationDateStr);

            // Chuyển đổi java.util.Date thành java.sql.Date
            reservationDate = new java.sql.Date(utilReservationDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            // Xử lý lỗi nếu định dạng ngày không hợp lệ, có thể thông báo người dùng hoặc dừng tiến trình
        }
        ReservationDAO re = new ReservationDAO();
        if (re.checkReservation(reservationDate, tableId, timeSlot)) {
            String msg = "Xin lỗi bàn bạn đặt đã full";
            request.setAttribute("msg", msg);
            request.getRequestDispatcher("Reservation.jsp").forward(request, response);
        } else {
            System.out.println("Reservation Details: userId=" + userId 
    + ", reservationDate=" + reservationDate 
    + ", numberOfPeople=" + numberOfPeople 
    + ", tableId=" + tableId 
    + ", timeSlot=" + timeSlot);
            Reservations r = new Reservations(userId, reservationDate, numberOfPeople, "Pending", tableId, timeSlot);
            System.out.println(r.toString());
            re.insertReservation(r);

            response.sendRedirect("Order.jsp");
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
        //processRequest(request, response);
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
