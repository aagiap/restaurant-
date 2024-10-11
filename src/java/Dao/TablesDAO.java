/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;
import java.sql.*;
import java.util.*;
import Entity.Tables;
/**
 *
 * @author ASUS
 */
public class TablesDAO extends MyDAO{
    public List<Tables> getListTables() {
    List<Tables> tablesList = new ArrayList<>();
    String xSql = "SELECT * FROM Tables"; // SQL query to fetch all records from the 'Tables' table

    try {
        ps = con.prepareStatement(xSql);  // Prepare SQL statement
        rs = ps.executeQuery();  // Execute query and retrieve results

        int tableNumber;
        String location, condition;
       // Tables table;  // Object to store each table's data

        // Iterate through the result set and populate the table list
        while (rs.next()) {
            //tableId = rs.getInt("table_id");  // Retrieve table_id
            tableNumber = rs.getInt("table_number");  // Retrieve table_number
            location = rs.getString("location");  // Retrieve location (VIP or Normal)
            condition = rs.getString("condition");  // Retrieve condition (blank or full)

            // Create new Table object and add it to the list
            //table = new Tables(tableNumber, location, condition);
            tablesList.add(new Tables(tableNumber, location, condition));
        }

        // Close result set and prepared statement
        rs.close();
        ps.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return tablesList;  // Return the list of Table objects
}
    public int searchTableId(int tableNumber, String tableType) {
    String xSql = "SELECT table_id FROM tables WHERE table_number = ? AND location = ?"; // SQL query to fetch table_id
    int tableId = -1; // Default value in case no matching table is found

    try {
        ps = con.prepareStatement(xSql);  // Prepare SQL statement
        ps.setInt(1, tableNumber);  // Set the table_number parameter
        ps.setString(2, tableType); // Set the table_type (location) parameter
        rs = ps.executeQuery();  // Execute query and retrieve results

        // If a result is found, extract the table_id
        if (rs.next()) {
            tableId = rs.getInt("table_id"); // Get the table_id from the result set
        }

        // Close result set and prepared statement
        rs.close();
        ps.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return tableId; // Return the table_id or -1 if no match was found
}
public void updateLocation(int tableId, String condition) {
    String xSql = "UPDATE tables SET condition = ? WHERE table_id = ?"; // Câu lệnh SQL để cập nhật 'location' theo 'table_id'

    try {
        ps = con.prepareStatement(xSql); // Chuẩn bị câu truy vấn
        ps.setString(1, condition);       // Gán giá trị mới cho 'location'
        ps.setInt(2, tableId);           // Gán giá trị 'table_id' cho câu lệnh SQL
        ps.executeUpdate();              // Thực thi câu lệnh update

        // Đóng PreparedStatement
        ps.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
//    public static void main(String[] args) {
//        TablesDAO t = new TablesDAO();
//////        List<Tables> a = t.getListTables();
//////        for(int i=0;i<a.size();i++){
//////            System.out.println(a.get(i).toString());
//////        }
////int a = t.searchTableId(1, "Vip");
////        System.out.println(a);
//t.updateLocation(1, "full");
//    }
}
