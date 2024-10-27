/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Entity.DiscountItem;
import Entity.MenuItems;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
public class DiscountItemDAO extends MyDAO {

    public List<DiscountItem> getDiscountItems() {
        List<DiscountItem> discountItems = new ArrayList<>();
        String xSql = "SELECT * FROM DiscountItem";
        try {
            ps = con.prepareStatement(xSql); // Chuẩn bị lệnh SQL
            rs = ps.executeQuery(); // Thực thi câu lệnh và nhận kết quả

            // Các biến để lưu thông tin từng dòng
            int discountId;
            int discountPercent;
            String condition;
            DiscountItem discountItem;

            // Duyệt qua kết quả
            while (rs.next()) {
                discountId = rs.getInt("discountId");
                discountPercent = rs.getInt("percentDiscount");
                condition = rs.getString("condition");

                // Tạo đối tượng DiscountItem và thêm vào danh sách
                discountItem = new DiscountItem(discountId, discountPercent, condition);
                discountItems.add(discountItem);
            }

            // Đóng kết nối
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discountItems; // Trả về danh sách DiscountItem
    }

    public void insertDiscountItem(int discountPercent, String condition) {
        String xSql = "INSERT INTO DiscountItem (percentDiscount, condition) VALUES (?, ?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, discountPercent); // Đặt giá trị cho cột percentDiscount
            ps.setString(2, condition);    // Đặt giá trị cho cột condition
            ps.executeUpdate();             // Thực thi câu lệnh
            ps.close();                     // Đóng PreparedStatement
        } catch (Exception e) {
            e.printStackTrace(); // Bắt và in ra lỗi nếu có
        }
    }

    public void deleteDiscount(int discountId) {
        String xSql = "DELETE FROM DiscountItem WHERE discountId = ?"; // Câu lệnh SQL xóa theo discountId
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, discountId); // Đặt giá trị cho discountId
            ps.executeUpdate();       // Thực thi câu lệnh xóa
            ps.close();               // Đóng PreparedStatement
        } catch (Exception e) {
            e.printStackTrace(); // Bắt và in ra lỗi nếu có
        }
    }

    public void applyDiscount(DiscountItem d) {
        try {
            DiscountItemDAO dD = new DiscountItemDAO();
            MenuItemDao mD = new MenuItemDao();
            List<MenuItems> lM = mD.getListMenuItems();
            for (int i = 0; i < lM.size(); i++) {
                double discountedPrice = lM.get(i).getPrice() * (1 - d.getDiscountPercent() / 100.0);
                mD.updatePrice(discountedPrice, i + 1);

            }
            dD.updateDiscountCondition(d.getDiscountId(), "apply");
        } catch (SQLException ex) {
            Logger.getLogger(DiscountItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removeDiscount(DiscountItem d) {
        try {
            DiscountItemDAO dD = new DiscountItemDAO();
            MenuItemDao mD = new MenuItemDao();
            List<MenuItems> lM = mD.getListMenuItems();
            for (int i = 0; i < lM.size(); i++) {
// Lấy giá hiện tại đã áp dụng giảm giá thứ hai
                double price = lM.get(i).getPrice() * (100 / (100 - d.getDiscountPercent()));

                mD.updatePrice(price, i + 1);
            }
            dD.updateDiscountCondition(d.getDiscountId(), "not apply");
        } catch (SQLException ex) {
            Logger.getLogger(DiscountItemDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkDiscountCondition() {
        boolean hasApplyCondition = false;

        String sql = "SELECT COUNT(*) FROM DiscountItem WHERE condition = 'apply'";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                hasApplyCondition = count > 0; // Nếu có ít nhất 1 hàng, set true
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu có
        }

        return hasApplyCondition;
    }
    
    public boolean checkDiscountConditionOfDiscount( int discountId) {
        boolean hasApplyCondition = false;

        String sql = "SELECT * FROM DiscountItem WHERE discountId = ?";

        try {
            ps = con.prepareStatement(sql);
         
            ps.setInt(1, discountId);
            rs = ps.executeQuery();
            if (rs.next()) {
                String  condition = rs.getString(3);
                if(condition.equals("apply")){
                hasApplyCondition = true; // Nếu có ít nhất 1 hàng, set true
            }}
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu có
        }

        return hasApplyCondition;
    }

    public void updateDiscountCondition(int discountId, String condition) {
        String sql = "UPDATE DiscountItem SET condition = ? WHERE discountId = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, condition); // Gán giá trị cho điều kiện
            ps.setInt(2, discountId); // Gán giá trị cho discountId

            int rowsUpdated = ps.executeUpdate(); // Thực thi câu lệnh cập nhật
            if (rowsUpdated > 0) {
                System.out.println("Discount condition updated successfully.");
            } else {
                System.out.println("No discount found with the provided ID.");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Xử lý lỗi nếu có
        }
    }

    public static void main(String[] args) throws SQLException {
        DiscountItemDAO dD = new DiscountItemDAO();
//        dD.insertDiscountItem(50, "not apply");
        //List<DiscountItem> l = dD.getDiscountItems();
//        if (l.isEmpty()) {
//            System.out.println("null");
//        } else {
//            for (DiscountItem d : l) {
//                System.out.println(d.toString());
//            }
//        }
//dD.applyDiscount(l.get(0));
//dD.removeDiscount(l.get(0));
//System.out.println(dD.checkDiscountCondition());
//dD.deleteDiscount(4);
    }

}
