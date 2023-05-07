<%-- 
    Document   : ViewCart
    Created on : Mar 4, 2023, 9:45:08 AM
    Author     : Jio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="sample.shopping.Product"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart page</title>
        <c:set var="cart" value="${sessionScope.CART}"></c:set>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

        </head>
        <style>

            body{
                background-image: url(image/t2.png);
            }

            body {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }
            input{
                border: 0;
                border-radius: 0;
            }
            a{
                text-decoration: none;
                margin-top: 20px;
            }

            table{
                margin-top:20px ;
                border-radius: 10px;
                text-align: center;
            }

            table input {
                border: 0;
                border-radius: 5px;
            }

            h5{
                color: aqua;
                font-family: fantasy;
                text-align: center;
                justify-content: center;
                align-items: center;
                padding: 50px 0;
                margin: 0 280px;
                font-size: 30px;
            }

        </style>
        <body class="position-absolute top-20 start-50 translate-middle-x">
            <h1 class="text-danger">Your selected products</h1>

        <c:if test="${cart != null}" >

            <table border="1" class="table-bordered">
                <thead>
                    <tr>
                        <th class="text-info">NO</th>
                        <th class="text-info">ID</th>
                        <th class="text-info">NAME</th>
                        <th class="text-info">PRICE</th>
                        <th class="text-info">QUANTITY</th>
                        <th class="text-info">TOTAL</th>
                        <th class="text-info">EDIT</th>
                        <th class="text-info">REMOVE</th>

                    </tr>
                </thead>
                <tbody>

                    <c:forEach var="pro" items="${cart.cart.values()}" varStatus="count">

                        <c:set var="total" value="${total + pro.price * pro.quantity}"></c:set>
                        <form action="MainController" method="post">

                            <tr>
                                <td>${count.count}</td>
                            <td> <input type="text" name="id" value="${pro.id}" readonly="" </td>
                            <td>${pro.name}</td>
                            <td>${pro.price}</td>
                            <td> <input type="number" name="quantity" value="${pro.quantity}" min="0" max="${pro.getQuantity(pro.id)}" </td>
                            <td>${pro.price * pro.quantity}</td>
                            <td><input type="submit" name="action" value="Edit"</td>
                            <td><input type="submit" name="action" value="Remove"</td>
                        </tr>
                    </form>
                </c:forEach>

            </tbody>
        </table>
        <h1 class="text-primary">TOTAL =  ${total}</h1>

    </c:if>
    <a class="btn btn-secondary" href="MainController?action=History"> History</a>
    <a class="btn btn-outline-primary" href="MainController?action=Home"> Home</a>
    <a class="btn btn-info" href="shopping.jsp"> Add more</a>
    <a class="btn btn-success" href="MainController?action=CheckOut"> Check Out</a>   
    <div>
        <h5> ${requestScope.MESSAGE} </h5>
    </div>
</body>
</html>
