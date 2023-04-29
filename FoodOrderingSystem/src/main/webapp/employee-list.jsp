<%@page import="dao.EmployeeDAO"%>
<%@page import="entities.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1 style="background-color:blue; color:white; text-align: center;">Employee List</h1><br>
	
	
	<table class="table">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">NIC</th>
      <th scope="col">Department</th>
      <th scope="col">Designation</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    <%
			ArrayList<Employee> employeeList=new EmployeeDAO().getAll();
			for(Employee element : employeeList){
				%><tr>
					<td><%=element.getId()  %></td>
					<td><%=element.getName()  %></td>
					<td><%=element.getNIC()  %></td>
					<td><%=element.getDepartment()  %></td>
					<td><%=element.getDesignation()  %></td>
					<td>
						<a href="update-employee.jsp?id=<%=element.getId()%>"><button class="btn btn-primary">EDIT</button></a> &nbsp; &nbsp;
						<a href="delete-employee.jsp?id=<%=element.getId()%>"><button type="button" style="background-color:red" class="btn btn-primary">DELETE</button></a> 
					</td>
					</tr>
				<%
			}
		%>
  </tbody>
</table><br>
<a href="new-employee.jsp"><button type="button" class="btn btn-primary">Create new</button></a>
</div>
</body>
</html>