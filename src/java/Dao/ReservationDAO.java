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
/**
 *
 * @author ASUS
 */
public class ReservationDAO extends MyDAO{
    public boolean insertReservation(Reservations reservation) {
        String sql = "INSERT INTO Reservations (user_id, reservation_date, number_of_people, status, table_id) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try {

            ps.setInt(1, reservation.getUserId());
            ps.setTimestamp(2, new java.sql.Timestamp(reservation.getReservationDate().getTime()));
            ps.setInt(3, reservation.getNumberOfPeople());
            ps.setString(4, reservation.getStatus());
            ps.setInt(5, reservation.getTableId());

            int result = ps.executeUpdate();
            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
