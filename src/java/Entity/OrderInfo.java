/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author ASUS
 */
public class OrderInfo {
    private String username;
    private String reservationDate;
    private int numberOfPeople;
    private int tableNumber;
    private String location;
    private String itemName;
    private int quantity;

    public OrderInfo(String username, String reservationDate, int numberOfPeople, int tableNumber, String location, String itemName, int quantity) {
        this.username = username;
        this.reservationDate = reservationDate;
        this.numberOfPeople = numberOfPeople;
        this.tableNumber = tableNumber;
        this.location = location;
        this.itemName = itemName;
        this.quantity = quantity;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(String reservationDate) {
        this.reservationDate = reservationDate;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
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
        this.location = location;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "OrderInfo{" + "username=" + username + ", reservationDate=" + reservationDate + ", numberOfPeople=" + numberOfPeople + ", tableNumber=" + tableNumber + ", location=" + location + ", itemName=" + itemName + ", quantity=" + quantity + '}';
    }
    
    
}
