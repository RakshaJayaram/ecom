package com.niit.dao;

import java.util.List;

import com.niit.model.Category;

public interface CategoryDao {
	public boolean addCategory(Category category);

	public List<Category> retriveCategory();

	public boolean deleteCategory(Category category);

	public Category getCategory(int catId);

	public boolean updateCategory(Category category);

	public Category getCategorybyName(String catName);
	
	public Category getCategoryById(Integer catId);
}
