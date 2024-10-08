import Dao.MyDAO;
import Entity.MenuItems;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MenuItemDao extends MyDAO {


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

    public Link<MenuItems>
public static void main(String[] args) {
    // Khởi tạo MenuItemDao với kết nối
    try {
        MenuItemDao dao = new MenuItemDao();
        
        // Gọi phương thức updateImg
        dao.updateImg(
                "assets/img/NormalFoods/FastFood/hành tây chiên phô mai.jpg"
                ,
                "Hành tây chiên"
        );
        System.out.println("Cập nhật ảnh thành công.");
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

}
