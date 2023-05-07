<%-- 
    Document   : user
    Created on : Feb 8, 2023, 11:27:58 AM
    Author     : Jio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

        <title>User Page</title>
        <style>
            body{
                background-image: url(image/t2.png);
            }

            body {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }
            .logout {
                right: 0;
                top: 10px;
                cursor: pointer;
            }
        </style>
    </head>
    <body class="position-absolute top-20 start-50 translate-middle-x">
    <marquee><h1>User page</h1></marquee>

    <form action="MainController">
        <input class="logout btn btn-outline-primary" type="submit" name="action" value="History"/>
        <input class="btn btn-primary" type="submit" name="action" value="shopping"/>
        <input class="logout btn btn-outline-primary" type="submit" name="action" value="Logout"/>

    </form>
    USER ID: ${sessionScope.LOGIN_USER.userID} <br/>
    FULL NAME : ${sessionScope.LOGIN_USER.fullname} <br/>
    ROLE ID: ${sessionScope.LOGIN_USER.roleID} <br/>
    PASSWORD : ${sessionScope.LOGIN_USER.password}



</body>
</html>
