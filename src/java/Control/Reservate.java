/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Control;

import Dao.UsersDAO;
import Entity.Users;
import Entity.Reservations;
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
import static java.lang.System.out;
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
        // Retrieve form data
//        String tableType = request.getParameter("table-type");
//        String tableNumberS = request.getParameter("table-number");
//        int tableNumber = Integer.parseInt(tableNumberS);
        TablesDAO tablesDao = new TablesDAO();

        int tableId = Integer.parseInt(request.getParameter("tableId"));

        int numberOfPeople = Integer.parseInt(request.getParameter("number-of-people"));
        int userId = Integer.parseInt(request.getParameter("userId"));

        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_YEAR, 1); // Cộng 1 ngày để lấy ngày mai
        Date reservationDate = calendar.getTime(); // Lấy ra ngày mai, chỉ có ngày tháng năm
        Reservations reservation = new Reservations(userId, reservationDate, numberOfPeople, "Pending", tableId);
        ReservationDAO re = new ReservationDAO();
        re.insertReservation(reservation);
//        request.setAttribute("userId", userId);
//request.setAttribute("reservationDate", reservationDate);
//request.setAttribute("numberOfPeople", numberOfPeople);
//request.setAttribute("tableId", tableId);
        tablesDao.updateLocation(tableId, "full");
//        response.sendRedirect("ReservationSuccess.jsp");

        boolean check = true;
        boolean tableTypes = re.checkTableYpype(userId, tableId);

        HttpSession sL = request.getSession();
        sL.setAttribute("tableId", tableId);
        sL.setAttribute("tableTypes", tableTypes);
        sL.setAttribute("reservation", reservation);
        request.setAttribute("check", check);
        request.getRequestDispatcher("Reservation.jsp").forward(request, response);
        // request.getRequestDispatcher("ReservationSuccess.jsp").include(request, response);
        //request.getRequestDispatcher("test.jsp").forward(request, response);
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
        processRequest(request, response);
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
