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
        <title>User Page</title>
    </head>
    <body>
        <h1>User page(US role)  <%= request.getAttribute("loginUser")%></h1>
       
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.html"></c:redirect>
        </c:if>
            
        
        USER ID: ${sessionScope.LOGIN_USER.userID} <br/>
        FULL NAME : ${sessionScope.LOGIN_USER.fullname} <br/>
        ROLE ID: ${sessionScope.LOGIN_USER.roleID} <br/>
        PASSWORD : ${sessionScope.LOGIN_USER.password}
    </body>
</html>
