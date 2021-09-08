/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myblog.dao;

/**
 *
 * @author Pradeep
 */
import com.myblog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    public boolean saveUser(User user) {
        boolean saved = false;

        try {
//            saves user in database

            String query = "insert into user(user_name,user_email,user_password,user_gender,user_aboutUs) values(?,?,?,?,?)";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            saved = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return saved;
    }

    //get user by useremail and userpassword:
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "select * from user where user_email =? and user_password=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("user_name");
//             set to user object
                user.setName(name);

                user.setID(set.getInt("id"));
                user.setEmail(set.getString("user_email"));
                user.setPassword(set.getString("user_password"));
                user.setGender(set.getString("user_gender"));
                user.setAbout(set.getString("user_aboutUs"));
                user.setRegTime(set.getTimestamp("regDate"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    public boolean updateUser(User user) 
    {
        boolean edited = false;
        try{
        String query = "update user set user_email=? , user_password = ? , user_name =? , user_aboutUs=? where Id=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, user.getEmail());
        pstmt.setString(2, user.getPassword());
        pstmt.setString(3, user.getName());
        pstmt.setString(4, user.getAbout());
        pstmt.setInt(5, user.getID());
        
        pstmt.executeUpdate();
        edited=true;
        
        }catch(Exception e2){
            e2.printStackTrace();
        }
        return edited;
    }

}
