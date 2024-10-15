package Dao;

import Dao.MyDAO;
import Entity.MenuItems;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MenuItemDao extends MyDAO {

public List<MenuItems> getListMenuItems() throws SQLException {
        List<MenuItems> menuItemsList = new ArrayList<>();
        String query = "SELECT * FROM MenuItems";
        try {
        ps = con.prepareStatement(query);
         rs = ps.executeQuery();
         while (rs.next()) {
                MenuItems menuItem = new MenuItems();
                menuItem.setItemId(rs.getInt("item_id"));
                menuItem.setName(rs.getString("name"));
                menuItem.setDescription(rs.getString("description"));
                menuItem.setPrice(rs.getDouble("price"));
                menuItem.setCategory(rs.getString("category"));
                menuItem.setImage(rs.getString("image"));
                menuItemsList.add(menuItem);
            }
    } catch (Exception e) {
    }  
        return menuItemsList;
    }

    // Hàm thêm món ăn (insert)
    public void insertMenuItem(MenuItems menuItem) throws SQLException {
        String query = "INSERT INTO MenuItems (name, description, price, category, image) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, menuItem.getName());
            stmt.setString(2, menuItem.getDescription());
            stmt.setDouble(3, menuItem.getPrice());
            stmt.setString(4, menuItem.getCategory());
            stmt.setString(5, menuItem.getImage());  // Set giá trị của image
            stmt.executeUpdate();
        }
    }

    // Hàm cập nhật món ăn (update)
//    public void updateMenuItem(MenuItems menuItem) throws SQLException {
//    public void updateMenuItem(String name) throws SQLException {
//        String query = "UPDATE MenuItems SET description = ?, price = ?, category = ?, image = ? WHERE name = ?";
//        try (PreparedStatement stmt = connection.prepareStatement(query)) {
//            stmt.setString(1, menuItem.getName());
//            stmt.setString(2, menuItem.getDescription());
//            stmt.setDouble(3, menuItem.getPrice());
//            stmt.setString(4, menuItem.getCategory());
//            stmt.setString(5, menuItem.getImage());  // Set giá trị của image
//            stmt.setInt(6, menuItem.getItemId());
//            stmt.executeUpdate();
//        }
//    }

public void updateImg(String image, String name) throws SQLException {
    String query = "UPDATE MenuItems SET image = ? WHERE name = ?";
    try (PreparedStatement stmt = connection.prepareStatement(query)) {
        stmt.setString(1, image); // Đặt image ở vị trí 1
        stmt.setString(2, name);  // Đặt name ở vị trí 2
        stmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace(); // Ghi log hoặc in ra lỗi để biết có vấn đề
    }
}


    // Hàm xóa món ăn (delete)
    public void deleteMenuItem(int itemId) throws SQLException {
        String query = "DELETE FROM MenuItems WHERE item_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, itemId);
            stmt.executeUpdate();
        }
    }


//public static void main(String[] args) throws SQLException {
//    MenuItemDao m = new MenuItemDao();
//    List<MenuItems> l = m.getListMenuItems();
//    
//    for(int i = 0;i<l.size();i++){
//        System.out.println(l.get(i).getImage());
//    }
//    
//        String name = "Tôm Scampi";
//            String newImage = "assets/img/NormalFoods/Món Chính/Tôm nấu với sốt bơ tỏi'.jpg";
//
//            // Thực hiện cập nhật ảnh
//            m.updateImg(newImage, name);
//
//}

}
