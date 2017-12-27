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
@Table(name = "Category")
@Component
public class Category implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int catId;

	@NotEmpty(message = "catName must Not be empty")
	String catName;

	@NotEmpty(message = "catDesc must Not be empty")
	String catDesc;

	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
	private List<Product> products;

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public String getCatDesc() {
		return catDesc;
	}

	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}

	
	/*  @Override public String toString() { return "Category [catId=" + catId +
	  ", catName=" + catName + ", catDesc=" + catDesc + ", products=" +
	  products + "]"; }*/
	 

}
