<%-- 
    Document   : admin
    Created on : Feb 8, 2023, 11:28:29 AM
    Author     : Jio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="css/styleadmin.css" />
        <title> Admin Page</title>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"
        ></script>

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


            a {
                text-decoration: none;
                color: red;
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

            .search__input{
                padding-bottom: 10px;
            }

            .shopping{
                color: red;
            }

        </style>

    </head>
    <body class="position-absolute top-20 start-50 translate-middle-x">
<!--        <h1>Hello Admin! - <%= request.getAttribute("loginUser")%></h1>-->
         <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
        Welcome: <h1> ${sessionScope.LOGIN_USER.fullname} </h1>


        <form class="form-label"  action="MainController">
            <label class="form-label" for="search">Search</label> 
            <input class="search__input" type="text" id="search" name="search" value="${param.search}"   />
            <input class="btn btn-primary"  type="submit" name="action" value="Search" />

        </form>

        <form action="MainController">
            <input class="logout btn btn-outline-primary" type="submit" name="action" value="History"/>

            <input class="shopping btn btn-outline-primary" type="submit" name="action" value="shopping"/>

            <input class="logout btn btn-outline-primary" type="submit" name="action" value="Logout"/>
            
            <input class="shopping btn btn-outline-primary" type="submit" name="action" value="List product"/>

        </form>

        <c:if test="${requestScope.LIST_USER != null}">
            <c:if test="${not empty requestScope.LIST_USER}">
                <table border="1" class="table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>User ID</th>
                            <th>Full name</th>
                            <th>Role ID</th>
                            <th>Password</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USER}">

                        <form action="MainController" method="POST">
                            <tr>
                                <td>${counter.count}</td>
                                <td>
                                    <input type="text" name="userID" value="${user.userID}" readonly=""/>
                                </td>
                                <td>
                                    <input type="text" name="fullName" value="${user.fullname}" required=""/>
                                </td>
                                <td>
                                    <input type="text" name="roleID" value="${user.roleID}" required=""/>
                                </td>
                                <td>
                                    ${user.password}
                                </td>
                                <td>
                                    <input 
                                        class="update__btn btn btn-outline-primary" 
                                        type="submit" 
                                        name="action" 
                                        value="Update"
                                        />
                                    <input type="hidden" name="search" value="${param.search}"/>

                                </td>
                                <td>
                                    <c:url var="deleteLink" value="MainController">
                                        <c:param name="action" value="Delete"></c:param>
                                        <c:param name="userID" value="${user.userID}"></c:param>
                                        <c:param name="search" value="${param.search}"></c:param>
                                    </c:url>
                                    <a class="btn btn-outline-danger" href="${deleteLink}">Delete</a>
                                </td>
                            </tr>
                        </form>

                    </c:forEach>

                </tbody>
            </table>
            ${requestScope.ERROR} 
        </c:if>
    </c:if>




</body>
</html>
