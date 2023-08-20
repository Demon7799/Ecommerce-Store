<%@page import="com.onlineshop.model.*"%>
<%@page import="java.util.*"%>
<%@page import="com.onlineshop.commons.DBConnection"%>
<%@page import="com.onlineshop.dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	ProductDAO pd = new ProductDAO(DBConnection.getConnection());
	List<ProductModel> products = pd.getAllProducts();
	ArrayList<CartModel> cart_list = (ArrayList<CartModel>) session.getAttribute("cart-list");
	if (cart_list != null)
	{
		request.setAttribute("cart_list", cart_list);
	}
	
	ProductDAO product = new ProductDAO(DBConnection.getConnection());
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welocme To Shop</title>
<%@ include file="CommonFiles/BootStrapLoad.jsp"%>
</head>
<body>
	<%@ include file="CommonFiles/Navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty())
			{
				for (ProductModel p : products)
				{
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="Images/product.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getProductName()%></h5>
						<h6 class="price">
							Price: <%=p.getPrice()%> <i class="fa-solid fa-dollar-sign"></i></h6>
						<h6 class="category">
							Category:
							<%=p.getCategory()%></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add
								to Cart</a> <a class="btn btn-primary"
								href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else
			{
			out.println("There is no proucts");
			}
			%>

		</div>
	</div>
	<%@ include file="CommonFiles/Footer.jsp"%>
</body>
</html>