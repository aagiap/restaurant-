/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

//import java.util.Date;
import java.sql.Date;
/**
 *
 * @author ASUS
 */
public class Reservations {
    private int userId;
    private Date reservationDate;
    private int numberOfPeople;
    private String status;
    private int tableId;
    private String timeSlot;

    public Reservations(int userId, Date reservationDate, int numberOfPeople, String status, int tableId) {
        this.userId = userId;
        this.reservationDate = reservationDate;
        this.numberOfPeople = numberOfPeople;
        this.status = status;
        this.tableId = tableId;
    }

    public Reservations(int userId, Date reservationDate, int numberOfPeople, String status, int tableId, String timeSlot) {
        this.userId = userId;
        this.reservationDate = reservationDate;
        this.numberOfPeople = numberOfPeople;
        this.status = status;
        this.tableId = tableId;
        this.timeSlot = timeSlot;
    }
    

 

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getTableId() {
        return tableId;
    }

    public void setTableId(int tableId) {
        this.tableId = tableId;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }
    

    @Override
    public String toString() {
        return "Reservations{" +", userId=" + userId + ", reservationDate=" + reservationDate + ", numberOfPeople=" + numberOfPeople + ", status=" + status + ", tableId=" + tableId + '}';
    }
    
}
