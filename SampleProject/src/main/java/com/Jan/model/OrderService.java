package com.Jan.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Jan.repository.OrderRepo;

@Service
public class OrderService {

    @Autowired
    private OrderRepo orderRepository;

    public List<Order> getOrdersByUser(User user) {
        return orderRepository.findByUser(user);
    }
}

