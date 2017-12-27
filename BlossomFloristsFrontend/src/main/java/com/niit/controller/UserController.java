package com.niit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.Product;
import com.niit.dao.CategoryDao;
import com.niit.dao.ProductDao;
import com.niit.dao.UserDao;
import com.niit.model.User;

@Controller
public class UserController {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	ProductDao productDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView goToRegister() {

		ModelAndView mav = new ModelAndView();
		mav.addObject("user", new User());
		mav.setViewName("register");
		return mav;
	}
	
	/*@RequestMapping(value = "saveRegister", method = RequestMethod.POST)
	public ModelAndView saveUser(HttpServletRequest request,@Valid @ModelAttribute("user") User user, BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		String email = request.getParameter("email");
		System.out.println(email);
		boolean res = userDao.checkUserExistence(email);
		user = userDao.getUserByUserId(email);
		if (result.hasErrors()||(res == true)){
			mav.setViewName("register");
		 }
		user.setRole("ROLE_USER");
		user.setEnabled("enabled");
		userDao.insertUser(user);
		mav.setViewName("login");
		return mav;
		}	*/
	@RequestMapping(value = "saveRegister", method = RequestMethod.POST)
	public String saveUser(@Valid @ModelAttribute("user") User user, BindingResult result) {
		
		if (result.hasErrors())
			return "register";
		try{
		user.setRole("ROLE_USER");
		user.setEnabled("enabled");
		userDao.insertUser(user);
		return "login";
		}
		catch (Exception e) {
			return "existingUser";
		}
	}

	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null)
			model.addAttribute("error", "Invalid username and password... Please enter the correctly");
		if (logout != null)
			model.addAttribute("logout", "logged out successfully");

		return "login";
	}

	@RequestMapping("/home")
	public String home() {

		return "home";

	}
	

}
