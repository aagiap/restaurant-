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
    private String condition;

    // Constructor
    public Tables(int tableNumber, String location, String condition) {
        this.tableNumber = tableNumber;
        this.location = location;
        this.condition = condition;
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

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        if (condition.equals("blank") || condition.equals("full")) {
            this.condition = condition;
        } else {
            throw new IllegalArgumentException("Invalid condition value.");
        }
    }

    // Optional: Override toString() for easier debugging
    @Override
    public String toString() {
        return "Table [tableNumber=" + tableNumber +
                ", location=" + location + ", condition=" + condition + "]";
    }


}
