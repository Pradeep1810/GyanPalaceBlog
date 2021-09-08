package com.myblog.helper;

import java.sql.*;


public class DatabaseConnector {

    private static Connection conn = null;

    public static Connection connect() {

        try {
            if (conn == null) {
//                loading driver class
                Class.forName("com.mysql.cj.jdbc.Driver");
//         creating connection
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog", "root", "");
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
           
        }
        return conn;
    }
}
