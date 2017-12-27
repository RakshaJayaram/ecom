package com.niit.dao;

import java.util.List;

import com.niit.model.Supplier;

public interface SupplierDao {
	public boolean addSupplier(Supplier supplier);

	public List<Supplier> retriveSupplier();

	public boolean deleteSupplier(Supplier supplier);

	public Supplier getSupplier(int supplierId);

	public boolean updateSupplier(Supplier supplier);

	public Supplier getSupplierbyName(String supplierName);

}
