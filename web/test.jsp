<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page import="Entity.Users"%>
<%@ page import="java.util.List" %>
<%@ page import="Entity.MenuItems" %>
<%@ page import="Entity.Tables" %>
<%@ page import="Dao.TablesDAO" %>
<%@ page import="Dao.ReservationDAO" %>
<%@ page import="Entity.Reservations" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Reservation Details</title>
    </head>
    <body>
        <h2>Reservation Details</h2>

        <% 
        
             Integer tableId = (Integer) request.getAttribute("tableId");
        Integer numberOfPeople = (Integer) request.getAttribute("numberOfPeople");
        Integer userId = (Integer) request.getAttribute("userId");
        String reservationDate = (String) request.getAttribute("reservationDate");
            
        Users user = (Users) session.getAttribute("user");
        
        
         ReservationDAO r = new ReservationDAO();
        Reservations reservation = r.getReservationByUserId(user.getUsersId());
  Boolean tableType = null;
        if( user != null && reservation != null ){
            tableType = r.checkTableYpype( user.getUsersId(),reservation.getTableId());
        }
        %>

        <p>User ID: <%= userId != null ? userId : "Không có" %></p>
        <p>Table ID: <%= tableId != null ? tableId : "Không có" %></p>
        <p>Number of People: <%= numberOfPeople != null ? numberOfPeople : "Không có" %></p>
        <p>Reservation Date: <%= reservationDate != null ? reservationDate : "Không có" %></p>
        <p>Table Type: <%= tableType != null ? tableType : "Không có" %></p>
        <p>Reservation Details: <%= reservation != null ? reservation.toString() : "Không có thông tin đặt chỗ" %></p>

    </body>
</html>
