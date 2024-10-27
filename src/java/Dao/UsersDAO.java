package Dao;

import Entity.Users;
import java.sql.*;
import java.util.*;

public class UsersDAO extends MyDAO {

    public List<Users> getUsers() {
        List<Users> t = new ArrayList<>();
        xSql = "select * from Users";
        try {
            ps = con.prepareStatement(xSql); // ném lệnh đi sql
            rs = ps.executeQuery(); //nhận kết quả
            String userName, passWord, email, role;
            Users x;
            while (rs.next()) {
                int userId = rs.getInt("user_id");
                userName = rs.getString("username");
                passWord = rs.getString("password");
                email = rs.getString("email");
                role = rs.getString("role");
                x = new Users(userId, userName, passWord, email, role);
                t.add(x);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return (t);
    }

    public Users getUser(String email, String password) {
        Users user = null;
        xSql = "select * from Users where email = ? and password = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                String userName = rs.getString("username");
                String passWord = rs.getString("password");
                String userEmail = rs.getString("email");
                String role = rs.getString("role");
                user = new Users(userId, userName, passWord, userEmail, role);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public Users getUserByEmail(String email) {
        Users user = null;
        xSql = "select * from Users where email = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("user_id");
                String userName = rs.getString("username");
                String passWord = rs.getString("password");
                String userEmail = rs.getString("email");
                String role = rs.getString("role");
                user = new Users(userId, userName, passWord, userEmail, role);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public void insertUser(String userName, String passWord, String email) {
        String xSql = "INSERT INTO Users (username, password, email, role) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(xSql);
            ps.setString(1, userName);
            ps.setString(2, passWord);
            ps.setString(3, email);
            ps.setString(4, "customer");
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//    public static void main(String[] args) {
//        UsersDAO u = new UsersDAO();
//        Users user = u.getUser("g", "g");
//        System.out.println(user.toString());
//    }

}
