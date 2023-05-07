
package sample.shopping;

/**
 *
 * @author Jio
 */
public class BillsDetail {
    
    private int billID;
    private String flowerID;
    private int quantity;
    private float flowerPrice;

    public BillsDetail() {
    }

    public BillsDetail(int billID, String flowerID, int quantity, float flowerPrice) {
        this.billID = billID;
        this.flowerID = flowerID;
        this.quantity = quantity;
        this.flowerPrice = flowerPrice;
    }

    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    public String getFlowerID() {
        return flowerID;
    }

    public void setFlowerID(String flowerID) {
        this.flowerID = flowerID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getFlowerPrice() {
        return flowerPrice;
    }

    public void setFlowerPrice(float flowerPrice) {
        this.flowerPrice = flowerPrice;
    }
    
    
    
    
}
