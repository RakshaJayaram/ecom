package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.model.Category;
import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	Category category;
	
	@RequestMapping("/adding")
	public String addPage()
	{
		return "adding";
	}

}
