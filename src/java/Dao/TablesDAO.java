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
//    public static void main(String[] args) {
//        TablesDAO t = new TablesDAO();
//        List<Tables> a = t.getListTables();
//        for(int i=0;i<a.size();i++){
//            System.out.println(a.get(i).toString());
//        }
//    }
}
