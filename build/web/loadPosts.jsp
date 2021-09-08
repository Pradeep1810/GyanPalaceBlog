<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.myblog.entities.posts"%>
<%@page import="com.myblog.helper.DatabaseConnector"%>
<%@page import="com.myblog.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class ="row">
    <%

        PostDao dao = new PostDao(DatabaseConnector.connect());
        List<posts> allPosts = new ArrayList<>();
        allPosts = dao.getAllPosts();

        for (posts p : allPosts) {
    %>

    <style>

        .test{
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2; /* number of lines to show */
            -webkit-box-orient: vertical
        }

    </style>
    <div class ="col-md-6 mt-2">

        <div class="card" >

            <img class="card-img-top" src="blog_imgs/<%= p.getpPic()%>" alt="Elon Musk">
            <div class="card-body ">
                <h5 class="card-title"><%= p.getpTitle()%></h5>
                <div class="test">
                    <p class="card-text"><%= p.getpContent()%></p>
                </div>

            </div>

            <div class="card-footer background-blue text-center">
                <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span>20</span>  </a>
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
            </div>
        </div>

    </div>




    <%
        }
    %>

</div>