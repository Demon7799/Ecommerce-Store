package com.onlineshop.model;

public class OrderModel extends ProductModel
{
	private int orderId;
	private int uid;
	private int qunatity;
	private String date;
	/**
	 * @return the orderId
	 */
	public int getOrderId()
	{
		return orderId;
	}
	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(int orderId)
	{
		this.orderId = orderId;
	}
	/**
	 * @return the uid
	 */
	public int getUid()
	{
		return uid;
	}
	/**
	 * @param uid the uid to set
	 */
	public void setUid(int uid)
	{
		this.uid = uid;
	}
	/**
	 * @return the qunatity
	 */
	public int getQunatity()
	{
		return qunatity;
	}
	/**
	 * @param qunatity the qunatity to set
	 */
	public void setQunatity(int qunatity)
	{
		this.qunatity = qunatity;
	}
	/**
	 * @return the date
	 */
	public String getDate()
	{
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(String date)
	{
		this.date = date;
	}
}
