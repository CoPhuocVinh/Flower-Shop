/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author Jio
 */
public class DBUtils {

    private static final String userName = "sa";
    private static final String password = "12345";

    public static Connection getConnectionV1() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        //com.microsoft.sqlserver.jdbc.SQLServerDriver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=UserManagement";
        conn = DriverManager.getConnection(url, userName, password);
        return conn;
    }

    public static Connection getConnection() throws ClassNotFoundException, SQLException, NamingException {
        Connection conn = null;
        Context context = new InitialContext();
        Context end = (Context) context.lookup("java:comp/env");
        DataSource ds = (DataSource) end.lookup("DBCon");
        conn = ds.getConnection();
        return conn;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException, NamingException {
        DBUtils test = new DBUtils();
        Connection conn = DBUtils.getConnectionV1();
        System.out.println(conn);
    }

}
