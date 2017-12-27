package com.niit.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CategoryDao;
import com.niit.model.Category;
import com.niit.model.Supplier;

@Repository("categoryDao")
@Transactional
public class CategoryDaoImpl implements CategoryDao{
	@Autowired
	SessionFactory sessionFactory;

	
	public boolean addCategory(Category category) {
		try {
			sessionFactory.getCurrentSession().save(category);
			return true;

		} catch (Exception e) {

			return false;
		}
	}

	public List<Category> retriveCategory() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category");
		List<Category> listCategory = query.list();
		session.close();
		return listCategory;
	}

	public boolean deleteCategory(Category category) {
		try {
			System.out.println("deleteCategory *****************************************");
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.delete(category);

			tx.commit();
			session.close();
			return true;

		} catch (Exception e) {
			System.out.println("Exception Arised:********************************");
			return false;
		}

	}

	public Category getCategory(int catId) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category where catId=" + catId);
		List<Category> listCat = query.list();
		System.out.println(listCat.get(0));
		session.close();
		return listCat.get(0);
	}

	public Category getCategorybyName(String catName) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category  where catName='" + catName + "'");
		Category category = (Category) query.uniqueResult();
		session.close();
		return category;

	}

	public Category getCategoryById(Integer catId) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.beginTransaction();
		Category category=(Category)session.get(Category.class, catId);
		System.out.println("inside");
		session.close();
		return category;
	}

	
	public boolean updateCategory(Category category) {
		try {
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.saveOrUpdate(category);
			tx.commit();
			session.flush();
			session.close();
			return true;

		} catch (Exception e) {
			System.out.println("Exception Arised:" + e);
			return false;
		}

	}
}
