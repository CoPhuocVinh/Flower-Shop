package sample.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.user.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author Jio
 */
public class ProductDAO {

    private static final String CHECK = "SELECT flowerName, flowerPrice, flowerQuantity FROM tblFlowers WHERE flowerID = ?";
    private static final String UPDATE_CHECKOUT = "UPDATE tblFlowers SET flowerQuantity = ? where flowerID =?";

    public Product checkFlowerDB(String id) throws SQLException {
        Product pro = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(CHECK);
            ptm.setString(1, id);

            //    ptm = conn.prepareStatement(LOGIN);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String flowerName = rs.getString("flowerName");
                double flowerPrice = rs.getFloat("flowerPrice");
                int flowerQuantity = rs.getInt("flowerQuantity");
                pro = new Product(id, flowerName, flowerPrice, flowerQuantity);
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

        return pro;
    }

    public boolean CheckOutQuantity(Cart cart) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();

            for (Product pro : cart.getCart().values()) {
                String flowerID = pro.getId();
                int quantity = pro.getQuantity();
                Product proDB = checkFlowerDB(flowerID);
                int CheckOutQuantity = proDB.getQuantity() - quantity;
                
                if (conn != null) {
                    ptm = conn.prepareStatement(UPDATE_CHECKOUT);
                    ptm.setInt(1, CheckOutQuantity);
                    ptm.setString(2, flowerID);
                    check = ptm.executeUpdate() > 0 ? true : false;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }

        return check;
    }

}
