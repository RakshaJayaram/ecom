package com.niit.dao;

import java.util.List;

import com.niit.model.Product;

public interface ProductDao {
	public boolean addProduct(Product product);

	public List<Product> retriveProduct();
	public boolean deleteProduct(Product product);
	public Product getProduct(int productId);
	public Product getProductByName(String productName);
	public boolean updateProduct(Product product);
	public List<Product> getProductsByCategory(int catId);
	
}
