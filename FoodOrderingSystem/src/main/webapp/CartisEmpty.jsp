<!DOCTYPE html>
<html>
<head>
    <title>Empty Cart</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #444;
            padding: 20px;
        }

        h1 {
            justify-content: center;
            align-items: center;
            position: relative;
            top: 10px;
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
        }

        .container {
            position: relative;
            top: 50px;
            width: 100%;
            max-width: 650px;
            height: 420px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 5px 5px rgba(0, 0, 0, 0.1);
        }

        p {
            text-align: center;
            position: relative;
            top: 65px;
            margin-bottom: 20px;
        }

        .cart-icon {
            display: block;
            width: 100px;
            height: 100px;
            margin: 0 auto 20px;
        }
        img{
            display: flex;
            justify-content: center;
            height: 200px;
            width: 250px;
            position: relative;
            right: 70px;
            bottom: 10px;

        }

        .btn {
            display: inline-block;
            position: relative;
            top: 65px;
            padding: 10px 20px;
            background-color: #000000;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #d57412;
        }

        /* Responsive styles */
        @media (max-width: 600px) {
            .container {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Your Cart is Empty</h1>
        <div class="cart-icon">
            <img src="EmptyIcon.jpeg" alt="Empty Cart">
        </div>
        <p>Add some items to your cart and start shopping!</p>
        <div style="text-align: center;">
            <a class="btn" href="FOS_menu.jsp">Continue Shopping</a>
        </div>
    </div>
</body>
</html>
