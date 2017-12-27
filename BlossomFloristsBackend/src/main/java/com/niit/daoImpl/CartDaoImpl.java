package com.niit.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.dao.CartDao;
import com.niit.model.Cart;
import com.niit.model.Category;
import com.niit.model.Product;

@Repository("cartDao")
@Transactional
public class CartDaoImpl implements CartDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public CartDaoImpl(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
	}
	@Transactional
	public void insert(Cart cart) {
		 Session session = sessionFactory.openSession();
		 System.out.println("1");
		    session.beginTransaction();
		    System.out.println("2");
		    session.persist(cart);
		    System.out.println("3");
		    session.getTransaction().commit();
		    System.out.println("4");
		    
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Cart> findCartById(String email) {
		/*Session session = sessionFactory.openSession();
		List<Cart> cart = null;
		System.out.println("---1");
		System.out.println(email);
		session.beginTransaction();
		Query query = session.createQuery("from Cart where email =" + email);
		query.setParameter("email", email);
		cart = query.list();
		return cart;*/
		
		Session session=sessionFactory.openSession();
		List<Cart> c=null;
		List<Cart> cartlist=null;
			
		try{
			session.beginTransaction(); 
			 List<Cart> list = (List<Cart>) session.createQuery("from Cart where email =:email").setString("email", email).list();
			c=list;
			session.getTransaction().commit();
			System.out.println(c.isEmpty());
			return  c;

		}
		catch(HibernateException ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
				return  null;

		}
		
	}
	
	public Cart getCartFromCartId(int cartid){
		 Session session = sessionFactory.openSession();
		 System.out.println("in cart dao cartId"+cartid);
		 Query query = session.createQuery("from Cart where cartid =" + cartid);
			Cart cart = (Cart) query.uniqueResult();
			session.close();
			return cart;
	}
	
	//---------------------------------------//
	public Cart getCartByCartId(Integer cartid) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Cart cart=(Cart)session.get(Cart.class, cartid);
		System.out.println("inside");
		session.close();
		return cart;
	}

	public Cart getCart(int cartId, String email) {
		  Session session = sessionFactory.openSession();
		  	System.out.println("in cart dao");
		    Cart cart = null;
		    try
		    {
		    	 session.beginTransaction();
		    	 cart = (Cart)session.createQuery("from Cart where email = email and cartId = cartId").setString("email", email).setInteger("cartId", cartId).uniqueResult();
		         session.getTransaction().commit();
		         
		    }
		    catch(Exception e)
		    {
		    	
		    }
		    return cart;
		
	}

	public boolean deleteCart(int cartId) {
		Session session = sessionFactory.openSession();
		   session.beginTransaction();
		   Cart cr = (Cart) session.get(Cart.class, cartId);
		   session.delete(cr);
		   session.getTransaction().commit();
		   return true;
	}

	public void updateCart(Cart cart) {
		Session session = sessionFactory.openSession();
	    session.beginTransaction();
	    session.update(cart);
	    session.getTransaction().commit();
		
	}
	

}
