<%-- 
    Document   : Select
    Created on : Mar 22, 2023, 11:10:46 AM
    Author     : Jio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    <c:if test="${requestScope.LIST_USERTOP2 != null}">
            <c:if test="${not empty requestScope.LIST_USERTOP2}">
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
                        <c:forEach var="user" varStatus="counter" items="${requestScope.LIST_USERTOP2}">

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
