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
import Entity.ReservationJoinTable;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class ReservationDAO extends MyDAO {

    public Reservations getReservationByUserId(int userId) {
        String sql = "SELECT * FROM Reservations WHERE user_id = ? AND reservation_date >= GETDATE();";
        Reservations reservation = null;

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId); // Set the userId in the SQL statement
            rs = ps.executeQuery(); // Execute the query

            if (rs.next()) {
                // Extract data from the result set
                int tableId = rs.getInt("table_id");
                int numberOfPeople = rs.getInt("number_of_people");
                Date reservationDate = rs.getDate("reservation_date");
                String timeSlot = rs.getString("time_slot");
                reservation = new Reservations(userId, reservationDate, numberOfPeople, "Pending", tableId, timeSlot);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the error
        }

        return reservation; // Return the reservation or null if not found
    }

    public boolean checkTableYpype(int userId, int tableId) {
        String sql = "SELECT DISTINCT * "
                + "FROM Reservations "
                + "WHERE reservation_date >= GETDATE() "
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

    public boolean checkReservation(Date reservationDate, int tableId, String timeSlot) {
        String sql = "SELECT COUNT(*) FROM Reservations "
                + "WHERE reservation_date = ? AND table_id = ? AND time_slot = ?";

        try {
            ps = con.prepareStatement(sql); // 'con' là đối tượng Connection đã được khởi tạo
            ps.setDate(1, (java.sql.Date) reservationDate);  // Thiết lập tham số ngày đặt bàn
            ps.setInt(2, tableId);           // Thiết lập tham số mã bàn
            ps.setString(3, timeSlot);       // Thiết lập tham số slot thời gian

            rs = ps.executeQuery();  // Thực thi truy vấn

            // Kiểm tra kết quả
            if (rs.next()) {
                int count = rs.getInt(1);  // Lấy giá trị COUNT từ kết quả truy vấn
                return count > 0;          // Nếu count > 0, tức là đã có dữ liệu đặt bàn
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý ngoại lệ SQL nếu có lỗi xảy ra
        }

        return false;  // Nếu không có dữ liệu hoặc có lỗi xảy ra, trả về false
    }

    // Phương thức chèn Reservation vào cơ sở dữ liệu
    public void insertReservation(Reservations reservation) {
        String sql = "INSERT INTO Reservations (user_id, reservation_date, number_of_people, status, table_id, time_slot) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, reservation.getUserId());
            ps.setDate(2, (java.sql.Date) reservation.getReservationDate());
            ps.setInt(3, reservation.getNumberOfPeople());
            ps.setString(4, reservation.getStatus());
            ps.setInt(5, reservation.getTableId());
            ps.setString(6, reservation.getTimeSlot());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Reservation inserted successfully!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean checkReservationToday(int userId) {
    String sql = "SELECT TOP 1 reservation_date "
            + "FROM Reservations "
            + "WHERE user_id = ? "
            + "AND CAST(reservation_date AS DATE) > CAST(GETDATE() AS DATE)"; 

    try {
        ps = con.prepareStatement(sql);
        ps.setInt(1, userId); // Thiết lập userId cho câu truy vấn
        rs = ps.executeQuery(); // Thực hiện truy vấn

        // Nếu có kết quả, trả về true
        return rs.next();
    } catch (Exception e) {
        e.printStackTrace(); // Xử lý ngoại lệ nếu có
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return false; // Nếu không có kết quả, trả về false
}


    public List<ReservationJoinTable> getListReservation() {
        List<ReservationJoinTable> list = new ArrayList<>();
        String sql = "SELECT t.table_number, t.location, u.username, u.user_id, r.current_day, r.reservation_date, r.number_of_people, r.time_slot "
                + "FROM Reservations r "
                + "JOIN Users u ON r.user_id = u.user_id "
                + "JOIN Tables t ON r.table_id = t.table_id "
                + "WHERE r.reservation_date > GETDATE()";  // Only future reservations

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int usersID = rs.getInt("user_id");
                Date currentDay = rs.getDate("current_day");
                int tableNumber = rs.getInt("table_number");
                String location = rs.getString("location");
                String userName = rs.getString("username");
                Date reservationDate = rs.getDate("reservation_date");
                int numberOfPeople = rs.getInt("number_of_people");
                String timeSlot = rs.getString("time_slot");

                // Create a new ReservationInfo object and add it to the list
                ReservationJoinTable r = new ReservationJoinTable(usersID, currentDay, tableNumber, location, userName, reservationDate, numberOfPeople, timeSlot);
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        ReservationDAO r = new ReservationDAO();
        //Reservations re = new Reservations(35, reservationDate, 0, status, 0, timeSlot);
        //Reservations re = r.getReservationByUserId(0)
        //System.out.println(r.checkTableYpype(28, 9));
        System.out.println(r.checkReservationToday(25));
//        List<ReservationJoinTable> l = r.getListReservation();
//        for (ReservationJoinTable re : l) {
//            System.out.println(re.toString());
//        }
//System.out.println(r.checkTableYpype(25, 9));
//String reservationDateStr = "2024-10-30";
//
//        // Chuyển đổi chuỗi reservationDate thành java.sql.Date
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        Date reservationDate = null;
//        java.util.Date parsedDate = null;
//
//        try {
//            parsedDate = dateFormat.parse(reservationDateStr);
//        } catch (ParseException ex) {
//        }
//        reservationDate = new java.sql.Date(parsedDate.getTime());  // Chuyển đổi thành java.sql.Date
//
//     
//
//        Reservations re = new Reservations(12, reservationDate, 3, "pending", 2, "morning");
//r.insertReservation(re);

    }
}
