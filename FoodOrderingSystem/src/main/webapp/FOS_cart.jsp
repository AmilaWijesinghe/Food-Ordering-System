<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="utilities.Cart"%>
    <%@page import="entities.CartItem"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/cart-style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-4">
					<h2 class="heading-section">Cart</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table">
						  <thead class="thead-primary">
						    <tr>
						    	<th>&nbsp;</th>
						    	<th>&nbsp;</th>
						      <th>Product</th>
						      <th>Price</th>
						      <th>Quantity</th>
						      <th>total</th>
						      <th>&nbsp;</th>
						    </tr>
						  </thead>
						  <tbody>
						   <% for (CartItem item : Cart.getItems()) { %>
						   
						    <tr class="alert" role="alert">
						    	<td>
						    		<label class="checkbox-wrap checkbox-primary">
										  <input type="checkbox">
										  <span class="checkmark"></span>
										</label>
						    	</td>
						    	<td>
						    		<div class="img" style="background-image: url(f1.png);"></div>
						    	</td>
						      <td>
						      	<div class="email">
						      		<span><%=item.getItemName() %> </span>
						      		
						      	</div>
						      </td>
						      <td><%=item.getPrice() %></td>
						      <td class="quantity">
					        	<div class="input-group">
				             	<input type="text" name="quantity" class="quantity form-control input-number" value="1" min="1" max="100" data-price="44.99" >
				          	</div>
				          </td>
				          <td class="total-price">$44.99</td>
						      <td>
						      	<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				            	<span aria-hidden="true"><i class="fa fa-close"></i></span>
				          	</button>
				        	</td>
						    </tr>
						    <% } %>
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
	<script>
		$(document).ready(function() {
  // Listen for changes to quantity inputs
  $('.quantity input').on('input', function() {
    // Get the price of the item
    var price = parseFloat($(this).data('price'));

    // Get the new quantity
    var quantity = parseInt($(this).val());

    // Calculate the new total price
    var totalPrice = price * quantity;

    // Update the total price column
    $(this).closest('tr').find('.total-price').html('$' + totalPrice.toFixed(2));
  });
});

	</script>
	
</body>
</html>