<%-- 
    Document   : shopping
    Created on : Mar 1, 2023, 11:29:04 AM
    Author     : Jio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bi Flower Farm</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body{
                background-image: url(image/t2.png);
            }
            .banner{
                width: 100%;
                display: flex;
            }

            .banner img{
                width: 100%;
            }

            h1{
                color: burlywood;
                font-family: fantasy;
                text-align: center;
                justify-content: center;
                align-items: center;
                padding: 50px 0;
                margin: 0 280px;
                font-size: 45px;
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

            .row{
                justify-content: center;
                font-family: cursive;
                font-size: 25px;
            }
            .col-md-6{
                margin-top: 20px;
                text-align: center;
                box-shadow: 0px 0px 10px black;            
                border-radius: 5px;
                justify-content: center;
                align-items: center;
                padding: 20px 0;
                background-color: ghostwhite;
                width: 35%;
                margin-left: 100px;
            }
            .col-md-6 input{
                width: 25%;
            }

            #myImage{
                box-shadow: 5px 5px 10px black;            
                border-radius: 5px;
                width: 100%;
                height: 380px; 
                align-content: center;
                justify-content: center;
                align-items: center;
            }


        </style>
    </head>
    <body style="background-color: buttonface;">
        <div class="container">
            <div> 
                <h1>Welcome to Flower Store Of Bi</h1>
                <div class="banner">
                    <!--<img src="https://halotravel.vn/wp-content/uploads/2021/03/anh-bia-don-gian-1024x341.png" alt="flower" />-->
                    <img id="myImage" src="image/H1.png" alt="flower">
                </div>
            </div>
            <img src="../src/java/imate/Red_Rose.png" alt=""/>
            <form action="MainController" method="POST">
                <div class="row">
                    <div class="col-md-6">
                        <select name="cmbProduct" onchange="changeImage(this)">
                            <option value="F001-Red Rose-500-image/Red_Rose.jpg">Red Rose - 500$</option>
                            <option value="F002-Pink Orchird-600-image/pink_orchid.jpg">Pink Orchird - 600$</option>
                            <option value="F003-Tiny Blossom-40-image/tiny_blossom.jpg">Tiny Blossom - 40$</option>
                            <option value="F004-Sun Flower-1000-image/sun_flower.jpg">Sun Flower - 1000$</option>
                        </select>

                        <select name="cmbQuantity">
                            <option value="1">1 bo</option>
                            <option value="2">2 bo</option>
                            <option value="3">3 bo</option>
                            <option value="4">4 bo</option>
                            <option value="5">5 bo</option>
                            <option value="6">6 bo</option>
                            <option value="7">7 bo</option>
                            <option value="8">8 bo</option>
                            <option value="9">9 bo</option>
                            <option value="10">10 bo</option>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <input type="submit" name="action" value="Home"/>
                        <input type="submit" name="action" value="Add"/>
                        <input type="submit" name="action" value="View"/>
                    </div>
                </div>
            </form>
            <div>
                <h5> ${requestScope.MESSAGE} </h5>
            </div>
        </div>

        <script>
            function changeImage(select) {
                var image = document.getElementById("myImage");
                var selectedOption = select.options[select.selectedIndex];
                const list = selectedOption.value.split("-");
                var imageUrl = list[3];
                image.src = imageUrl;
            }

        </script>

    </body>
</html>
