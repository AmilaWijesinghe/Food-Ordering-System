<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dao.foodItemDAO"%>
<%@ page import="entities.foodItems"%>
 <!DOCTYPE html>
<html lang="en" dir="ltr">
<style>


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
   border: 1px;
}

.ic1 {
  margin-top: 40px;
}

.ic2 {
  margin-top: 30px;
}

.input {
border: 1px solid black; /* Adds a 1px solid black border to the text field */
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
 border: 1px solid black; /* Adds a 1px solid black border to the text field */
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
  <head>
    <meta charset="utf-8" />
    <title>Popup Form Design By Coding Ayush</title>
    <link rel="stylesheet" href="style.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    />
  </head>
  <body>
  <%
	int id=Integer.parseInt(request.getParameter("id"));
	foodItems obj=new foodItemDAO().getFoodItem(id);
%>
    <div class="center">
     
      <div class="container">
        
        <div class="text"></div>
        <form action="updateFood" method="post">
            <div class="form">
      <div class="title">Update food item</div>
      <div class="subtitle">Edit the details here and submit</div>
      <div class="input-container ic1">
        <input  class="input" type="text" placeholder=" " name="fname" id="fname" value="<%=obj.getFname() %>" required/>
        <div class="cut"></div>
        <label for="food_name" class="placeholder">Food name</label>
      </div>
      <div class="input-container ic2">
        <input  class="input" type="text" placeholder=" " name="fprice" id="fprice" value="<%=obj.getFprice() %>" required/>
        <div class="cut"></div>
        <label for="food_price" class="placeholder">Food Price</label>
      </div>
      <div class="input-container ic2">
        <input  class="input" type="text" placeholder=" " name="fquantity" id="fquantity" value="<%=obj.getFquantity() %>" required/>
        <div class="cut"></div>
        <label for="food_qty" class="placeholder">food quantity</label>
      </div>
      <div class="input-container ic2">
        <input  class="input" type="text" placeholder=" " name="description" id="description" value="<%=obj.getDescription() %> "required>
        <div class="cut"></div>
        <label for="food_description" class="placeholder">Description</label>
      </div>
      <div class="input-container ic2">
        <input  class="input" type="text" placeholder=" " name="imgpath" id="imgpath" value="<%=obj.getImgpath() %>" required/>
        <div class="cut"></div>
        <label for="food_imagepath" class="placeholder">Image Path</label>
      </div>
     <div class="input-container ic2">
  <select class="input" name="category" id="category" required>
    <option value="Select a category" disabled selected class="select-placeholder">Select a category</option>
    <option value="Burger" <%= obj.getCategory().equals("Burger") ? "selected" : "" %>>Burger</option>
    <option value="Pizza" <%= obj.getCategory().equals("Pizza") ? "selected" : "" %>>Pizza</option>
    <option value="Pasta" <%= obj.getCategory().equals("Pasta") ? "selected" : "" %>>Pasta</option>
    <option value="Fries" <%= obj.getCategory().equals("Fries") ? "selected" : "" %>>Fries</option>
  </select>
  <div class="cut"></div>
  <label for="category" class="placeholder">Category</label>
</div>
<input type="hidden" name="id" id="id" value="<%=obj.getId() %>">
  
      <button type="submit" class="submit">submit</button>
       <button type="button" class="submit" onclick="window.location.href='newFood.jsp'">Cancel</button>
    </div>
        </form>
      </div>
    </div>
  </body>
</html>