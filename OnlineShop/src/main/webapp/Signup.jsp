
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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
<%@ include file="CommonFiles/BootStrapLoad.jsp"%>
</head>
<body style="background-color: #eee;">
	<%@ include file="CommonFiles/Navbar.jsp"%>

	<form action="signup" method="post">
		<section class="vh-100">
			<div class="container h-100">
				<div
					class="row d-flex justify-content-center align-items-center h-100">
					<div class="col-lg-12 col-xl-11">
						<div class="card text-black" style="border-radius: 25px;">
							<div class="card-body p-md-5">
								<div class="row justify-content-center">
									<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

										<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign
											up</p>

										<form class="mx-1 mx-md-4">

											<div class="d-flex flex-row align-items-center mb-4">

												<div class="form-outline flex-fill mb-0">
													<i class="fas fa-user fa-lg me-3 fa-fw"></i><label
														class="form-label pl-2" for="form3Example1c">Full
														Name</label><input type="text" id="form3Example1c"
														class="form-control" name="fullName" required />

												</div>
											</div>

											<div class="d-flex flex-row align-items-center mb-4">

												<div class="form-outline flex-fill mb-0">
													<i class="fas fa-envelope fa-lg me-3 fa-fw"></i><label
														class="form-label pl-2" for="form3Example3c">Your
														Email</label><input type="email" id="form3Example3c"
														class="form-control" name="mail" required />

												</div>
											</div>

											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<i class="fas fa-lock fa-lg me-3 fa-fw"></i><label
														class="form-label" for="form3Example4c pl-2">Password</label><input
														type="password" id="form3Example4c" class="form-control"
														name="password" required />
												</div>
											</div>

											<div class="d-flex flex-row align-items-center mb-4">
												<div class="form-outline flex-fill mb-0">
													<i class="fa-solid fa-phone"></i><label
														class="form-label pl-2" for="form3Example4cd">Mobile
														Number</label><input type="number" id="mobileNo"
														class="form-control" name="mobile" required />
												</div>
											</div>

											<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
												<button type="submit" class="btn btn-primary btn-lg">Register</button>
											</div>
											<div class="form-check d-flex justify-content-center mb-5">
												<label class="form-check-label" for="form2Example3">Already
													have account <a href="Login.jsp">Login Here</a>
												</label>
											</div>
										</form>

									</div>
									<div
										class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

										<img
											src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
											class="img-fluid" alt="Sample image">

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>
	<%@ include file="CommonFiles/Footer.jsp"%>
</body>
</html>