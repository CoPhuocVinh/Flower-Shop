/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import org.apache.catalina.User;
import sample.utils.DBUtils;

/**
 *
 * @author Jio
 */
public class UserDAO {

    private static final String LOGIN = "SELECT fullname, roleID FROM tblUsers WHERE userID =? AND password =?";
    private static final String SEARCH = "select userID, fullname, roleID FROM tblUsers where fullname like ?";
    private static final String DELETE = "DELETE tblUsers where userID =?";
    private static final String UPDATE = "UPDATE tblUsers SET fullname = ?, roleID = ? where userID =?";
    private static final String CHECK_EXISTED = "SELECT userID FROM tblUsers where userID =?";
    private static final String INSERT = "INSERT INTO tblUsers(userID, fullname, roleID, password, status) VALUES(?,?,?,?,'true')";
    private static final String SELECLTOP2 = "select top 2 userID FROM tblUsers";

    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;

        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(LOGIN);
            ptm.setString(1, userID);
            ptm.setString(2, password);
            //    ptm = conn.prepareStatement(LOGIN);
            rs = ptm.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString("fullname");
                String roleID = rs.getString("roleID");

                user = new UserDTO(userID, fullname, roleID, "***");
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

        return user;

    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        //String s = "select userID, fullname, roleID, password FROM tblUsers where fullname like ?";
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;

        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SEARCH);
            ptm.setString(1, "%" + search + "%");

            rs = ptm.executeQuery();
            while (rs.next()) {
                String userID = rs.getString("userID");
                String fullname = rs.getString("fullname");
                String roleID = rs.getString("roleID");
                String password = "***";

                list.add(new UserDTO(userID, fullname, roleID, password));
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

        return list;
    }

    public boolean deleteUser(String userID) throws SQLException {
        boolean checkDelete = false;

        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, userID);
                checkDelete = ptm.executeUpdate() > 0 ? true : false;
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

        return checkDelete;
    }

    public boolean update(UserDTO updateUser) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, updateUser.getFullname());
                ptm.setString(2, updateUser.getRoleID());
                ptm.setString(3, updateUser.getUserID());
                checkUpdate = ptm.executeUpdate() > 0 ? true : false;
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
        return checkUpdate;
    }

    public boolean chechExisted(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();

            ptm = conn.prepareStatement(CHECK_EXISTED);
            ptm.setString(1, userID);

            rs = ptm.executeQuery();
            if (rs.next()) {
                check = true;
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
        return check;

    }

    public boolean insert(UserDTO user) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);

                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullname());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getPassword());

                check = ptm.executeUpdate() > 0 ? true : false;
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

    public boolean insertV2(UserDTO user) throws SQLException, ClassNotFoundException, NamingException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);

                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getFullname());
                ptm.setString(3, user.getRoleID());
                ptm.setString(4, user.getPassword());

                check = ptm.executeUpdate() > 0 ? true : false;
            }
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

    public ArrayList<UserDTO> SelectTOP2() throws SQLException {
        //String s = "select userID, fullname, roleID, password FROM tblUsers where fullname like ?";
        ArrayList<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        int size = 0;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(SELECLTOP2);
            //ptm.setString(1, "%" + search + "%");

            rs = ptm.executeQuery();
            while (rs.next()) {
                String userID = rs.getString("userID");
                
                //String password = "***";
                list.add(new UserDTO(userID));
                size++;
                if (size > 2) {
                    break;
                }

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

        return list;

    }
}
