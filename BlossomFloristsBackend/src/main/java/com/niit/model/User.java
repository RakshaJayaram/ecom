package com.niit.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

import com.niit.model.Cart;


@Entity
@Component
@Table
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@NotEmpty(message = "email must Not be empty")
	@Email(message = "Please enter a valid Email Id")
	private String email;
	@NotEmpty(message = "userName must Not be empty")
	private String userName;
	@NotEmpty(message = "userAddress must Not be empty")
	private String userAddress;
	@NotEmpty(message = "Contact number must Not be empty")
	@Size(min=10,max=10,message="Contact number should have 10 digits")
	@Pattern(regexp = "^[0-9]+$",message="Contact number should contain 10 digits")
	private String userContact;
	private String enabled;
	@NotEmpty(message = "password must Not be empty")
	private String password;
	private String role;


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserContact() {
		return userContact;
	}

	public void setUserContact(String userContact) {
		this.userContact = userContact;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
