package com.niit.dao;

import java.util.List;

import com.niit.model.Cart;
import com.niit.model.Category;

public interface CartDao {
		public void insert(Cart cart);
	   public List<Cart> findCartById(String email);
	   public Cart getCart(int cartId,String email);
	   public boolean deleteCart(int cartId);
	   public void updateCart(Cart cart);
	   public Cart getCartByCartId(Integer cartd) ;
	   public Cart getCartFromCartId(int cartid);
}


