package com.onlineshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.onlineshop.commons.DBQuery;
import com.onlineshop.model.UserModel;

public class UserDAO
{
	private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public UserDAO(Connection con)
    {
    	this.connection = con;
    }
    
    public UserModel userLogin(UserModel userModel) {
		UserModel user = null;
        try {
            preparedStatement = this.connection.prepareStatement(DBQuery.query_login);
            preparedStatement.setString(1, userModel.getEmail());
            preparedStatement.setString(2, userModel.getPassword());
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
            	user = new UserModel();
            	user.setId(resultSet.getInt("id"));
            	user.setFullName(resultSet.getString("fullname"));
            	user.setEmail(resultSet.getString("emailid"));
            	user.setMobileNo(resultSet.getString("mobileno"));
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
    
    public UserModel userSignup(UserModel userModel) {
		UserModel user = null;
        try {
            preparedStatement = this.connection.prepareStatement(DBQuery.query_signUp);
            preparedStatement.setString(1, userModel.getFullName());
            preparedStatement.setString(2, userModel.getMobileNo());
            preparedStatement.setString(3, userModel.getEmail());
            preparedStatement.setString(4, userModel.getPassword());
            int result = preparedStatement.executeUpdate();
            if(result>0)
            {
            	user = new UserModel();
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
}
