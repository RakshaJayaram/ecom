package com.niit.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

import com.niit.model.Product;

@Entity
@Table(name = "supplier")
@Component
public class Supplier implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int supplierId;

	@NotEmpty(message = "supplierName must Not be empty")
	String supplierName;

	@NotEmpty(message = "supplierAddress must Not be empty")
	String supplierAddress;

	@OneToMany(mappedBy = "supplier", fetch = FetchType.EAGER)
	private List<Product> products;

	// getters +setters

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierAddress() {
		return supplierAddress;
	}

	public void setSupplierAddress(String supplierAddress) {
		this.supplierAddress = supplierAddress;
	}
}
