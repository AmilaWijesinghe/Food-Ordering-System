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
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// Retrieve cart from session
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        // Calculate total price
        double totalPrice = (cart != null) ? cart.getTotalPrice() : 0.0;

        // Set cart and total price as request attributes
        request.setAttribute("cart", cart);
        request.setAttribute("totalPrice", totalPrice);

        // Forward to cart page
        request.getRequestDispatcher("/WEB-INF/views/cart.jsp").forward(request, response);
    
	}

}
