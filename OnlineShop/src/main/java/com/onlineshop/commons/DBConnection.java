package com.onlineshop.commons;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection
{
	private static Connection connection = null;

	public static Connection getConnection()
	{
		try
		{
			if (connection == null)
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshop", "root","abhi");
			}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return connection;
	}
}
