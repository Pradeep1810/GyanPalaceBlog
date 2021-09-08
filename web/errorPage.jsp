<%-- 
    Document   : errorPage
    Created on : 03-Sep-2021, 8:11:14 pm
    Author     : Pradeep
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
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
         <div class="container text-center">
             <img src="imgs/error_page.png" class="img-fluid" >
            <h3 class="display-3">Sorry ! Something went wrong ...</h3>
            <%= exception%>
            <a href="index.jsp" class="btn background-blue btn-lg text-white mt-3">Home </a>
        </div>
    </body>
</html>
