package com.Jan.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.Jan.model.OrderItem;

public interface OrderItemRepo extends JpaRepository<OrderItem, Long> {
	
}
