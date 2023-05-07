<%-- 
    Document   : CheckOut
    Created on : Mar 17, 2023, 8:39:10 PM
    Author     : Jio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut Page</title>
        <link rel="stylesheet" href="css/createUserStyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <style>
            body{
                background-image: url(image/t2.png);
            }

            body{
                margin-top: 50px;
            }

            form{
                text-align: center;
            }
        </style>
    </head>
    <body class="position-absolute top-20 start-50 translate-middle-x">
        <h1>Thanh toan thanh cong</h1>
        <form action="MainController" method="POST">
            <input class="btn btn-info" type="submit" name="action" value="History"/>
            <a class="btn btn-outline-primary" href="shopping.jsp"> Add more</a>

            <input class="btn btn-info" type="submit" name="action" value="Home"/>

        </form>   
    </body>
</html>
