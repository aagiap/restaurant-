/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.Date;

/**
 *
 * @author ASUS
 */
public class ReservationJoinTable {
    private int tableNumber;
    private String location;
    private String userName;
    private Date reservationDate;
    private int numberOfPeople;
    private String timeSlot;

    public ReservationJoinTable(int tableNumber, String location, String userName, Date reservationDate, int numberOfPeople, String timeSlot) {
        this.tableNumber = tableNumber;
        this.location = location;
        this.userName = userName;
        this.reservationDate = reservationDate;
        this.numberOfPeople = numberOfPeople;
        this.timeSlot = timeSlot;
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(Date reservationDate) {
        this.reservationDate = reservationDate;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    @Override
    public String toString() {
        return "ReservationJoinTable{" + "tableNumber=" + tableNumber + ", location=" + location + ", userName=" + userName + ", reservationDate=" + reservationDate + ", numberOfPeople=" + numberOfPeople + ", timeSlot=" + timeSlot + '}';
    }

   

    
    
}
