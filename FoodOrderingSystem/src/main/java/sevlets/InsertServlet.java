package sevlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.EmployeeDAO;
import entities.Employee;

@WebServlet("/employee-create")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name=request.getParameter("name");
		String nic=request.getParameter("nic");
		String department=request.getParameter("department");
		String designation=request.getParameter("designation");
		
		//Set values to student object
		Employee st=new Employee();
		st.setName(name);
		st.setNIC(nic);
		st.setDepartment(department);
		st.setDesignation(designation);
		
		//Invoke  insert method in DAO class
		EmployeeDAO stdao=new EmployeeDAO();
		boolean result= stdao.insert(st);
		if(result) {
			response.sendRedirect("employee-list.jsp");
		}else {
			response.getOutputStream().print("Something went wrong");
			response.sendRedirect("new-employee.jsp");
		}
		
		
	}

}
