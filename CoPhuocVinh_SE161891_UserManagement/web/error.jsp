<%-- 
    Document   : error
    Created on : Feb 8, 2023, 11:25:33 AM
    Author     : Jio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    </head>
    <body>
        <h1>co loi r ne: </h1>
        <div class="spinner-border"></div>
 
        ${requestScope.ERROR}
    </body>
</html>
