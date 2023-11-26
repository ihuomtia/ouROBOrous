package edu.inpt.ouroborous.Servlets;

import edu.inpt.ouroborous.CartDAOImpl;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/cart_action")
public class CartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			String userId = (String) session.getAttribute("user_id");

			if (userId != null) {
				String action = request.getParameter("add");
				if (action != null) {
					System.out.println("Adding product to cart --------------");
					addToCart(userId, action);
				}
				
				action = request.getParameter("remove");
				if (action != null) {
					removeFromCart(userId, action);
				}
				
				response.sendRedirect("/ouROBOrous/products.jsp");
			} else {
				response.sendRedirect("/ouROBOrous/login");
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void addToCart(String userId, String productId) {
		CartDAOImpl cartDAO = new CartDAOImpl();
		cartDAO.addToCart(userId, productId, 1); // TODO
	}

	private void removeFromCart(String userId, String productId) {
		CartDAOImpl cartDAO = new CartDAOImpl();
		cartDAO.removeFromCart(userId, productId, 999999);
	}
}
