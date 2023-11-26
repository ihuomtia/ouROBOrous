<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="edu.inpt.ouroborous.DBSingletonConnection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>



<html data-bs-theme="dark" data-bs-core="modern">
<head>
<meta charset="UTF-8">
<%@include file="includes/header.jsp"%>

<title>ouROBOrous 🤖🐉</title>
</head>
<body class="">
	<%@include file="includes/navbar.jsp"%>
	<%
	if (isLoggedIn && isAdmin) {
	%>
	<div class="container mt-2">
		<div class="card">
			<div class="card-header">
				<strong>Your Cart<strong>
			</div>
			<div class="card-body">

				<table class="table align-middle table-stripped">
					<thead>
						<tr>
							<th>TimeStamp</th>
							<th>User</th>
							<th>Email</th>
							<th># Products</th>
							<th>Price</th>
							<th>Status</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
						Connection connection = DBSingletonConnection.getConnection();

						String ordersQuery = "SELECT * FROM orders";
						ResultSet ordersResult = connection.createStatement().executeQuery(ordersQuery);
						while (ordersResult.next()) {
							String timestamp = ordersResult.getString("order_date");
							String orderUserId = ordersResult.getString("user_id");
							String username = null;
							String email = null;

							User orderUser = UserDAO.getUserById(orderUserId);
							String cartQuery = "SELECT * FROM carts WHERE user_id = '" + orderUserId + "'";
							ResultSet cartResult = connection.createStatement().executeQuery(cartQuery);
							double totalCost = 0.0;
							int numProducts = 0;

							username = orderUser.getFirstName() + " " + orderUser.getLastName();
							email = orderUser.getEmail();

							while (cartResult.next()) {
								String productId = cartResult.getString("product_id");
								String productQuery = "SELECT * FROM products WHERE product_id = '" + productId + "'";
								ResultSet productResult = connection.createStatement().executeQuery(productQuery);

								if (productResult.next()) {
							String productName = productResult.getString("product_name");
							double productPrice = productResult.getDouble("price");
							totalCost += productPrice;
							numProducts++;
								}
							}
						%>

						<tr>
							<td><%=timestamp%></td>
							<td><%=username%></td>
							<td><%=email%></td>
							<td>x <%=numProducts%></td>
							<td class="text-success">$<%=totalCost%>
							<td><span class="badge">Pending</span></td>
							<td><a class="btn btn-primary" href="/ouROBOrous/cart.jsp?user_id=<%=orderUserId%>">View Order</a></td>
						</tr>

						<%
}
%>
					</tbody>
				</table>
			</div>
			<div class="card-footer d-flex justify-content-end"></div>
		</div>
	</div>
	<%
	} else {
	response.sendRedirect("/ouROBOrous/products.jsp");
	}
	%>
</body>
<%@include file="includes/footer.jsp"%>
</html>