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
    

    public static void main(String[] args) {
        ReservationDAO r = new ReservationDAO();

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
boolean a = r.checkTableYpype(0, 0);
    }
}
