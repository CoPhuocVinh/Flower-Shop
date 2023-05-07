<%-- 
    Document   : History
    Created on : Mar 17, 2023, 10:10:54 PM
    Author     : Jio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/createUserStyle.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>


        <title>History Page</title>
        <style>
            table{
                margin-top:20px ;
                border-radius: 10px;
                text-align: center;
            }

            table input {
                border: 0;
                border-radius: 5px;
            }
            body{
                background-image: url(image/t2.png);
            }

            body{
                min-width: 1100px;
            }
        </style>
    </head>
    <body class="position-absolute top-0 start-50 translate-middle-x">

        <h1 style="text-align: center"> ${sessionScope.LOGIN_USER.fullname}</h1>

        <h5 style="text-align: center; color: #fa5230;" >History Buy Check</h5>

        <table border="1" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>BILL ID</th>
                    <th>FLOWER ID</th>
                    <th>QUANTITY</th>
                    <th>FLOWER PRICE</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bill" varStatus="counter" items="${sessionScope.ListBill}">
                    <tr>
                        <td>${counter.count}</td>
                        <td>${bill.billID}</td>
                        <td>${bill.flowerID}</td>
                        <td>${bill.quantity}</td>
                        <td>${bill.flowerPrice}</td>
                    </tr>
                </c:forEach>
            </tbody>



        </table>
        <a class="btn btn-outline-dark" href="shopping.jsp" >Back to Shop</a>
        <a class="btn btn-outline-dark" href="MainController?action=Home" >Home</a>
    </body>
</html>
