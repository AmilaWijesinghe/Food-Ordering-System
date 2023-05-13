package sevlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Cart;
import dao.customerDAO;
import entities.CartItem;
import entities.customer;

@WebServlet("/Addtocart-product")
public class AddtocartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddtocartServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
    	Cart cart = (Cart) session.getAttribute("cart");
    	
    	String order_name = request.getParameter("name");
        String order_price = request.getParameter("price");
        int qty = 1;

        CartItem item = new CartItem();
        item.setOrder_name(order_name);
        item.setOrder_price(order_price);
        item.setQty(qty);
        
        cart.addItem(item);
        response.sendRedirect("FOS_menu.jsp");
    }
}
 