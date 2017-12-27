package com.niit.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.dao.SupplierDao;
import com.niit.model.Supplier;

@Repository("supplierDao")
@Transactional
public class SupplierDaoImpl implements SupplierDao {
	
	@Autowired
	SessionFactory sessionFactory;

	public boolean addSupplier(Supplier supplier) {
		try {
			sessionFactory.getCurrentSession().save(supplier);
			return true;

		} catch (Exception e) {

			return false;
		}
	}

	public List<Supplier> retriveSupplier() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Supplier");
		List<Supplier> listSupplier = query.list();
		session.close();

		return listSupplier;

	}

	public boolean deleteSupplier(Supplier supplier) {
		try {
			sessionFactory.getCurrentSession().delete(supplier);
			return true;

		} catch (Exception e) {

			return false;
		}
	}

	public Supplier getSupplier(int supplierId) {
		Session session = sessionFactory.openSession();
		Supplier supplier = (Supplier) session.get(Supplier.class, supplierId);
		session.close();
		return supplier;
	}

	public boolean updateSupplier(Supplier supplier) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(supplier);
			return true;

		} catch (Exception e) {
			System.out.println("Exception Arised:" + e);
		}
		return false;
	}

	public Supplier getSupplierbyName(String supplierName) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Supplier  where supplierName='" + supplierName + "'");
		Supplier supplier = (Supplier) query.uniqueResult();
		return supplier;

	}
}
