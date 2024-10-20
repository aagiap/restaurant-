/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

/**
 *
 * @author ASUS
 */
public class DiscountItem {
    private int discountId;
    private int discountPercent;
    private String condition;

    public DiscountItem(int discountId, int discountPercent, String condition) {
        this.discountId = discountId;
        this.discountPercent = discountPercent;
        this.condition = condition;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    @Override
    public String toString() {
        return "DiscountItem{" + "discountId=" + discountId + ", discountPercent=" + discountPercent + ", condition=" + condition + '}';
    }
    
}
