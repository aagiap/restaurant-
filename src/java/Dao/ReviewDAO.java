/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import Entity.Review;
import Entity.Users;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class ReviewDAO extends MyDAO {

    public List<Review> getReview() {
        List<Review> r = new ArrayList<>();
        xSql = "select * from Reviews";
        try {
            ps = con.prepareStatement(xSql); // ném lệnh đi sql
            rs = ps.executeQuery(); //nhận kết quả
            int userId, rating;
            String comment;
            Date reviewDate;
            Review re;
            while (rs.next()) {
                userId = rs.getInt("user_id");
                rating = rs.getInt("rating");
                comment = rs.getString("comment");
                reviewDate = rs.getDate("review_date");

                re = new Review(userId, rating, comment, reviewDate);
                r.add(re);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (r);
    }

    public boolean checkReview(int userId) {
        String sql = "SELECT TOP 1 reservation_date "
                + "FROM Reservations "
                + "WHERE user_id = ? "
                + "ORDER BY reservation_date ASC;"; // Lấy review_date sớm nhất của user

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId); // Đặt giá trị cho userId trong câu lệnh SQL
            rs = ps.executeQuery(); // Thực hiện truy vấn

            // Kiểm tra nếu có kết quả
            if (rs.next()) {
                // Lấy review_date từ kết quả truy vấn
                Date reviewDate = rs.getDate("reservation_date");

                // So sánh review_date với ngày hiện tại
                Date currentDate = new Date(System.currentTimeMillis());
                if (reviewDate.before(currentDate)) {
                    return true; // Trả về true nếu review_date nhỏ hơn hôm nay
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý lỗi
        }
        return false; // Nếu không có kết quả hoặc review_date không nhỏ hơn hôm nay, trả về false
    }

    public boolean checkReviewExist(int userId) {
        String sql = "SELECT 1 "
                + "FROM Reviews "
                + "WHERE user_id = ?;"; // Kiểm tra nếu có review của user_id

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId); // Đặt giá trị cho userId trong câu lệnh SQL
            rs = ps.executeQuery(); // Thực hiện truy vấn

            // Kiểm tra nếu có kết quả
            if (rs.next()) {
                return true; // Trả về true nếu có ít nhất một kết quả
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý lỗi
        }
        return false; // Nếu không có kết quả, trả về false
    }

    public void insertReview(int userId, int rating, String comment) {
        String sql = "INSERT INTO Reviews (user_id, rating, comment, review_date) "
                + "VALUES (?, ?, ?, CAST(GETDATE() AS DATE));"; // Thêm review với ngày là hôm nay

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userId); // Gán giá trị userId
            ps.setInt(2, rating); // Gán giá trị rating
            ps.setString(3, comment); // Gán giá trị comment

            // Thực hiện lệnh INSERT
            int rowsInserted = ps.executeUpdate();

            // In thông báo nếu thêm thành công
            if (rowsInserted > 0) {
                System.out.println("Review has been successfully inserted.");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Xử lý lỗi
            System.out.println("Error while inserting review.");
        }
    }

    public static void main(String[] args) {
        ReviewDAO re = new ReviewDAO();
        //System.out.println(re.checkReview(9));
        System.out.println(re.checkReviewExist(9));
    }

}
