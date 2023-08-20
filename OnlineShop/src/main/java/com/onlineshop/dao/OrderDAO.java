package com.onlineshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.onlineshop.commons.DBQuery;
import com.onlineshop.model.OrderModel;
import com.onlineshop.model.ProductModel;

public class OrderDAO
{
	private Connection con;
    private PreparedStatement pst;
    private ResultSet rs;
	
	public OrderDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertOrder(OrderModel model) {
        boolean result = false;
        try {
            pst = this.con.prepareStatement(DBQuery.query_addOrder);
            pst.setInt(1, model.getId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQunatity());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
	

    public List<OrderModel> userOrders(int id) {
        List<OrderModel> list = new ArrayList<>();
        try {
            String query = "select * from orders where user_id=? order by orders.order_id desc";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                OrderModel order = new OrderModel();
                ProductDAO productDao = new ProductDAO(this.con);
                int pId = rs.getInt("product_id");
                ProductModel product = productDao.getSingleProduct(pId);
                order.setOrderId(rs.getInt("order_id"));
                order.setId(pId);
                order.setProductName(product.getProductName());
                order.setCategory(product.getCategory());
                order.setPrice(String.valueOf(Double.parseDouble(product.getPrice())*rs.getInt("order_quantity")));
                order.setQunatity(rs.getInt("order_quantity"));
                order.setDate(rs.getString("createdon"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return list;
    }

    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            String query = "delete from orders where order_id=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}
