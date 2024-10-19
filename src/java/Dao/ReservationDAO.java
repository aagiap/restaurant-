/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Entity.Reservations;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Contact.DBContext;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author ASUS
 */
public class ReservationDAO extends MyDAO {
    
    public Reservations getReservationByUserId(int userId) {
    String sql = "SELECT * FROM Reservations WHERE user_id = ? AND reservation_date = CAST(GETDATE() + 1 AS DATE);";
    Reservations reservation = null;

    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, userId); // Set the userId in the SQL statement
        rs = ps.executeQuery(); // Execute the query

        if (rs.next()) {
            // Extract data from the result set
            int tableId = rs.getInt("table_id");
            int numberOfPeople = rs.getInt("number_of_people");
            Date reservationDate = rs.getDate("reservation_date");
            reservation = new Reservations(userId, reservationDate, numberOfPeople, "Pending", tableId);
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Handle the error
    }

    return reservation; // Return the reservation or null if not found
}

    public boolean checkTableYpype(int userId, int tableId) {
        String sql = "SELECT DISTINCT * "
                + "FROM Reservations "
                + "WHERE reservation_date = CAST(GETDATE() + 1 AS DATE) "
                + "AND user_id = ?;";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId); // Đặt giá trị cho userId trong câu lệnh SQL
            rs = ps.executeQuery(); // Thực hiện truy vấn

            // Kiểm tra xem có kết quả nào không
            if (rs.next()) {
                // Kiểm tra tableId
                return tableId >= 1 && tableId <= 7; // Trả về true nếu tableId trong khoảng 1-7
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi
        }
        return false; // Nếu không có kết quả hoặc không nằm trong khoảng, trả về false
    }

    public void insertReservation(Reservations reservation) {
        String sql = "INSERT INTO Reservations (user_id, reservation_date, number_of_people, status, table_id) "
                + "VALUES (?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, reservation.getUserId());
            ps.setTimestamp(2, new java.sql.Timestamp(reservation.getReservationDate().getTime()));
            ps.setInt(3, reservation.getNumberOfPeople());
            ps.setString(4, reservation.getStatus());
            ps.setInt(5, reservation.getTableId());

            ps.executeUpdate();
            ps.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
    public boolean checkReservationToday(int userId) {
    String sql = "SELECT TOP 1 reservation_date " 
               + "FROM Reservations " 
               + "WHERE user_id = ? " 
               + "ORDER BY reservation_date DESC"; // Get the latest reservation_date of the user

    try {
        ps = con.prepareStatement(sql);
        ps.setInt(1, userId); // Set the value for userId in the SQL statement
        rs = ps.executeQuery(); // Execute the query

        // Check if there are results
        if (rs.next()) {
            Date reservationDate = rs.getDate("reservation_date");

            // Get the current date without the time
            Date currentDate = new Date(System.currentTimeMillis());
            // Set the currentDate to the start of the day
            currentDate.setHours(0);
            currentDate.setMinutes(0);
            currentDate.setSeconds(0);

            // Create a Date object for the end of today
            Date endOfToday = new Date(currentDate.getTime() + (24 * 60 * 60 * 1000) - 1); // End of the day

            // Check if reservationDate is today
            if (reservationDate.after(currentDate) && reservationDate.before(endOfToday)) {
                return true; // Return true if reservationDate is today
            }
        }
    } catch (Exception e) {
        e.printStackTrace(); // Handle exceptions
    }
    return false; // If no results or reservationDate is not today, return false
}


    public static void main(String[] args) {
        ReservationDAO r = new ReservationDAO();
Reservations re = r.getReservationByUserId(12);
        System.out.println(re.toString());
//        // Tạo đối tượng Date cho ngày đặt chỗ
//        Calendar calendar = Calendar.getInstance();
//        calendar.set(2024, Calendar.OCTOBER, 12); // Ngày 12 tháng 10 năm 2024
//        Date reservationDate = calendar.getTime();
//
//        // Tạo đối tượng Reservations
//        Reservations re = new Reservations(1, reservationDate, 3, "Pending", 1);
//
//        // Gọi phương thức insertReservation
//        r.insertReservation(re);
//        System.out.println("Đặt bàn thành công!");
//        if (r.checkTableYpype(9, 8)) {
//            System.out.println("true");
//        } else {
//            System.out.println("false");
//        }
//boolean a = r.checkTableYpype(0, 0);
//System.out.println(r.checkReservationToday(3));
    }
}
