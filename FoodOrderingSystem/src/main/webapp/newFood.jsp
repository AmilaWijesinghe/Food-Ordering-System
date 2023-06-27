<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dao.foodItemDAO" %>
<%@page import="entities.foodItems" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>

body {
		background-color:#fff;

	font-family: 'Varela Round', sans-serif; */
	
	
}
.table-responsive {
    margin: 30px 0;
    overflow-x: auto;
    
}
.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	min-width: 1000px;
	box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {        
	padding-bottom: 15px;
	background: black;
	color: #fff;
	padding: 16px 30px;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}
.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}
.table-title .btn-group {
	float: right;
}
.table-title .btn {
	background-color: #ffbe33;
	color:white;
	float: right;
	font-size: 13px;
	border: none;
	min-width: 50px;
	/* border-radius: 2px; */
	border: none;
	outline: none !important;
	margin-left: 10px;
}
.table-title .btn i {
	float: left;
	font-size: 21px;
	margin-right: 5px;
}
.table-title .btn span {
	float: left;
	margin-top: 2px;
}
table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	vertical-align: middle;
}
table.table tr th:first-child {
	width: 60px;
}
table.table tr th:last-child {
	width: 100px;
}
table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}
table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}
table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}	
table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}
table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}
table.table td a:hover {
	color: #2196F3;
}
 table.table td a.edit { 
 	color: #FFC107; 
 } */
 table.table td a.delete { 
 	color: #F44336; 
 } */
table.table td i {
	font-size: 19px;
}
table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}
.pagination {
	float: right;
	margin: 0 0 5px;
}
.pagination li a {
	border: none;
	font-size: 13px;
	min-width: 30px;
	min-height: 30px;
	color: #999;
	margin: 0 2px;
	line-height: 30px;
	border-radius: 2px !important;
	text-align: center;
	padding: 0 6px;
}
.pagination li a:hover {
	color: #666;
}	
.pagination li.active a, .pagination li.active a.page-link {
	background: #03A9F4;
}
.pagination li.active a:hover {        
	background: #0397d6;
}
.pagination li.disabled i {
	color: #ccc;
}
.pagination li i {
	font-size: 16px;
	padding-top: 6px
}
.hint-text {
	float: left;
	margin-top: 10px;
	font-size: 13px;
}    
/* Custom checkbox */
.custom-checkbox {
	position: relative;
}
.custom-checkbox input[type="checkbox"] {    
	opacity: 0;
	position: absolute;
	margin: 5px 0 0 3px;
	z-index: 9;
}
.custom-checkbox label:before{
	width: 18px;
	height: 18px;
}
.custom-checkbox label:before {
	content: '';
	margin-right: 10px;
	display: inline-block;
	vertical-align: text-top;
	background: white;
	border: 1px solid #bbb;
	border-radius: 2px;
	box-sizing: border-box;
	z-index: 2;
}
.custom-checkbox input[type="checkbox"]:checked + label:after {
	content: '';
	position: absolute;
	left: 6px;
	top: 3px;
	width: 6px;
	height: 11px;
	border: solid #000;
	border-width: 0 3px 3px 0;
	transform: inherit;
	z-index: 3;
	transform: rotateZ(45deg);
}
.custom-checkbox input[type="checkbox"]:checked + label:before {
	border-color: #03A9F4;
	background: #03A9F4;
}
.custom-checkbox input[type="checkbox"]:checked + label:after {
	border-color: #fff;
}
.custom-checkbox input[type="checkbox"]:disabled + label:before {
	color: #b8b8b8;
	cursor: auto;
	box-shadow: none;
	background: #ddd;
}
/* Modal styles */
.modal .modal-dialog {
	max-width: 500px;
}
.modal .modal-header, .modal .modal-body, .modal .modal-footer {
	padding: 20px 30px;
}
.modal .modal-content {
	border-radius: 3px;
	font-size: 14px;
}
.modal .modal-footer {
	background: #ecf0f1;
	border-radius: 0 0 3px 3px;
}
.modal .modal-title {
	display: inline-block;
}
.modal .form-control {
	border-radius: 2px;
	box-shadow: none;
	border-color: #dddddd;
}
.modal textarea.form-control {
	resize: vertical;
}
.modal .btn {
	/* border-radius: 2px; */
	min-width: 100px;
	background-color: black;
	color: white;


}	
.modal form label {
	font-weight: normal;
}
.edit-btn, .delete-btn {
    background-color: #ffbe33; /* Green */
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 5px;
  }
  
  .edit-btn:hover, .delete-btn:hover {
    background-color: #A52A2A;
  }
  
  .edit-btn:active, .delete-btn:active {
    background-color: #A52A2A;
    transform: translateY(1px);
  }
   /* Style the select element */
select {
  padding: 8px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-shadow: none;
  background-color: #fff;
  width: 100%;
  max-width: 400px;
  margin-bottom: 16px;
}

/* Style the options */
option {
  padding: 8px;
  font-size: 16px;
}
body {
  align-items: center;
  background-color: #FFFFFF ;
  display: flex;
  justify-content: center;
  height: 100vh;
}

.form {
  background-color: #FFFFFF;
  box-sizing: border-box;
  height: 850px;
  padding: 30px;
  width: 500px;
  border: 2px solid black; /* Adds a 1px solid black border */
  
}

.title {
  color: #000000;
  font-family: sans-serif;
  font-size: 36px;
  font-weight: 600;
  margin-top: 20px;
}

.subtitle {
  color: #000000;
  font-family: sans-serif;
  font-size: 16px;
  font-weight: 600;
  margin-top: 10px;
}

.input-container {
  height: 50px;
  position: relative;
  width: 100%;
  
}

.ic1 {
  margin-top: 40px;
}

.ic2 {
  margin-top: 30px;
}

.input {
  background-color: #FFFFFF;
  border-radius: 12px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  font-size: 18px;
  height: 100%;
  outline: 0;
  padding: 4px 20px 0;
  width: 100%;
}

.cut {
  background-color: #FFFFFF;
  border-radius: 10px;
  height: 20px;
  left: 20px;
  position: absolute;
  top: -20px;
  transform: translateY(0);
  transition: transform 200ms;
  width: 76px;
}

.cut-short {
  width: 50px;
}

.input:focus ~ .cut,
.input:not(:placeholder-shown) ~ .cut {
  transform: translateY(8px);
}

.placeholder {
  color: #000000;
  font-family: sans-serif;
  left: 20px;
  line-height: 14px;
  pointer-events: none;
  position: absolute;
  transform-origin: 0 50%;
  transition: transform 200ms, color 200ms;
  top: 20px;
}

.input:focus ~ .placeholder,
.input:not(:placeholder-shown) ~ .placeholder {
  transform: translateY(-30px) translateX(10px) scale(0.75);
}
.select:focus ~ .placeholder,
.select:not(:placeholder-shown) ~ .placeholder {
  transform: translateY(-30px) translateX(10px) scale(0.75);
}

.input:not(:placeholder-shown) ~ .placeholder {
  color: #808097;
}

.input:focus ~ .placeholder {
  color: #dc2f55;
}

.submit {
  background-color: #ffbe33;
  border-radius: 12px;
  border: 0;
  box-sizing: border-box;
  color: #eee;
  cursor: pointer;
  font-size: 18px;
  height: 50px;
  margin-top: 38px;
  outline: 0;
  text-align: center;
  width: 100%;
  transition: background-color 0.3s, transform 0.3s;
}
.submit:hover {
  background-color: #ffa500;
  transform: scale(1.05);
}
.submit:active {
  background-color: #06b;
}
.input {
border: 1px solid black; 
  padding: 5px;
  appearance: none;
  background-color: #FFFFFF;
  border-radius: 12px;
 
  box-sizing: border-box;
  color: #000000;
  font-size: 18px;
  height: 100%;
  outline: 0;
  padding: 4px 20px 0;
  width: 100%;
  position: relative;
}

.select:focus {
  outline: none;
}

.select-arrow {
  width: 12px;
  height: 12px;
  position: absolute;
  top: 50%;
  right: 20px;
  transform: translateY(-50%);
  pointer-events: none;
}

.select-placeholder {
  color: #65657b;
  font-family: sans-serif;
  line-height: 14px;
  pointer-events: none;
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  left: 20px;
  transition: transform 200ms, color 200ms;
  transform-origin: 0 50%;
}

.select:focus ~ .select-placeholder,
.select:not(:placeholder-shown) ~ .select-placeholder {
  transform: translateY(-30px) translateX(10px) scale(0.75);
}

.select:not(:placeholder-shown) ~ .select-placeholder {
  color: #808097;
}

.select:focus ~ .select-placeholder {
  color: #dc2f55;
}

   
</style>
<script>
$(document).ready(function(){
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();
	
	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});
</script>
</head>
<body>
<div class="container-xl">
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2><b>Manage</b>  <b>Food</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Food</span></a>
												
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
    <thead>
        <tr>
            <th></th>
            <th>Food Name</th>
            <th>Food price</th>
            <th>Food qty</th>
            <th>Food Description</th>
            <th>Image path</th>
            <th>Category</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <% ArrayList<foodItems> foodList=new foodItemDAO().getAll();
            for(foodItems element : foodList){ %>
                <tr>
                    <td><%=element.getId()%></td>
                    <td><%=element.getFname()%></td>
                    <td><%=element.getFprice()%></td>
                    <td><%=element.getFquantity() %></td>
                    <td><%=element.getDescription()%></td>
                    <td><%=element.getImgpath() %></td>
                    <td><%=element.getCategory()%></td>
                    <td>
                        <a href="updateFood.jsp?id=<%=element.getId()%>">
                            <button class="edit-btn btn btn1">EDIT</button>
                        </a>&nbsp; &nbsp;
                        <a href="deleteFood.jsp?id=<%=element.getId()%>">
                            <button class="delete-btn btn btn2">DELETE</button>
                        </a>
                    </td>
                </tr>
            <% } %>
    </tbody>
</table>
					
			
	 </div>        
</div> 




<!-- Add Modal HTML -->
<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form action="addFood" method="post">
			    <div class="form">
      <div class="title">Add new food item</div>
      <div class="subtitle">Enter the details here and submit</div>
      <div class="input-container ic1">
        <input  class="input" type="text" placeholder=" " name="fname" id="fname" required>
        <div class="cut"></div>
        <label for="food_name" class="placeholder">Enter Food name</label>
      </div>
      <div class="input-container ic2">
        <input  class="input" type="text" placeholder=" " name="fprice" id="fprice" required >
        <div class="cut"></div>
        <label for="food_price" class="placeholder">Enter Food Price</label>
      </div>
      <div class="input-container ic2">
        <input  class="input" type="text" placeholder=" " name="fquantity" id="fquantity" required>
        <div class="cut"></div>
        <label for="food_qty" class="placeholder">Enter Food Quantity</label>
      </div>
      <div class="input-container ic2">
        <input  class="input" type="text" placeholder=" " name="description" id="description" required>
        <div class="cut"></div>
        <label for="food_description" class="placeholder">Enter Food Description</label>
      </div>
      <div class="input-container ic2">
        <input  class="input" type="text" placeholder=" " name="imgpath" id="imgpath" required>
        <div class="cut"></div>
        <label for="food_imagepath" class="placeholder">Enter Image Path</label>
      </div>
     <div class="input-container ic2">
  <select class="input" name="category" id="category" required>
    <option value="Select a category" disabled selected class="select-placeholder">Select a category</option>
    <option value="Burger" >Burger</option>
    <option value="Pizza">Pizza </option>
    <option value="Pasta" >Pasta</option>
    <option value="Fries" >Fries</option>
  </select>
  <div class="cut"></div>
  <label for="category" class="placeholder">Category</label>
</div>

  
      <button type="submit" class="submit">submit</button>
         <button type="button" class="submit" onclick="window.location.href='newFood.jsp'">Cancel</button>
    </div>
				</form>
				</div>
				</div>
				</div>
				</div>
			
 </body>
 </html>