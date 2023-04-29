package sevlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import entities.Employee;

/**
 * Servlet implementation class UpdateSevlet
 */
@WebServlet("/employee-update")
public class UpdateSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String nic=request.getParameter("nic");
		String department=request.getParameter("department");
		String designation=request.getParameter("designation");
		
		Employee st=new Employee();
		
		st.setId(id);
		st.setName(name);
		st.setNIC(nic);
		st.setDepartment(department);
		st.setDesignation(designation);
		
		EmployeeDAO stdao=new EmployeeDAO();
		boolean result= stdao.update(st);
		if(result) {
			response.sendRedirect("employee-list.jsp");
		}else {
			response.getOutputStream().print("Something went wrong");
			response.sendRedirect("update-employee.jsp?id="+id);
		}
	}

}
