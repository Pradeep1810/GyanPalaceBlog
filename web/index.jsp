<%-- 
    Document   : index
    Created on : 01-Sep-2021, 1:28:19 am
    Author     : Pradeep
--%>

<%@page import="com.myblog.helper.DatabaseConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!--css-->
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

        <%@include file="navBar.jsp" %>
        <div class="container-fluid p-0 m-0 ">
            <div class="jumbotron background-blue text-white banner-bg">
                <div class="container">
                    <h2>Welcome to Gyan Palace</h2>
                    <p class="lead">We try to bring authentic , real and unique wisdom to you</p>
                    <a href="signup.jsp" type="button" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Register</a>
                    <a href="Login_Page.jsp" type="button" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o "></span> Log In</a>
                </div>
            </div>
        </div>
        <br>
        <!--cards-->
        <div class ="container">

            <div class ="row mb-3 ">

                <div class ="col-md-4">

                    <div class="card" >

                        <img class="card-img-top" src="https://source.unsplash.com/1600x900/?elon,musk,spacex" alt="Elon Musk">
                        <div class="card-body">
                            <h5 class="card-title">10 Facts about Elon Musk</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-danger text-white">Go somewhere</a>
                        </div>
                    </div>

                </div>

                <div class ="col-md-4">

                    <div class="card" >

                        <img class="card-img-top" src="https://source.unsplash.com/1600x900/?india,history" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">10 Historical Places in Bharat</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-danger text-white">Go somewhere</a>
                        </div>
                    </div>

                </div>

                <div class ="col-md-4">

                    <div class="card" >

                        <img class="card-img-top" src="https://source.unsplash.com/1600x900/?mahabharata,krishna" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">10 Things about Mahabharat</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-danger text-white">Go somewhere</a>
                        </div>
                    </div>

                </div>

            </div>

            <div class ="row mb-3">

                <div class ="col-md-4">

                    <div class="card" >

                        <img class="card-img-top" src="https://source.unsplash.com/1600x900/?youth,money,stress" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">10 Mistakes to avoid when young</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-danger text-white">Go somewhere</a>
                        </div>
                    </div>

                </div>

                <div class ="col-md-4">

                    <div class="card" >

                        <img class="card-img-top" src="https://source.unsplash.com/1600x900/?physics,science,theory,simulation" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">10 Mind Bending Science theories</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-danger text-white">Go somewhere</a>
                        </div>
                    </div>

                </div>

                <div class ="col-md-4">

                    <div class="card" >

                        <img class="card-img-top" src="https://source.unsplash.com/1600x900/?india,ayurveda,yoga,meditation,sages" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">10 Things World should Thank Bharat for</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-danger text-white">Go somewhere</a>
                        </div>
                    </div>

                </div>

            </div>

           
        </div>














        <!--java-script-->
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>




    </body>
</html>
