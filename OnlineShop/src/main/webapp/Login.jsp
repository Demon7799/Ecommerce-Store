<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineshop.commons.DBConnection"%>
<%@page import="com.onlineshop.dao.ProductDAO"%>
<%@page import="java.util.*"%>
<%@page import="com.onlineshop.model.*"%>

<%
ProductDAO pd = new ProductDAO(DBConnection.getConnection());
List<ProductModel> products = pd.getAllProducts();
ArrayList<CartModel> cart_list = (ArrayList<CartModel>) session.getAttribute("cart-list");
if (cart_list != null)
{
	request.setAttribute("cart_list", cart_list);
}
%>
<%
if (request.getSession().getAttribute("auth") != null)
{
	response.sendRedirect("Index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign In Your Account</title>
<%@ include file="CommonFiles/BootStrapLoad.jsp"%>
</head>
<body style="background-color: #CAEFD1">
	<%@ include file="CommonFiles/Navbar.jsp"%>
	<!-- Login body -->
	<div class="container-fluid mt-6 pt-6">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4 m-6">
				<div class="card" style="background-color: #CAEFD1; border: 0px;">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Login Page</h5>
						</div>
						<form action="login" method="post">
							<div class="form-group">
								<label><i class="fa-solid fa-envelope"></i> Email</label> <input
									type="email" required="required" class="form-control"
									id="inputEmail1" aria-describedby="emailHelp" name="userMail"
									placeholder="Enter Mail Id">
							</div>

							<div class="form-group">
								<label for="inputPassword1"><i class="fa-solid fa-lock"></i>
									Password</label> <input type="password" required="required"
									class="form-control" id="inputPassword1" name="userPassword"
									placeholder="Enter Password">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
						<p class="text-dark p-4 text-center">
							Don't Have Account? Create One By <a href="Signup.jsp"
								class="text-primary">Clicking Here</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="CommonFiles/Footer.jsp"%>
</body>
</html>