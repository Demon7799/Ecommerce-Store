package com.onlineshop.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineshop.commons.DBConnection;
import com.onlineshop.dao.UserDAO;
import com.onlineshop.model.UserModel;

@WebServlet("/login")
public class LoginServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.sendRedirect("Index.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter())
		{
			UserModel model = new UserModel();
			model.setEmail(request.getParameter("userMail"));
			model.setPassword(request.getParameter("userPassword"));

			UserDAO udao = new UserDAO(DBConnection.getConnection());
			UserModel user = udao.userLogin(model);
			if (user != null)
			{
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("Index.jsp");
			} else
			{
				response.sendRedirect("Error.jsp");
			}

		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
