
package sample.shopping;

import java.sql.Date;

/**
 *
 * @author Jio
 */
public class Bill {
    private int billID;
    private String userID;
    private Date date;

    public Bill() {
    }

    

    public Bill(int billID, String userID, Date date) {
        this.billID = billID;
        this.userID = userID;
        this.date = date;
    }

    public int getBillID() {
        return billID;
    }

    public void setBillID(int billID) {
        this.billID = billID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
}
