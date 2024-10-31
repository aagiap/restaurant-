package Dao;

import Dao.MyDAO;
import Entity.MenuItems;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    public void updateMenuItem(String category, double price, int itemId, String name) throws SQLException {
        String query = "UPDATE MenuItems SET category = ?, price = ?, name = ? WHERE item_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, category);  // Đặt category ở vị trí 1
            stmt.setDouble(2, price);     // Đặt price ở vị trí 2
            stmt.setString(3, name);      // Đặt name ở vị trí 3
            stmt.setInt(4, itemId);       // Đặt item_id ở vị trí 4
            stmt.executeUpdate();         // Thực thi câu lệnh cập nhật
        } catch (SQLException e) {
            e.printStackTrace(); // Ghi log hoặc in ra lỗi để biết có vấn đề
        }
    }

    public void updatePrice(double price, int itemId) throws SQLException {
        String query = "UPDATE MenuItems SET price = ? WHERE item_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setDouble(1, price);     // Đặt price ở vị trí 2
            stmt.setInt(2, itemId);       // Đặt item_id ở vị trí 4
            stmt.executeUpdate();         // Thực thi câu lệnh cập nhật
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

public static void main(String[] args) {
    MenuItemDao mD = new MenuItemDao();
    //MenuItems m = new MenuItems("test", "", 100000, "Món chính", "cc");
    //mD.insertMenuItem(m);
            List<MenuItems> l;
        try {
            l = mD.getListMenuItems();
            for(MenuItems m : l){
                System.out.println(m.toString());
            }
        } catch (SQLException ex) {
            Logger.getLogger(MenuItemDao.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            
    }
}
