<%@page import="com.onlineshop.model.UserModel"%>
<nav class="navbar navbar-expand-lg " style="background-color: #245894;height:4vh;">
	<div class="container-fluid">
		<a class="navbar-brand float-start" href="Index.jsp" style="color:#39FF14;">EverGreen Online Store</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item hover hover-effect pr-4"><a class="nav-link" href="Index.jsp">Products</a></li>
				<li class="nav-item hover hover-effect pr-4"><a class="nav-link" href="Cart.jsp">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
				<%
				if (session.getAttribute("auth") != null) {
					UserModel model = (UserModel)session.getAttribute("auth");
				%>
				<li class="nav-item hover hover-effect pr-4"><a class="nav-link" href="Orders.jsp">Orders</a></li>
				<li class="nav-item hover hover-effect pr-4"><a class="nav-link" >Welcome <%=model.getFullName() %></a></li>
				<li class="nav-item hover hover-effect pr-4"><a class="nav-link" href="logout">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item hover hover-effect pr-4"><a class="nav-link" href="Login.jsp">Login</a></li>
				<li class="nav-item hover hover-effect pr-4"><a class="nav-link" href=Signup.jsp>SignUp</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</nav>