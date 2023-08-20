package com.onlineshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.onlineshop.commons.DBQuery;
import com.onlineshop.model.CartModel;
import com.onlineshop.model.ProductModel;

public class ProductDAO
{
	private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;
    
    public ProductDAO(Connection con)
    {
    	this.connection = con;
    }
    
    public List<ProductModel> getAllProducts() 
    {
        List<ProductModel> products = new ArrayList<>();
        try {

            preparedStatement = connection.prepareStatement(DBQuery.query_getAllProducts);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
            	ProductModel product = new ProductModel();
            	product.setId(resultSet.getInt("id"));
            	product.setProductName(resultSet.getString("productname"));
            	product.setCategory(resultSet.getString("category"));
            	product.setPrice(resultSet.getString("price"));

                products.add(product);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return products;
    }
    
    public List<CartModel> getCartProducts(ArrayList<CartModel> cartList) {
        List<CartModel> product = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (CartModel item : cartList) {
                    preparedStatement = connection.prepareStatement(DBQuery.query_getProductsForCart);
                    preparedStatement.setInt(1, item.getId());
                    resultSet = preparedStatement.executeQuery();
                    while (resultSet.next()) {
                        CartModel row = new CartModel();
                        row.setId(resultSet.getInt("id"));
                        row.setProductName(resultSet.getString("productname"));
                        row.setCategory(resultSet.getString("category"));
                        row.setPrice(String.valueOf(Double.parseDouble(resultSet.getString("price"))*item.getQuantity()));
                        row.setQuantity(item.getQuantity());
                        product.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return product;
    }
    
    public double getTotalCartPrice(ArrayList<CartModel> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (CartModel item : cartList) {
                    preparedStatement = connection.prepareStatement(DBQuery.query_getPrice);
                    preparedStatement.setInt(1, item.getId());
                    resultSet = preparedStatement.executeQuery();
                    while (resultSet.next()) {
                        sum+=Double.parseDouble(resultSet.getString("price"))*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
    
    public ProductModel getSingleProduct(int id) {
		 ProductModel row = null;
	        try {
	            String query = "select * from products where id=? ";

	            preparedStatement = this.connection.prepareStatement(query);
	            preparedStatement.setInt(1, id);
	            ResultSet rs = preparedStatement.executeQuery();

	            while (rs.next()) {
	            	row = new ProductModel();
	                row.setId(rs.getInt("id"));
	                row.setProductName(rs.getString("productname"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getString("price"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
}
