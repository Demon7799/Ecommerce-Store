package com.onlineshop.model;

public class ProductModel
{
	private int id;
	private String productName;
	private String price;
	private String category;
	
	/**
	 * @return the id
	 */
	public int getId()
	{
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id)
	{
		this.id = id;
	}
	/**
	 * @return the productName
	 */
	public String getProductName()
	{
		return productName;
	}
	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName)
	{
		this.productName = productName;
	}
	/**
	 * @return the price
	 */
	public String getPrice()
	{
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(String price)
	{
		this.price = price;
	}
	/**
	 * @return the category
	 */
	public String getCategory()
	{
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(String category)
	{
		this.category = category;
	}
}
