package sevlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utilities.Cart;

/**
 * Servlet implementation class UpdateQuantityServlet
 */
@WebServlet("/UpdateQuantityServlet")
public class UpdateQuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String itemId = request.getParameter("itemId");
		 String qty = request.getParameter("qty");
		 int quantity = Integer.parseInt(qty);
		 
		    HttpSession session = request.getSession();  
		    Cart cart = (Cart) session.getAttribute("cart");

		    // Update item quantity in cart
		    if (cart != null) {
		        cart.updateQuantity(itemId, quantity);
		    }
		   
		    cart.getTotalPrice();

		    // Redirect to cart page
		    response.sendRedirect("FOS_cart.jsp");
	}

}
