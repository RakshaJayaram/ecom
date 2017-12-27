package com.niit.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.niit.model.Category;
import com.niit.model.Supplier;

@Entity
@Table(name = "product")
@Component
public class Product implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int productId;

	
	@NotEmpty(message="productName must Not be empty")
	String productName;
	
	@NotEmpty(message="productDesc must Not be empty")
	String productDesc;
   
	@Min(value=1,message="stock  must be atleast greater than 1")
	int stock;
	
	@Min(value=10,message="price  must be atleast greater than 10")
	int price;

	@ManyToOne
	@JoinColumn(name = "catId", updatable = false, insertable = true, nullable = false)
	private Category category;

	@ManyToOne
	@JoinColumn(name = "supplierId", updatable = false, insertable = true, nullable = false)
	private Supplier supplier;

	@Transient
	MultipartFile pimage;

	// getters +setters

	public MultipartFile getPimage() {
		return pimage;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		System.out.println(" Set category called**************"+category.getCatName()  );
		this.category = category;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public void setPimage(MultipartFile pimage) {
		this.pimage = pimage;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDesc() {
		return productDesc;
	}

	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDesc=" + productDesc
				+ ", stock=" + stock + ", price=" + price + ", category=" + category + ", supplier=" + supplier
				+ ", pimage=" + pimage + "]";
	}

}
