package com.Jan.model;

import javax.persistence.*;

import java.util.List;

@Entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;

    private String name;
    private String mobileno;
    private String city;
    private String emailid;

    @Column(name = "password", nullable = false, length = 255)
    private String password;

    // New Profile Fields
    private String address;
    private String pincode;
    private String country;
    private String landmark;
    private String gender;
    private String genre;  // Preferred genre
    private String dob;

    // Order mapping
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Order> orders;
    
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobileno() {
		return mobileno;
	}
	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getLandmark() {
		return landmark;
	}
	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", name=" + name + ", mobileno=" + mobileno + ", city=" + city + ", emailid="
				+ emailid + ", password=" + password + ", address=" + address + ", pincode=" + pincode + ", country="
				+ country + ", landmark=" + landmark + ", gender=" + gender + ", genre=" + genre + ", dob=" + dob + "]";
	}
	
	public User(int userId, String name, String mobileno, String city, String emailid, String password, String address,
			String pincode, String country, String landmark, String gender, String genre, String dob) {
		super();
		this.userId = userId;
		this.name = name;
		this.mobileno = mobileno;
		this.city = city;
		this.emailid = emailid;
		this.password = password;
		this.address = address;
		this.pincode = pincode;
		this.country = country;
		this.landmark = landmark;
		this.gender = gender;
		this.genre = genre;
		this.dob = dob;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}    
}
