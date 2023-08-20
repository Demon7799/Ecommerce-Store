<%@page import="java.text.DecimalFormat"%>
<%@page import="com.onlineshop.commons.DBConnection"%>
<%@page import="com.onlineshop.dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.onlineshop.model.CartModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
ArrayList<CartModel> cart_list = (ArrayList<CartModel>) session.getAttribute("cart-list");
List<CartModel> cartProduct = null;
if (cart_list != null)
{
	ProductDAO pDao = new ProductDAO(DBConnection.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = (pDao.getTotalCartPrice(cart_list));
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
<%@ include file="CommonFiles/BootStrapLoad.jsp"%>
<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>
</head>
<body>
	<%@ include file="CommonFiles/Navbar.jsp"%>
	<div class="container my-3">
		<div class="d-flex py-3">
			<h3>Total Price: $ ${(total>0)?dcf.format(total):0}</h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null)
				{
					for (CartModel c : cartProduct)
					{
				%>
				<tr>
					<td><%=c.getProductName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=dcf.format(Double.parseDouble(c.getPrice()))%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn bnt-sm btn-incre"
									href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i
									class="fas fa-plus-square"></i></a> <input type="text"
									name="quantity" class="form-control"
									value="<%=c.getQuantity()%>" readonly> <a
									class="btn btn-sm btn-decre"
									href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i
									class="fas fa-minus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId()%>"
						class="btn btn-sm btn-danger">Remove</a></td>
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