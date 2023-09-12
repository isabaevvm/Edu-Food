package com.example.edufood.service;

import com.example.edufood.dto.OrderDto;
import com.example.edufood.dto.OrderItemDto;
import com.example.edufood.model.Order;
import com.example.edufood.repository.DishRepository;
import com.example.edufood.repository.OrderRepository;
import com.example.edufood.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.NoSuchElementException;

@Service
@RequiredArgsConstructor
@Slf4j
public class OrderService {
    private final OrderRepository repository;
    private final UserRepository userRepository;
    private final DishRepository dishRepository;

    public void newOrder(OrderDto dto, Authentication auth) {
        User user = (User) auth.getPrincipal();

        if (user == null){
            return;
        }

        log.info("New order {}", dto.getOrders().toString());

        List<OrderItemDto> orders = dto.getOrders();
        com.example.edufood.model.User customer = userRepository.findUserByEmail(user.getUsername()).orElseThrow(() -> new NoSuchElementException("user not found"));

        for(OrderItemDto o : orders){
            Order order = Order.builder()
                    .orderDate(LocalDateTime.now())
                    .user(customer)
                    .build();

            saveOrder(order);
        }

    }

    public void saveOrder(Order order){
        repository.save(order);
    }
}
