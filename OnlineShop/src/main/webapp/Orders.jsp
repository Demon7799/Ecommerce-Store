<%@page import="com.onlineshop.dao.OrderDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineshop.commons.DBConnection"%>
<%@page import="com.onlineshop.dao.ProductDAO"%>
<%@page import="java.util.*"%>
<%@page import="com.onlineshop.model.*"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
UserModel auth = (UserModel) request.getSession().getAttribute("auth");
List<OrderModel> orders = null;
if (auth != null)
{
	request.setAttribute("person", auth);
	OrderDAO orderDao = new OrderDAO(DBConnection.getConnection());
	orders = orderDao.userOrders(auth.getId());
} else
{
	response.sendRedirect("login.jsp");
}
ArrayList<CartModel> cart_list = (ArrayList<CartModel>) session.getAttribute("cart-list");
if (cart_list != null)
{
	request.setAttribute("cart_list", cart_list);
}
%>
<%
ProductDAO pd = new ProductDAO(DBConnection.getConnection());
List<ProductModel> products = pd.getAllProducts();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Orders</title>
<%@ include file="CommonFiles/BootStrapLoad.jsp"%>
</head>
<body>
	<%@ include file="CommonFiles/Navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>

				<%
				if (orders != null)
				{
					for (OrderModel o : orders)
					{
				%>
				<tr>
					<td><%=o.getDate()%></td>
					<td><%=o.getProductName()%></td>
					<td><%=o.getCategory()%></td>
					<td><%=o.getQunatity()%></td>
					<td><%=dcf.format(Double.parseDouble(o.getPrice()))%></td>
					<td><a class="btn btn-sm btn-danger"
						href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
				</tr>
				<%
				}
				}
				%>

			</tbody>
		</table>
	</div>
	<%@ include file="CommonFiles/Footer.jsp"%>
</body>
</html>