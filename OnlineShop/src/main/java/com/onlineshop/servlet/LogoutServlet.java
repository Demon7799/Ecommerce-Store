package com.onlineshop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		if(req.getSession().getAttribute("auth") !=null)
		{
			req.getSession().removeAttribute("auth");
			resp.sendRedirect("Login.jsp");
		}
		else
		{
			resp.sendRedirect("Index.jsp");
		}
	}
	
}
