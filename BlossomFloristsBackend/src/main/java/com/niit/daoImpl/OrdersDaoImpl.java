package com.niit.daoImpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.OrdersDao;
import com.niit.model.Orders;

@Repository("ordersDao")
public class OrdersDaoImpl implements OrdersDao{
	
	@Autowired
	SessionFactory sessionFactory;
	
	public OrdersDaoImpl(SessionFactory sessionFactory)
	{
		super();
		this.sessionFactory = sessionFactory;
	}

	public void addOrders(Orders order)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.persist(order);
		session.getTransaction().commit();
		
	}
}
