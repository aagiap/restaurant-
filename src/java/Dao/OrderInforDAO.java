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

//    
    public List<OrderInfo> getListOrderInfoForTomorrow(String username, String reservationDate, int numberOfPeople, String timeSlot, int tableNumber, String location) {
    List<OrderInfo> orderInfoList = new ArrayList<>();

    String xSql = "SELECT u.username, r.reservation_date, r.number_of_people, r.time_slot, "
            + "t.table_number, t.location, m.name, o.quantity "
            + "FROM Orders o "
            + "JOIN Users u ON o.user_id = u.user_id "
            + "JOIN Reservations r ON r.reservation_date = o.order_date "
            + "JOIN Tables t ON r.table_id = t.table_id "
            + "JOIN MenuItems m ON o.item_id = m.item_id "
            + "WHERE r.reservation_date = ? "    // Điều kiện theo reservation_date
            + "AND u.username = ? "              // Điều kiện theo username
            + "AND r.number_of_people = ? "      // Điều kiện theo number_of_people
            + "AND r.time_slot = ? "             // Điều kiện theo time_slot
            + "AND t.table_number = ? "          // Điều kiện theo table_number
            + "AND t.location = ?";              // Điều kiện theo location

    try {
        ps = con.prepareStatement(xSql);

        // Gán giá trị cho từng điều kiện trong câu truy vấn
        ps.setString(1, reservationDate);      // Gán giá trị cho reservationDate
        ps.setString(2, username);             // Gán giá trị cho username
        ps.setInt(3, numberOfPeople);          // Gán giá trị cho numberOfPeople
        ps.setString(4, timeSlot);             // Gán giá trị cho timeSlot
        ps.setInt(5, tableNumber);             // Gán giá trị cho tableNumber
        ps.setString(6, location);             // Gán giá trị cho location

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
        List<OrderInfo> lO = oD.getListOrderInfoForTomorrow("2", "2024-10-26", 2, "morning", 2, "Normal");
        if(lO.isEmpty()){
            System.out.println("no order tomorrow");
        }else{
             for(OrderInfo o : lO){
            System.out.println(o.toString());
        }
        }
       
    }
}
