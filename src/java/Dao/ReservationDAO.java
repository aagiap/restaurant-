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
//    public static void main(String[] args) {
//        ReservationDAO r = new ReservationDAO();
//        
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
//    }
            
}
