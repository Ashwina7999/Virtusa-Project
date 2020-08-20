package com.virtusa.hiring.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Reg {
	
	@Id
	private String email;
	private String name;
	private String password;
	private String gender;
	private String phone;
	private String city;
	private String country;
	
	
	public Reg() {

	}
	
	
	public Reg(String email, String name, String password, String gender, String phone, String city, String country) {
		super();
		this.email = email;
		this.name = name;
		this.password = password;
		this.gender = gender;
		this.phone = phone;
		this.city = city;
		this.country = country;
	}



	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
	

	@Override
	public String toString() {
		return "register [name=" + name + ", email=" + email + ", password=" + password + ", gender=" + gender
				+ ", phone=" + phone + ", city=" + city + ", country=" + country + "]";
	}
	
	
	
	

	

}
