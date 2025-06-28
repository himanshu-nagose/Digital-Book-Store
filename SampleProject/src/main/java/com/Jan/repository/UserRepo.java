package com.Jan.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.Jan.model.User;

public interface UserRepo extends JpaRepository<User, Integer>{
	public User findByEmailid(String emailid); 
}
