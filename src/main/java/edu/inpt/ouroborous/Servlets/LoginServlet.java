package edu.inpt.ouroborous.Servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import edu.inpt.ouroborous.User;
import edu.inpt.ouroborous.UserDAOImpl;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("session", session);

		if (session.getAttribute("loggedIn") == null) {
			response.sendRedirect("login.jsp");
		} else if (session.getAttribute("loggedIn").equals("admin")) {
			response.sendRedirect("admin.jsp");
		} else if (!session.getAttribute("loggedIn").equals("user")) {
			response.sendRedirect("products.jsp");
		} else {
			response.sendRedirect("products.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));

		System.out.println(request.getParameter("password"));

		user = UserDAOImpl.login(user);

		if (user.isValid()) {
			HttpSession session = request.getSession();
			if (user.getEmail().equals("admin@ouroborous.com")) {
				session.setAttribute("loggedIn", "admin");
			} else {
				session.setAttribute("loggedIn", "user");
			}
			session.setAttribute("user_id", user.getId());
			response.sendRedirect("products.jsp");
		} else {
			response.sendRedirect("login.jsp?failed");
		}
	}

}
