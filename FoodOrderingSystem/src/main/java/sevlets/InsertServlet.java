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
		String pnumber=request.getParameter("pnumber");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		//Set values to student object
		Employee st=new Employee();
		st.setName(name);
		st.setNIC(pnumber);
		st.setDepartment(email);
		st.setDesignation(password);
		
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
