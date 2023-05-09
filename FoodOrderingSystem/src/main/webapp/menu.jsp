<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="product-card">
        <div class="product-image">
          <img src="{{product_image}}" alt="{{product_name}}">
        </div>
        <div class="product-info">
          <h2 class="product-name">{{product_name}}</h2>
          <p class="product-description">{{product_description}}</p>
          <p class="product-price">{{product_price}}</p>
        </div>
      </div>
</body>
</html>