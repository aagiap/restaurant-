/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;
import Entity.Orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Contact.DBContext;
import Entity.MenuItemJoinOrder;
import Entity.Users;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class OrderDAO extends MyDAO{
    public void insertOrder(int userId, int itemId,int quantity,double price) {
    String xSql = "INSERT INTO Orders (user_id, status, item_id, quantity, price) VALUES (?, ?, ?, ?, ?)";
    try {
        PreparedStatement ps = con.prepareStatement(xSql);
        ps.setInt(1, userId);
        ps.setString(2, "pending");
        ps.setInt(3, itemId);
        ps.setInt(4,quantity);
        ps.setDouble(5, price);
        ps.executeUpdate();
        ps.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
    public List<Orders> getOrderList() {
    List<Orders> orderList = new ArrayList<>();
    String xSql = "SELECT * FROM Orders"; // Lấy dữ liệu từ bảng Orders

    try {
        ps = con.prepareStatement(xSql); // Ném lệnh SQL
        rs = ps.executeQuery(); // Nhận kết quả

        while (rs.next()) {
            int orderId = rs.getInt("order_id");
            int userId = rs.getInt("user_id");
            int itemId = rs.getInt("item_id");
            int quantity = rs.getInt("quantity");
            double price = rs.getDouble("price");
            Date orderDate = rs.getDate("order_date");
            String status = rs.getString("status");
            // Nếu bạn cần thông tin thêm, hãy lấy giá trị từ các cột khác ở đây
            
            // Tạo đối tượng Orders và thêm vào danh sách
            Orders order = new Orders(userId, status, itemId, quantity, price);
            orderList.add(order);
        }
        
        rs.close();
        ps.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return orderList; // Trả về danh sách đơn hàng
}
    public void deleteOrderItem(String name, int quantity, double price) {
    String xSql = "DELETE FROM Orders WHERE order_id IN (" +
                  "SELECT o.order_id FROM Orders o " +
                  "JOIN MenuItems m ON o.item_id = m.item_id " +
                  "WHERE m.name = ? AND o.quantity = ? AND o.price = ?)";
    
    try {
        ps = con.prepareStatement(xSql);
        ps.setString(1, name);       // Truyền giá trị 'name'
        ps.setInt(2, quantity);      // Truyền giá trị 'quantity'
        ps.setDouble(3, price);      // Truyền giá trị 'price'

        int rowsDeleted = ps.executeUpdate();  // Thực thi câu truy vấn
        
        // Kiểm tra xem có hàng nào bị xóa không
        if (rowsDeleted > 0) {
            System.out.println("Successfully deleted " + rowsDeleted + " rows.");
        } else {
            System.out.println("No matching records found to delete.");
        }

        ps.close();  // Đóng PreparedStatement
    } catch (Exception e) {
        e.printStackTrace();  // In lỗi nếu có
    }
}
    
    public List<MenuItemJoinOrder> getOrderListByUserId(int userIdS) {
    List<MenuItemJoinOrder> orderList = new ArrayList<>();
    String xSql = "SELECT o.order_id, o.user_id, o.status, o.quantity, o.price, " +
                  "m.item_id, m.name, m.category, m.image " +
                  "FROM Orders o JOIN MenuItems m ON o.item_id = m.item_id WHERE o.user_id = ? and CAST(order_date AS DATE) = CAST(DATEADD(DAY, 1, GETDATE()) AS DATE)"; 

    try {
        ps = con.prepareStatement(xSql); 
        ps.setInt(1, userIdS);
        rs = ps.executeQuery(); 

        while (rs.next()) {
            int itemId = rs.getInt("item_id");
            String name = rs.getString("name");
            String category = rs.getString("category");
            String image = rs.getString("image");
            String status = rs.getString("status");
            int quantity = rs.getInt("quantity");
            double price = rs.getDouble("price");

            // Create a new MenuItemJoinOrder object
            MenuItemJoinOrder order = new MenuItemJoinOrder(itemId, name, null, price, category, image, userIdS, status, quantity);
            orderList.add(order);
        }

        rs.close();
        ps.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return orderList; 
}


    
   


    public static void main(String[] args) {
        OrderDAO o = new OrderDAO();
        
        List<MenuItemJoinOrder> l = o.getOrderListByUserId(12);
        if(l.isEmpty()){
            System.out.println("null");
        }else{
              for(MenuItemJoinOrder m : l){
                  System.out.println(m.toString());
              }
        }
      
    }
            
}
