package com.Jan.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserQuery {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int queryno;
	private String name;
	private String email;
	private String subject;
	private String userquery;
	
	public UserQuery() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public UserQuery(int queryno, String name, String email, String subject, String userquery) {
		super();
		this.queryno = queryno;
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.userquery = userquery;
	}
	
	@Override
	public String toString() {
		return "Contact [queryno=" + queryno + ", name=" + name + ", email=" + email + ", subject=" + subject
				+ ", userquery=" + userquery + "]";
	}
	
	public int getQueryno() {
		return queryno;
	}
	public void setQueryno(int queryno) {
		this.queryno = queryno;
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getUserQuery() {
		return userquery;
	}
	public void setUserQuery(String userquery) {
		this.userquery = userquery;
	}
}
