package com.Jan.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Jan.model.UserQuery;

@Repository
public interface UserQueryRepo extends JpaRepository<UserQuery, Integer> {

}
