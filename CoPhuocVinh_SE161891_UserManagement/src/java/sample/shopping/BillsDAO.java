package sample.shopping;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sample.utils.DBUtils;

/**
 *
 * @author Jio
 */
public class BillsDAO {

    private static final String INSERTBILL = "INSERT INTO tblBills(userid,createdate) values(?,?)";
    private static final String INSERTDETAILBILL = "INSERT INTO tblDetailBills(billID, flowerID, quantity, flowerPrice) VALUES(?,?,?,?)";
    private static final String SELECTBILLcurrent = "select top 1 billID from tblBills order by billID desc";
    private static final String SEARCHBILL = "SELECT billID FROM tblBills WHERE userID = ?";
    private static final String SEARCHDETAILBILL = "SELECT billID, flowerID, quantity, flowerPrice FROM tblDetailBills WHERE billID=?";

    public static int insertBill(String userID, Cart cart) throws SQLException {
        int kq = 0;
        Connection cn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                cn.setAutoCommit(false);
                ptm = cn.prepareStatement(INSERTBILL);
                Date d = new Date(System.currentTimeMillis());
                ptm.setString(1, userID);
                ptm.setDate(2, d);

                kq = ptm.executeUpdate();
                if (kq > 0) {
                    ptm = cn.prepareStatement(SELECTBILLcurrent);
                    rs = ptm.executeQuery();

                    if (rs != null && rs.next()) {
                        int billID = rs.getInt("billID");
                        if (cart != null && cart.cart.size() > 0) {
                            for (Product obj : cart.getCart().values()) {
                                String flowerID = obj.getId();
                                int quantity = obj.getQuantity();
                                float flowerPrice = (float) obj.getPrice();
                                ptm = cn.prepareStatement(INSERTDETAILBILL);
                                ptm.setInt(1, billID);
                                ptm.setString(2, flowerID);
                                ptm.setInt(3, quantity);
                                ptm.setFloat(4, flowerPrice);
                                kq = ptm.executeUpdate();
                            }
                        }
                    }

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cn.commit();
            cn.setAutoCommit(true);

            if (ptm != null) {
                ptm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return kq;
    }

    public ArrayList<Integer> checkBill(String userID) throws SQLException {
        ArrayList<Integer> list_Bill = new ArrayList<>();
        Connection cn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnection();
            ptm = cn.prepareStatement(SEARCHBILL);
            ptm.setString(1, userID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                list_Bill.add(rs.getInt("billID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
             if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return list_Bill;
    }

    public ArrayList<BillsDetail> checkBillsDetail(int billID) throws SQLException {
       ArrayList<BillsDetail> listBills = new ArrayList<>();
        BillsDetail BillsDetail = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
             conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SEARCHDETAILBILL);
            ptm.setInt(1, billID);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String flowerID = rs.getString("flowerID");
                int quantity = rs.getInt("quantity");
                float flowerPrice = rs.getFloat("flowerPrice");
                BillsDetail = new BillsDetail(billID, flowerID, quantity, flowerPrice);
                listBills.add(BillsDetail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
             if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listBills;
        
    }

}
