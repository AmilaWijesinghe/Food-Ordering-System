<%@page import="dao.EmployeeDAO"%>
<%@page import="entities.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="new-css.css">
<meta charset="UTF-8">
<title>Update Employee</title>
</head>
<body>
<%
	int id=Integer.parseInt(request.getParameter("id"));
	Employee obj=new EmployeeDAO().getEmployee(id);
%>
	<section class="form">
    <div class="mask d-flex align-items-center h-75" style="background-color: rgba(255,255,255,.6);">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-12 col-md-8 col-lg-6 col-xl-5">
            <div class="card gradient-custom" style="border-radius: 1rem;">
              <div class="card-body p-5 text-white">
				<form action="employee-update" method="post">
                <div class="my-md-5">
					<input type="hidden" name="id" value="<%=obj.getId() %>"/>
                  <div class="text-center pt-1">
                    <i class="fas fa-user-astronaut fa-3x"></i>
                    <h1 class="fw-bold my-5 text-uppercase">Update</h1>
                  </div>

                  <div class="form-outline form-white mb-4">
                  <label class="form-label" for="name">Name</label>
                    <input type="text" name="name" id="name" value="<%=obj.getName() %>" required class="form-control form-control-lg" />
                    
                  </div>
                  
                  <div class="form-outline form-white mb-4">
                  <label class="form-label" for="nic">NIC</label>
                    <input type="text" name="nic" id="nic" value="<%=obj.getNIC() %>" required class="form-control form-control-lg" />
                    
                  </div>
                  
                  <div class="form-outline form-white mb-4">
                  <label class="form-label" for="department">Department</label>
                    <input type="text" name="department" id="department" value="<%=obj.getDepartment() %>" required class="form-control form-control-lg" />
                    
                  </div>
                  
                  <div class="form-outline form-white mb-4">
                  <label class="form-label" for="name">Designation</label>
                    <input type="text" name="designation" id="designation" value="<%=obj.getDesignation() %>" required class="form-control form-control-lg" />
                  </div>

                  <div class="text-center py-5">
                    <button class="btn btn-light btn-lg btn-rounded px-5" type="submit" >Update</button>
                  </div>

                </div>
				</form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>
	
</body>
</html>