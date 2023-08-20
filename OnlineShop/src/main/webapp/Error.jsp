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
<title>Server Error</title>
<%@ include file="CommonFiles/BootStrapLoad.jsp"%>
</head>
<body>
	<%@ include file="CommonFiles/Navbar.jsp"%>
	<h1 class="text-danger">Server is unable to response!! Try Again
		Later</h1>
	<%@ include file="CommonFiles/Footer.jsp"%>
</body>
</html>