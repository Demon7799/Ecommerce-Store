package com.onlineshop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineshop.commons.DBConnection;
import com.onlineshop.dao.UserDAO;
import com.onlineshop.model.UserModel;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.sendRedirect("Index.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		UserModel model = new UserModel();
		
		model.setFullName(request.getParameter("fullName"));
		model.setEmail(request.getParameter("mail"));
		model.setMobileNo(request.getParameter("mobile"));
		model.setPassword(request.getParameter("password"));
		
		UserDAO userDAO = new UserDAO(DBConnection.getConnection());
		UserModel user = userDAO.userSignup(model);
		
		if(user !=null)
		{
			response.sendRedirect("Login.jsp");
		}
		else
		{
			response.sendRedirect("Error.jsp");
		}
	}

}
