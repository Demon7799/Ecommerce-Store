package com.onlineshop.commons;

public class DBQuery
{
	//for signup
	public static String query_signUp = "insert into users(fullname,MobileNo,EmailId,Pass) values(?,?,?,?)";
	
	//for login
	public static String query_login = "select * from users where EmailId=? and Pass=?";
	
	//to get all products
	public static String query_getAllProducts = "select * from products";
	
	//to get products for cart
	public static String query_getProductsForCart = "select * from products where id=?";
	
	// to get the price 
	public static String query_getPrice = "select price from products where id=?";
	
	//to add order
	public static String query_addOrder ="insert into orders (product_id, user_id, order_quantity) values(?,?,?)";
}
