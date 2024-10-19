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
public class OrderInforDAO extends MyDAO{
    public List<OrderInfo> getListOrderInfo() {
    List<OrderInfo> orderInfoList = new ArrayList<>();
    String xSql = "SELECT u.username, r.reservation_date, r.number_of_people, " +
                  "t.table_number, t.location, m.name, o.quantity " +
                  "FROM Orders o " +
                  "JOIN Users u ON o.user_id = u.user_id " +
                  "JOIN Reservations r ON r.user_id = u.user_id " +
                  "JOIN Tables t ON r.table_id = t.table_id " +
                  "JOIN MenuItems m ON o.item_id = m.item_id";

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
    
    // Câu lệnh SQL cho SQL Server để lấy dữ liệu có ngày đặt là ngày mai
    String xSql = "SELECT u.username, r.reservation_date, r.number_of_people, " +
                  "t.table_number, t.location, m.name, o.quantity " +
                  "FROM Orders o " +
                  "JOIN Users u ON o.user_id = u.user_id " +
                  "JOIN Reservations r ON r.user_id = u.user_id " +
                  "JOIN Tables t ON r.table_id = t.table_id " +
                  "JOIN MenuItems m ON o.item_id = m.item_id " +
                  "WHERE CAST(r.reservation_date AS DATE) = CAST(DATEADD(day, 1, GETDATE()) AS DATE)";

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
public List<OrderInfo> getListOrderInfoForTomorrow(int tableNumber, String location) {
    List<OrderInfo> orderInfoList = new ArrayList<>();
    
    // Câu lệnh SQL để lấy dữ liệu theo tableNumber, location và ngày mai
    String xSql = "SELECT u.username, r.reservation_date, r.number_of_people, " +
                  "t.table_number, t.location, m.name, o.quantity " +
                  "FROM Orders o " +
                  "JOIN Users u ON o.user_id = u.user_id " +
                  "JOIN Reservations r ON r.user_id = u.user_id " +
                  "JOIN Tables t ON r.table_id = t.table_id " +
                  "JOIN MenuItems m ON o.item_id = m.item_id " +
                  "WHERE CAST(r.reservation_date AS DATE) = CAST(DATEADD(day, 1, GETDATE()) AS DATE) " +
                  "AND t.table_number = ? " + // Điều kiện theo tableNumber
                  "AND t.location = ?";      // Điều kiện theo location

    try {
        ps = con.prepareStatement(xSql); 
        ps.setInt(1, tableNumber);       // Gán giá trị cho tableNumber
        ps.setString(2, location);       // Gán giá trị cho location
        rs = ps.executeQuery(); 

        while (rs.next()) {
            String username = rs.getString("username");
            String reservationDate = rs.getString("reservation_date");
            int numberOfPeople = rs.getInt("number_of_people");
            int tableNum = rs.getInt("table_number");
            String tableLocation = rs.getString("location");
            String itemName = rs.getString("name");
            int quantity = rs.getInt("quantity");

            // Tạo đối tượng OrderInfo mới
            OrderInfo orderInfo = new OrderInfo(username, reservationDate, numberOfPeople, tableNum, tableLocation, itemName, quantity);
            orderInfoList.add(orderInfo);
        }

        rs.close();
        ps.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return orderInfoList;
}


//    public static void main(String[] args) {
//        OrderInforDAO oD = new OrderInforDAO();
//        //List<OrderInfo> lO = oD.getListOrderInfo();
//        //List<OrderInfo> lO = oD.getListOrderInfoForTomorrow();
//        List<OrderInfo> lO = oD.getListOrderInfoForTomorrow(2, "Normal");
//        if(lO.isEmpty()){
//            System.out.println("no order tomorrow");
//        }else{
//             for(OrderInfo o : lO){
//            System.out.println(o.toString());
//        }
//        }
//       
//    }
}
