

<%@page import="com.myblog.entities.categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.myblog.helper.DatabaseConnector"%>
<%@page import="com.myblog.dao.PostDao"%>
<%@page import="com.myblog.entities.User"%>
<%@page errorPage="errorPage.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("Login_Page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--CSS-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--font awesome icons-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--custom css-->
        <link href="css/myStyles.css" rel="stylesheet" type="text/css"/>

        <style>
            .banner-bg{

                clip-path: polygon(50% 0%, 87% 0, 100% 0, 100% 86%, 68% 92%, 42% 100%, 21% 93%, 0 98%, 0 0, 24% 0);
            }  


        </style>
    </head>
    <body>

        <!--Navbar-->

        <nav class="navbar navbar-expand-lg navbar-dark background-blue">
            <a class="navbar-brand" href="#"><span class="fa fa-university"></span> Gyan Palace</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutUs.jsp"><span class="fa fa-id-card-o"></span> About Us</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-reorder"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">History</a>
                            <a class="dropdown-item" href="#">Science</a>
                            <a class="dropdown-item" href="#">Facts</a>

                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Santana Dharma</a>
                            <a class="dropdown-item" href="#">Book Summary</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#create-post"><span class="fa fa-pencil-square-o"></span> Create Post</a>
                    </li>


                </ul>

                <ul class="navbar-nav mr-right">


                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModal" > <span class="fa fa-user-circle "></span> <%= user.getName()%> </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Log Out</a>
                    </li>

                </ul>

            </div>
        </nav>




        <!--enc of nav bar-->

        <!--main-body-->

        <main>

            <div class="container text-center" id="loader">
                <i class="fa fa-refresh fa-4x fa-spin"></i>
                <h3 class="mt-2">Loading...</h3>
            </div>
            <div class="container"  id="post-container">


            </div>

        </main>

        <!--profile modal-->
        <!-- profile - details  -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header background-blue text-white text-center ">
                        <h3 class="modal-title w-100">Gyan Palace</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="imgs/profile.png" alt="Profile pic" class="img-fluid" style="border-radius:50%;max-width: 120px;;" >
                            <br>
                            <%= user.getName()%>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>

                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender().toUpperCase()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getRegTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--end of profile - details -->

                            <!--profile-edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>

                                <form action="EditServlet" method="post" >
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getID()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" required class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" required class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                                </textarea>

                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>   
                            </div>

                            <!--end of profile - edit -->


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="editButton">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of profile modal-->


        <!--start of create-post-modal-->

        <!-- Modal -->
        <div class="modal fade" id="create-post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header background-blue text-white text-center ">
                        <h3 class="modal-title w-100">Create Post</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form"   action="AddPostServlet" method="post" enctype=multipart/form-data>

                            <div class="form-group">
                                <select class="form-control" name="cid" >
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDao post = new PostDao(DatabaseConnector.connect());
                                        ArrayList<categories> categoriesList = post.getAllCategories();
                                        for (categories c : categoriesList) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <% }%>
                                </select>

                                <div class="form-group my-3">
                                    <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                                </div>

                                <div class="form-group">
                                    <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                                </div>
                                <div class="form-group">
                                    <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Select your image</label>
                                    <br>
                                    <input type="file" name="pic"  >
                                </div>

                                <!--                                <div class="container text-center">
                                                                    <button type="submit" class="btn btn-outline-primary">Post </button>
                                                                </div>-->
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-primary">Post </button>
                                </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end of create-post-modal-->

        <!--java-script-->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!--Profile-Edit Logic-->
        <script>

            $(document).ready(function () {

                let editStatus = false;
                $('#editButton').click(function ()
                {
                    if (editStatus === false) {

                        $('#profile-details').hide()
                        $('#profile-edit').show()
                        editStatus = true
                        $(this).text("Back")

                    } else {
                        $('#profile-details').show()
                        $('#profile-edit').hide()
                        editStatus = false
                        $(this).text("Edit")
                    }


                })


            })




        </script>

        <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "saved successfully", "success").then((value) => {
                                    window.location = "profile.jsp"
                                });
                                ;
                                ;
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error")
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

        <!--load-posts-->
        <script>

            $(document).ready(function (e) {

                $.ajax({

                    url: "loadPosts.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                    }

                });
            });

        </script>

    </body>
</html>
