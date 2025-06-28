package com.Jan.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Jan.model.Order;
import com.Jan.model.User;

//public interface OrderRepo extends JpaRepository<Order, Long> {
//	List<Order> findByUserOrderByOrderDateDesc(User user);
//	
//	List<Order> findByUser(User user);
//	
//}

@Repository
public interface OrderRepo extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);
}

