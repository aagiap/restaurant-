/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Dao.MyDAO;
import Dao.OrderDAO;
import Dao.MenuItemDao;
import Dao.ReservationDAO;
import Dao.UsersDAO;
import Dao.TablesDAO;
import Entity.MenuItems;
import Entity.OrderInfo;
import Entity.Users;
import Entity.Reservations;
import Entity.Tables;
import Entity.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class OrderInforDAO extends MyDAO {

    public List<OrderInfo> getListOrderInfo() {
        List<OrderInfo> orderInfoList = new ArrayList<>();
        String xSql = "SELECT u.username, r.reservation_date, r.number_of_people, "
                + "t.table_number, t.location, m.name, o.quantity "
                + "FROM Orders o "
                + "JOIN Users u ON o.user_id = u.user_id "
                + "JOIN Reservations r ON r.user_id = u.user_id "
                + "JOIN Tables t ON r.table_id = t.table_id "
                + "JOIN MenuItems m ON o.item_id = m.item_id";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String username = rs.getString("username");
                String reservationDate = rs.getString("reservation_date");
                int numberOfPeople = rs.getInt("number_of_people");
                int tableNumber = rs.getInt("table_number");
                String location = rs.getString("location");
                String itemName = rs.getString("name");
                int quantity = rs.getInt("quantity");

                // Tạo đối tượng OrderInfo mới
                OrderInfo orderInfo = new OrderInfo(username, reservationDate, numberOfPeople, tableNumber, location, itemName, quantity);
                orderInfoList.add(orderInfo);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderInfoList;
    }

    public List<OrderInfo> getListOrderInfoForTomorrow() {
        List<OrderInfo> orderInfoList = new ArrayList<>();

        String xSql = "SELECT u.username, r.reservation_date, r.number_of_people, r.time_slot, "
                + "t.table_number, t.location, m.name, o.quantity "
                + "FROM Orders o "
                + "JOIN Users u ON o.user_id = u.user_id "
                + "JOIN Reservations r ON r.user_id = u.user_id "
                + "JOIN Tables t ON r.table_id = t.table_id "
                + "JOIN MenuItems m ON o.item_id = m.item_id "
                + "WHERE r.reservation_date > GETDATE()";

        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String username = rs.getString("username");
                String reservationDate = rs.getString("reservation_date");
                int numberOfPeople = rs.getInt("number_of_people");
                String timeSlot = rs.getString("time_slot");
                int tableNumber = rs.getInt("table_number");
                String location = rs.getString("location");
                String itemName = rs.getString("name");
                int quantity = rs.getInt("quantity");

                // Tạo đối tượng OrderInfo mới
                OrderInfo orderInfo = new OrderInfo(username, reservationDate, numberOfPeople, timeSlot, tableNumber, location, itemName, quantity);
                orderInfoList.add(orderInfo);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderInfoList;
    }

//    22  26 28   27 28
    public List<OrderInfo> getListOrderInfoForTomorrow(int userId, String reservationDate, String currentDay) {
        List<OrderInfo> orderInfoList = new ArrayList<>();

        String xSql = "SELECT u.username, r.reservation_date, r.number_of_people, r.time_slot, "
                + "t.table_number, t.location, m.name, o.quantity "
                + "FROM Orders o "
                + "JOIN Users u ON o.user_id = u.user_id "
                + "JOIN Reservations r ON r.reservation_date = o.order_date "
                + "JOIN Tables t ON r.table_id = t.table_id "
                + "JOIN MenuItems m ON o.item_id = m.item_id "
                + "WHERE r.reservation_date = ? "
                + "AND r.user_id = ? "
                + "AND u.user_id = ? "
                + "AND o.user_id = ? "
                + "AND r.current_day = ? ";

        try {
            ps = con.prepareStatement(xSql);

            // Gán giá trị cho từng điều kiện trong câu truy vấn
            ps.setString(1, reservationDate);
            ps.setInt(2, userId);
            ps.setInt(3, userId);
            ps.setInt(4, userId);
            ps.setString(5, currentDay);

            rs = ps.executeQuery();

            // Duyệt kết quả và thêm vào danh sách orderInfoList
            while (rs.next()) {
                String fetchedUsername = rs.getString("username");
                String fetchedReservationDate = rs.getString("reservation_date");
                int fetchedNumberOfPeople = rs.getInt("number_of_people");
                String fetchedTimeSlot = rs.getString("time_slot");
                int fetchedTableNumber = rs.getInt("table_number");
                String fetchedLocation = rs.getString("location");
                String itemName = rs.getString("name");
                int quantity = rs.getInt("quantity");

                // Tạo đối tượng OrderInfo mới với các thông tin lấy được
                OrderInfo orderInfo = new OrderInfo(fetchedUsername, fetchedReservationDate, fetchedNumberOfPeople, fetchedTimeSlot, fetchedTableNumber, fetchedLocation, itemName, quantity);
                orderInfoList.add(orderInfo);
            }

            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderInfoList;
    }

    public static void main(String[] args) {
        OrderInforDAO oD = new OrderInforDAO();
        //List<OrderInfo> lO = oD.getListOrderInfo();
        //List<OrderInfo> lO = oD.getListOrderInfoForTomorrow();
        List<OrderInfo> lO = oD.getListOrderInfoForTomorrow(48, "2024-10-28", "2024-10-27");
        if (lO.isEmpty()) {
            System.out.println("no order tomorrow");
        } else {
            for (OrderInfo o : lO) {
                System.out.println(o.toString());
            }
        }

    }
}
