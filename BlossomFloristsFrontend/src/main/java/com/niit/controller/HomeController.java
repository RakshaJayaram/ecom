package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.model.Product;

@Controller
public class HomeController {
	
	@RequestMapping("/adminHome")
	public ModelAndView showAdminHome() {
		ModelAndView mv = new ModelAndView("/adminHome");
		return mv;
	}

	@RequestMapping("/aboutUs")
	public String aboutUs() {
		return "aboutUs";
	}
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	
}
