package com.onlineshop.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.onlineshop.commons.DBConnection;
import com.onlineshop.dao.OrderDAO;
import com.onlineshop.model.*;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()){
			ArrayList<CartModel> cart_list = (ArrayList<CartModel>) request.getSession().getAttribute("cart-list");
			UserModel auth = (UserModel) request.getSession().getAttribute("auth");
			if(cart_list != null && auth!=null) {
				for(CartModel c:cart_list) {
					OrderModel order = new OrderModel();
					order.setId(c.getId());
					order.setUid(auth.getId());
					order.setQunatity(c.getQuantity());
					
					OrderDAO oDao = new OrderDAO(DBConnection.getConnection());
					boolean result = oDao.insertOrder(order);
					if(!result) break;
				}
				cart_list.clear();
				response.sendRedirect("Orders.jsp");
			}else {
				if(auth==null) {
					response.sendRedirect("Login.jsp");
				}
				response.sendRedirect("Cart.jsp");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
