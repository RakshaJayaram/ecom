package com.niit.controller;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.model.Cart;
import com.niit.dao.CartDao;
import com.niit.dao.CategoryDao;
import com.niit.dao.OrdersDao;
import com.niit.dao.ProductDao;
import com.niit.dao.SupplierDao;
import com.niit.dao.UserDao;
import com.niit.model.Category;
import com.niit.model.Orders;
import com.niit.model.Product;
import com.niit.model.Supplier;
import com.niit.model.User;

@Controller
public class ProductController {
	
	@Autowired
	CategoryDao categoryDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	SupplierDao supplierDao;
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	OrdersDao ordersDao;
	
	@Autowired
	CartDao cartDao;

	@Autowired
	Category category;

	@Autowired
	Supplier supplier;
	
	@Autowired 
	Product product;
	
	@Autowired
	Cart cart;

	
	
	@RequestMapping(value = "/ProductList/{catId}")
	public String productList(Model m, @PathVariable("catId") int catId) {

		List<Product> list = new ArrayList();
		list = productDao.getProductsByCategory(catId);
		m.addAttribute("productlist", list);
		System.out.println("/ProductList/{cid}");
		String categoryName = categoryDao.getCategoryById(catId).getCatName();
		m.addAttribute("categoryName", categoryName);
		m.addAttribute("catId", catId);
		return "productCustomerList";

	}
	
	  /*@Autowired Product product;*/
	 
	public LinkedHashMap<Integer, String> getCategories() {
		List<Category> listCategories = categoryDao.retriveCategory();
		LinkedHashMap<Integer, String> categoryList = new LinkedHashMap<Integer, String>();

		for (Category category : listCategories) {
			categoryList.put(category.getCatId(), category.getCatName());
		}
		return categoryList;
	}

	public LinkedHashMap<Integer, String> getSuppliers() {
		List<Supplier> listSuppliers = supplierDao.retriveSupplier();
		LinkedHashMap<Integer, String> supplierList = new LinkedHashMap<Integer, String>();

		for (Supplier supplier : listSuppliers) {
			supplierList.put(supplier.getSupplierId(), supplier.getSupplierName());
		}
		return supplierList;
	}

	// Product Insert method1
	@RequestMapping(value = "createProduct", method = RequestMethod.GET)
	public ModelAndView showProduct(Model m) {

		/*
		 * Product product = new Product(); m.addAttribute("createProductObj",
		 * product); m.addAttribute("category", new Category());
		 * m.addAttribute("supplier", new Supplier());
		 * 
		 * m.addAttribute("categoryList", this.getCategories());
		 * m.addAttribute("supplierList", this.getSuppliers());
		 * 
		 * return "createProduct";
		 */
		ModelAndView mv = new ModelAndView("createProduct");
		Product product = new Product();
		mv.addObject("createProductObj", product);
		mv.addObject("productList", this.productDao.retriveProduct());
		mv.addObject("category", new Category());
		mv.addObject("categoryList", this.categoryDao.retriveCategory());
		mv.addObject("supplier", new Supplier());
		mv.addObject("supplierList", this.supplierDao.retriveSupplier());
		return mv;

	}

	// Product insert method2
	@RequestMapping(value = "InsertProduct", method = RequestMethod.POST)
	public ModelAndView insertProduct(@Valid @ModelAttribute("createProductObj") Product product, BindingResult result,
			MultipartFile fileDetail, Model m) {
		ModelAndView mv = null;
		if (result.hasErrors()) {
			mv = new ModelAndView("createProduct");
			mv.addObject("productList", this.productDao.retriveProduct());
			mv.addObject("category", new Category());
			mv.addObject("categoryList", this.categoryDao.retriveCategory());
			mv.addObject("supplier", new Supplier());
			mv.addObject("supplierList", this.supplierDao.retriveSupplier());

			return mv;

		}

		else {
			System.out.println(product.toString());

			category = categoryDao.getCategorybyName(product.getCategory().getCatName());
			supplier = supplierDao.getSupplierbyName(product.getSupplier().getSupplierName());

			System.out.println(category + "\t" + supplier);

			product.setCategory(category);
			product.setSupplier(supplier);
			productDao.addProduct(product);

			mv = new ModelAndView("product");
			mv.addObject("productList", productDao.retriveProduct());

			String path = "D:\\workspace_new\\BlossomFloristsFrontend\\src\\main\\webapp\\resources\\images\\";
			String totalFileWithPath = path + String.valueOf(product.getProductId()) + ".jpg";
			File pimage = new File(totalFileWithPath);

			fileDetail = product.getPimage();
			if (!fileDetail.isEmpty()) {
				try {
					byte fileBuffer[] = fileDetail.getBytes();
					FileOutputStream fos = new FileOutputStream(pimage);
					BufferedOutputStream bs = new BufferedOutputStream(fos);
					bs.write(fileBuffer);
					bs.close();
				} catch (Exception e) {
					m.addAttribute("File Exception", e.getMessage());
				}
			} else {
				m.addAttribute("error", "Problem in file uploading");
			}

			return mv;
		}
	}

	@RequestMapping(value = "/getAllproducts", method = RequestMethod.GET)
	public String display(Model m) {
		List<Product> listProduct = productDao.retriveProduct();
		m.addAttribute("productList", listProduct);
		return "product";
	}

	// product Update method1
	@RequestMapping(value = "updateProduct/{productId}", method = RequestMethod.GET)
	public ModelAndView updateProduct(@PathVariable("productId") int productId, HttpServletRequest request) {

		Product product = productDao.getProduct(productId);
		System.out.println(product);

		ModelAndView mv = new ModelAndView("updateProduct");
		mv.addObject("categoryList", categoryDao.retriveCategory());
		mv.addObject("supplierList", supplierDao.retriveSupplier());
		mv.addObject("editProductObj", product);

		return mv;

	}

	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateMyProduct(@Valid @ModelAttribute("editProductObj") Product product, BindingResult result,
			Model m) {

		if (result.hasErrors())
			return "updateProduct";

		category = categoryDao.getCategorybyName(product.getCategory().getCatName());
		supplier = supplierDao.getSupplierbyName(product.getSupplier().getSupplierName());

		System.out.println("category" + category.getCatName());
		System.out.println("supplier" + supplier.getSupplierName());
		System.out.println(product.toString());
		System.out.println(product.getCategory().getCatName());

		System.out.println("Product id=\t" + product.getProductId());

		product.setCategory(category);
		product.setSupplier(supplier);
		productDao.updateProduct(product);
		

		
		return "redirect:/getAllproducts";
	}

	@RequestMapping(value = "deleteProduct/{productId}", method = RequestMethod.GET)
	public String deleteProduct(@PathVariable("productId") int productId, Model m) {
		System.out.println("inside delete product*******************");
		Product product = productDao.getProduct(productId);
		productDao.deleteProduct(product);
		List<Product> listProduct = productDao.retriveProduct();
		m.addAttribute("productList", listProduct);
		return "redirect:/getAllproducts";
	}
	
/*	=================================================*/
	
	
	@RequestMapping(value = "/getAllUserProducts", method = RequestMethod.GET)
	public String displayUserProducts(Model m) {
		List<Product> listProduct = productDao.retriveProduct();
		m.addAttribute("productList", listProduct);
		return "productCustomerList";
	}
	
	
	@RequestMapping(value = "getAllUserProducts/{productId}")
	public String product(@PathVariable("productId") int productId, Model m) {
		Product product = productDao.getProduct(productId);
		m.addAttribute("product", product);
		System.out.println(product.toString());
		return "productDescription";
	}
	
	@RequestMapping(value = "/addCart/{productId}/{email}/")
	public String addCart(Model mav,HttpServletRequest request, @PathVariable("productId") int productId, @PathVariable("email") String email) {
		
		Product product = productDao.getProduct(productId);
		User user = userDao.getUserByUserId(email);
		System.out.println("lllllllllllllll");
		System.out.println(product.getProductId());
		if(request.getParameter("addbutton")!=null)
			{
			Cart cart = new Cart();
			try {
				
				/*To read the content of a Multipart file into a String you can use Apache Commons IOUtils class*/
				//ByteArrayInputStream stream = new   ByteArrayInputStream(product.getPimage().getBytes());
				//String myImage = IOUtils.toString(stream, "UTF-8");
			//String myImage = new String(product.getPimage().getBytes());
				
			String img =	String.valueOf(product.getProductId());
			System.out.println(img);
			System.out.println("/addCart/{productId}/{email}/ :" + product.getProductName());
			System.out.println("cart.setImage(img) :"+ img);
			System.out.println("cart.setName(product.getProductName()) :"+product.getProductName());
			System.out.println("cart.setEmail(email) :"+email);
			cart.setEmail(email);
			cart.setImage(img);
			cart.setName(product.getProductName());
			cart.setPrice(product.getPrice());
			cart.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			
			/*int stock = product.getStock() - Integer.parseInt(request.getParameter("quantity"));
			System.out.println(stock);
			product.setStock(stock);
			productDao.updateProduct(product);*/
			cartDao.insert(cart);
			return "redirect:/ShoppingCart/" + email + "/";
			} 
			catch (Exception e) {
				e.printStackTrace();
				return "home";
			}
			}			
		
	return "redirect:/";
	
	}
	
	
	@RequestMapping(value = "/ShoppingCart/{email}/")
	public String ShoppingCart(Model m, @PathVariable String email) {
		System.out.println(email);
		List<Cart> list = cartDao.findCartById(email);
		m.addAttribute("cartlist", list);
		System.out.println("/ShoppingCart/{email}/" + list.size());
		return "cart";

	}
	
	@RequestMapping(value = "/removeCart/{cartId}/{email}/")
	public String removeCart(HttpServletRequest request,@PathVariable("cartId") Integer cartId, @PathVariable("email") String email) {
		
		cartDao.deleteCart(cartId);
		System.out.println("/removeCart/{id}/{email}/");
		return "redirect:/ShoppingCart/" + email + "/";
	}
	
	@RequestMapping(value = "/clearCart/{email}/")
	public String clearCart(HttpServletRequest request, @PathVariable("email") String email) {
		System.out.println("inside clear cart");
		List<Cart> cartlist = cartDao.findCartById(email);
		for(Cart c : cartlist){
		cartDao.deleteCart(c.getCartid());
		}
		return "redirect:/ShoppingCart/" + email + "/";
	}
	
	@RequestMapping(value = "/editCart/{cartid}/{email}/")
	public ModelAndView editCart(HttpServletRequest request,@PathVariable("cartid") Integer cartid) {
		ModelAndView mav = new ModelAndView("updateCart");
		System.out.println(cartid);
	
		Cart cart = cartDao.getCartFromCartId(cartid);
		System.out.println(cart);
		
		//User u = userDao.getUserByUserId(email);
		//mav.addObject("user", u);
		mav.addObject("cart", cart);
		return mav;
	}
	
	@RequestMapping(value = "/updateCart/{cartid}/{email}/", method = RequestMethod.POST)
	public String editMyCart(HttpServletRequest request, @Valid @ModelAttribute("cart") Cart cart,BindingResult result,
			Model m){
		cartDao.updateCart(cart);	
		
		Cart cart1 = new Cart();
		m.addAttribute(cart1);
		System.out.println(cart.getEmail());
		String email = cart.getEmail();
		/*List<Cart> listcart = supplierDao.retriveSupplier();
		m.addAttribute("supplierList", listSupplier);
*/
	/*	List<Cart> list = cartDao.findCartById(cart.getEmail());
		m.addAttribute("cart", list);
		*/
		 
		return "redirect:/ShoppingCart/"+email+"/";
	}
	
	/*@RequestMapping(value = "updateCart", method = RequestMethod.POST)
	public String updateMyCart(@Valid @ModelAttribute("cart") Cart cart,@PathVariable("email") String email,BindingResult result, Model m) {
	
		if (result.hasErrors())
			return "updateCart";
		
		cartDao.updateCart(cart);
		Cart cart1 = new Cart();
		m.addAttribute(cart1);

		List<Cart> listCart = cartDao.findCartById(email);
		m.addAttribute("cartList", listCart);

		return "redirect:/cart";

	}
	
	*/
	
	/*// product Update method1
		@RequestMapping(value = "/editCart/{cartId}/{email}/", method = RequestMethod.GET)
		public ModelAndView updateCart(@PathVariable("cartId") int cartId,@PathVariable("email") String email, HttpServletRequest request) {

			
			Cart cart = cartDao.getCart(cartId, email);
			System.out.println(cart);

			ModelAndView mv = new ModelAndView("updateCart");
			mv.addObject("editCartObj", cart);

			return mv;

		}

		@RequestMapping(value = "updatecart", method = RequestMethod.POST)
		public String updateMyCart(@Valid @ModelAttribute("editCartObj") Cart cart, BindingResult result,
				Model m) {

			if (result.hasErrors())
				return "updateCart";
			
			cartDao.updateCart(cart);
			
			return "redirect:/cart";
		}*/

	
	
	@RequestMapping("/checkout")
	public ModelAndView checkout(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("checkout");
		Principal principal = request.getUserPrincipal();
		String email = principal.getName();
		User u = userDao.getUserByUserId(email);
		List<Cart> cart = cartDao.findCartById(email);
		System.out.println("/checkout");
		mav.addObject("user", u);
		mav.addObject("total","cart");
		mav.addObject("cart", cart);
	
		return mav;
	}
	
	@RequestMapping(value = "/invoice", method = RequestMethod.POST)
	public ModelAndView orderSave(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("invoice");
		Orders orders = new Orders();
		double total  = Double.parseDouble(request.getParameter("total"));
		String payment = request.getParameter("payment");
		Principal principal = request.getUserPrincipal();
		String email = principal.getName();
		User user = userDao.getUserByUserId(email);
		orders.setPayment(payment);
		orders.setTotal(total);
		orders.setUser(user);
		ordersDao.addOrders(orders); 
		List<Cart> cartlist = cartDao.findCartById(email);
		for(Cart c : cartlist){
			System.out.println("*******************************");
			System.out.println(c.getName());
			Product product =productDao.getProductByName(c.getName());
			System.out.println("\n cart quantity :  "+ c.getQuantity());
			System.out.println("\n product stock:  "+product.getStock());
			int stock = product.getStock() - c.getQuantity();
			product.setStock(stock);
			productDao.updateProduct(product);
			cartDao.deleteCart(c.getCartid());
		}
		/*System.out.println("list iterator >>>");
		ListIterator<Cart> listIterator = cartlist.listIterator();
		while(listIterator.hasNext()){
			Cart next = listIterator.next();
			System.out.println(next.getEmail()+"next.getEmail()");
			System.out.println(next.getName()+"next.getName()");
			System.out.println(next.getCartid()+"next.getCartid()");
			System.out.println(next.getQuantity()+"next.getQuantity()");
		}
		for (int i = 0; i < cartlist.size(); i++) {
				//int cartQuantity = cart.getQuantity();
				//int id = cart.getCartid();
				System.out.println(cart.getCartid()+"cart============================");
				String name = cart.getName();
				System.out.println(cart.getName()+"%%%%%%%%%%%%%%%%%%%%%%%");
				System.out.println(productDao.getProductByName(name)+"))))))))))))))))))))))))");
				
				Product myProduct =productDao.getProductByName(name);
				//int stock1 = myProduct.getStock();
				System.out.println(myProduct.getStock()+"product@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				int stock  = myProduct.getStock() - cart.getQuantity();
				System.out.println(cart.getQuantity()+"\n"+cart.getName()+"\n"+"myProduct.getStock()");
				product.setStock(stock);
				productDao.updateProduct(product);
			cartDao.deleteCart(cartlist.get(i).getCartid());
		}*/
		mav.addObject("user", user);
		System.out.println("/invoice");
		return mav;
	}
}


