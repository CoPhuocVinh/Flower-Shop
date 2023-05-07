<%-- 
    Document   : login
    Created on : Feb 11, 2023, 8:45:06 AM
    Author     : Jio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login.jsp Page</title>
        <script src='https://www.google.com/recaptcha/api.js' async defer ></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
        <style>
            *{
                padding: 0;
                margin: 0;
            }
            body{
                 background-image:  url(image/t2.png);
            }

            .container{
                background-color: #D9AFD9; 
                background-image: linear-gradient(0deg, #D9AFD9 0%, #97D9E1 100%);
                /*                background: white;*/
                padding: 10px 30px;
                box-shadow: 5px 5px 10px black;            
                border-radius: 10px;

            }
            
            input{
/*                box-shadow: 5px 5px 10px black;            */
                border-radius: 7px;
            }

            .login__form{
                display: flex;
                flex-direction: column;
                justify-self: center;
                font-size: 16px;
            }


            .login__form input{
                padding: 5px 20px 5px 2px;
                margin: 0;
            }
            .login__form label{
                /*                text-align: center;*/


            }

            .btn {
                cursor: pointer;
                margin: 10px;
            }

            .tag a{
                text-decoration: none;
                text-align: center;
                background-color: #fff;
                padding: 10px;
            }

            .error {
                margin-top: 15px;
                color: red;
            }
            
        </style>
    </head>
    <body class="position-absolute top-50 start-50 translate-middle">
        <div class="container">
            <marquee>LOGIN PAGE</marquee>
            <form class="login__form" action="MainController" method="POST" id="form">
                <label for="userID">UserID</label>
                <input type="text" name="userID" required="" placeholder="UserID here" /> <br/>

                <label for="password">Password</label>
                <input type="password" name="password" required="" placeholder="Password here" /> <br/>

                <div class="g-recaptcha" data-sitekey="6Ld9bgYlAAAAAOFhorvrim6WcGanE3Q_-Kr_oeQH"></div>
                <div id="error"> </div>

                <input type="hidden" name="action" value="Login"/><br/>
                <input class="btn btn-primary" type="submit" name="action" value="Login"/><br/>

                <input type="reset" value="Reset"/>
            </form>

            <form class="login__form" action="MainController" method="POST">
                <input class="btn btn-info" type="submit" name="action" value="Login With Google"/><br/>
                <input class="btn btn-secondary" type="submit" name="action" value="shopping"/><br/>
                <input class="btn btn-outline-primary" type="submit" name="action" value="create User"/><br/>
            </form>
            <h1> </br> ${requestScope.ERROR}</h1>
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
