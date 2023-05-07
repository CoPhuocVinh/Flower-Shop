<%-- 
    Document   : createUser
    Created on : Feb 25, 2023, 10:58:22 AM
    Author     : Jio
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create user</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src='https://www.google.com/recaptcha/api.js' async defer ></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <style>

            body{
                 background-image:  url(image/t2.png);
            }

            .container{
                background-color: #D9AFD9; 
                background-image: linear-gradient(0deg, #D9AFD9 0%, #97D9E1 100%);
                /*                background: white;*/
                /*padding: 10px 30px;*/
                box-shadow: 5px 5px 10px black;            
                border-radius: 10px;

            }
            h3{
                text-align: center;
            }


            body{
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin: 0 auto;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }

            .create__form{
                display: flex;
                flex-direction: column;
                justify-content: center;
                font-size: 16px;
            }

            .create__form input{
                padding: 5px 20px 5px 2px;
            }
            .btn {
                cursor: pointer;
            }

            .message {
                color: red;
            }
            a{
                margin-bottom: 10px;
            }
            .footer{
                padding: 0px 300px 0px 350px;
                color: white;
                margin: 0;
                height: 35px;    
            }

        </style>

    </head>
    <body>
        <div class="container">
            <h3>User Information</h3>
            <%
                UserError userError = (UserError) request.getAttribute("USER_ERROR");
                if (userError == null) {
                    userError = new UserError();
                }
                String error = (String) request.getAttribute("Error");
                if (error == null) {
                    error = "";
                }

            %>
            <form class="create__form" action="MainController" method="POST">
                <label for="userID">UserID</label>
                <input class="form-control" type="text" name="userID" required="" /> 
                <div class="message">${requestScope.USER_ERROR.userIDError}</div><br/>


                <label for="fullName">Full Name</label>
                <input class="form-control" type="text" name="fullName" required="" /> 
                <div class="message">${requestScope.USER_ERROR.fullNameError}</div><br/>

                <label for="roleID">Role ID </label> 
                <input class="form-control" type="text" name="roleID" value="US" readonly="" /> <br/>

                <label for="password">Password</label>
                <input class="form-control" type="password" name="password" required="" /> <br/>

                <label for="confirm">Confirm Password</label> 
                <input class="form-control" type="password" name="Confirm" required="" /> 
                <div class="message">${requestScope.USER_ERROR.confirmError}</div><br/>

                <div class="g-recaptcha" data-sitekey="6Ld9bgYlAAAAAOFhorvrim6WcGanE3Q_-Kr_oeQH"></div>
                <div id="error"> </div><br>

                <input type="hidden" name="action" value="Create" />
                <input class="btn btn-primary" type="submit" name="action" value="Create" /> <br>
                <a  class="btn btn-outline-secondary" href="login.html">Login</a>
            </form>

            <h1 class="footer">  </br> </h1>    
            <div class="message">${requestScope.ERROR}</div>
        </div>
        <script>
            window.onload = function () {
                //let isValid = false;
                const form = document.getElementById("form");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    event.preventDefault();
                    const response = grecaptcha.getResponse();
                    if (response) {
                        form.submit();
                    } else {
                        error.innerHTML = "Please check";
                    }
                });
            }
        </script>
    </body>
</html>
