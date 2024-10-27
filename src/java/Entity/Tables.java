/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Entity;

/**
 *
 * @author ASUS
 */
public class Tables {

    private int tableId;
    private int tableNumber;
    private String location;

    // Constructor
    public Tables(int tableNumber, String location) {
        this.tableNumber = tableNumber;
        this.location = location;
    }

    public Tables(int tableId, int tableNumber, String location) {
        this.tableId = tableId;
        this.tableNumber = tableNumber;
        this.location = location;

    }

    // Getters and Setters
    public int getTableId() {
        return tableId;
    }

    public void setTableId(int tableId) {
        this.tableId = tableId;
    }

    public int getTableNumber() {
        return tableNumber;
    }

    public void setTableNumber(int tableNumber) {
        this.tableNumber = tableNumber;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        if (location.equals("VIP") || location.equals("Normal")) {
            this.location = location;
        } else {
            throw new IllegalArgumentException("Invalid location value.");
        }
    }

    // Optional: Override toString() for easier debugging
    @Override
    public String toString() {
        return "Tables{" + "tableId=" + tableId + ", tableNumber=" + tableNumber + ", location=" + location + '}';
    }

}
