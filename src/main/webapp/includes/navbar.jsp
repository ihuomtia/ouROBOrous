<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="edu.inpt.ouroborous.DBSingletonConnection"%>
<%@ page import="edu.inpt.ouroborous.UserDAOImpl"%>
<%@ page import="edu.inpt.ouroborous.CartDAOImpl"%>
<%@ page import="edu.inpt.ouroborous.Cart"%>
<%@ page import="edu.inpt.ouroborous.User"%>
<%
String currentPage = request.getRequestURI();
String activePage = "";
boolean isLoggedIn = session.getAttribute("loggedIn") != null;
String userId = null;
User user = null;
UserDAOImpl UserDAO = new UserDAOImpl();
CartDAOImpl CartDAO = new CartDAOImpl();
boolean isAdmin = false;
if (isLoggedIn) {
	userId = session.getAttribute("user_id").toString();
	user = UserDAO.getUserById(userId);
	//	isAdmin = user.isAdmin();

	// temporary solution
	isAdmin = session.getAttribute("loggedIn").equals("admin");

}

if (currentPage.contains("/ouROBOrous/products")) {
	activePage = "products";
} else if (currentPage.contains("/ouROBOrous/cart")) {
	activePage = "cart";
} else if (currentPage.endsWith("/ouROBOrous/")) {
	activePage = "home";
} else if (currentPage.contains("/ouROBOrous/orders")) {
	activePage = "orders";
}
%>
<div>
	<nav class="navbar"
		style="background-color: var(--bs-content-bg); border-bottom: var(--bs-border-width) solid var(--bs-content-border-color);">
		<div class="container-fluid flex-nowrap">
			<a class="navbar-brand" href="#">
				<h5>

					ou<mark>ROBO</mark>rous <br /> <small class="text-body-secondary">Robotics
						Store</small>

				</h5>
			</a>

			<%
			if (isLoggedIn) {
			%>

			<div class="card rounded-3">
				<div class="card-body">
					<ul class="nav nav-pills nav-fill">
						<li class="nav-item"><a
							class="nav-link <%=activePage.equals("home") ? "active" : ""%>"
							aria-current="true" href="/ouROBOrous/">Home</a></li>
						<li class="nav-item"><a
							class="nav-link <%=activePage.equals("products") ? "active" : ""%>"
							href="/ouROBOrous/products.jsp">Products</a></li>
						<%
						if (isLoggedIn && isAdmin) {
							int ordersCount = 0;
							try {
								Connection connection = DBSingletonConnection.getConnection();
								String countQuery = "SELECT COUNT(*) AS ordersCount FROM orders";

								try (PreparedStatement countStatement = connection.prepareStatement(countQuery)) {

							try (ResultSet resultSet = countStatement.executeQuery()) {
								if (resultSet.next()) {
									ordersCount = resultSet.getInt("ordersCount");
								}
							} catch (SQLException ex) {
							}
								} catch (SQLException ex) {
								}
							} catch (Exception ex) {
							}
						%>
						<li class="nav-item"><a href="/ouROBOrous/orders.jsp"
							type="button" class="nav-link"></i>Orders <span
								class="badge text-bg-primary"> <%=ordersCount%>
							</span> </a></li>
						<%
						} else {
						%>
						<li class="nav-item"><a
							class="nav-link <%=activePage.equals("cart") ? "active" : ""%>"
							href="/ouROBOrous/cart.jsp">Cart</a></li>
						<%
						}
						%>
					</ul>
				</div>
			</div>

			<%
			if (userId != null) {
				try {
					Connection connection = DBSingletonConnection.getConnection();
					String countQuery = "SELECT COUNT(*) AS cartCount FROM carts WHERE user_id = ?";

					try (PreparedStatement countStatement = connection.prepareStatement(countQuery)) {
				countStatement.setString(1, userId);

				try (ResultSet resultSet = countStatement.executeQuery()) {
					if (resultSet.next()) {
						int cartCount = resultSet.getInt("cartCount");
			%>

			<div class="d-flex">
				<%
				if (!(isLoggedIn && isAdmin)) {
				%>
				<a href="/ouROBOrous/cart.jsp" type="button"
					class="btn btn-secondary position-relative m-2"> <i
					class="fa-solid fa-cart-shopping me-1"></i> Cart <span
					class="badge position-absolute top-0 start-100 translate-middle text-bg-primary">
						<%=cartCount%>
				</span> <%
 }
 %>
				</a> <a href="/ouROBOrous/logout" class="btn btn-danger me-1 m-2">Logout</a>
			</div>

			<%
			}
			}
			} catch (SQLException e) {
			e.printStackTrace();
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			}
			} else {
			%>
			<ul class="nav nav-pills nav-fill">
				<li class="nav-item"><a
					class="nav-link <%=activePage.equals("home") ? "active" : ""%>"
					aria-current="true" href="/ouROBOrous/">Home</a></li>
				<li class="nav-item"><a
					class="nav-link <%=activePage.equals("products") ? "active" : ""%>"
					href="/ouROBOrous/products.jsp">Products</a></li>
			</ul>
			<div class="d-flex">
				<a href="/ouROBOrous/login" class="btn btn-secondary me-1">Sign
					in</a> <a href="/ouROBOrous/register" class="btn btn-primary">Sign
					up</a>
			</div>
			<%
			}
			%>

		</div>
	</nav>
</div>