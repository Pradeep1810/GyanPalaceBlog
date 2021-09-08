/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myblog.dao;

import com.myblog.entities.categories;
import com.myblog.entities.posts;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Pradeep
 */
public class PostDao {

    Connection conn;

    public PostDao(Connection conn) {

        this.conn = conn;
    }

    public ArrayList<categories> getAllCategories() {
        ArrayList<categories> list = new ArrayList<>();

        try {

            String q = "select * from categories";
            Statement st = this.conn.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                categories c = new categories(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(posts post) {
        boolean saved = false;
        try {
            String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            pstmt.setString(1, post.getpTitle());
            pstmt.setString(2, post.getpContent());
            pstmt.setString(3, post.getpCode());
            pstmt.setString(4, post.getpPic());
            pstmt.setInt(5, post.getCatId());
            pstmt.setInt(6, post.getUserId());

            pstmt.executeUpdate();
        } catch (Exception e3) {
            e3.printStackTrace();
        }

        return true;
    }

    //    get all the posts
    public List<posts> getAllPosts() {

        List<posts> allPosts = new ArrayList<>();
        try {
            String query = "select * from posts order by pid desc";
            PreparedStatement pstmt = this.conn.prepareStatement(query);
            ResultSet set = pstmt.executeQuery();

            while (set.next()) {

                int pId = set.getInt("pid");
                String postTitle = set.getString("pTitle");
                String postContent = set.getString("pContent");
                String postCode = set.getString("pCode");
                String postPic = set.getString("pPic");
                Timestamp postDate = set.getTimestamp("pDate");
                int categId = set.getInt("catId");
                int useId = set.getInt("userId");

                posts post = new posts(pId, postTitle, postContent, postCode, postPic, postDate, categId, useId);
                allPosts.add(post);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return allPosts;
    }

//    fetching post using post id
    public posts getPostById(int postId) {

        posts p = null;
        try {

            String query = "select * from posts where pid=?";
            PreparedStatement pst = this.conn.prepareStatement(query);
            pst.setInt(1, postId);
            ResultSet set = pst.executeQuery();
            if (set.next()) {

                int pId = set.getInt("pid");
                String postTitle = set.getString("pTitle");
                String postContent = set.getString("pContent");
                String postCode = set.getString("pCode");
                String postPic = set.getString("pPic");
                Timestamp postDate = set.getTimestamp("pDate");
                int categId = set.getInt("catId");
                int useId = set.getInt("userId");

                p = new posts(pId, postTitle, postContent, postCode, postPic, postDate, categId, useId);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }
        return  p;
    }
}
