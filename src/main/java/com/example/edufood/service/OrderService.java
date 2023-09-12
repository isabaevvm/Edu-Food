package com.example.edufood.service;

import com.example.edufood.dto.OrderDto;
import com.example.edufood.dto.OrderItemDto;
import com.example.edufood.model.Order;
import com.example.edufood.model.OrderItem;
import com.example.edufood.repository.DishRepository;
import com.example.edufood.repository.OrderRepository;
import com.example.edufood.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class OrderService {
    private final OrderRepository repository;
    private final UserRepository userRepository;
    private final DishRepository dishRepository;

    public void newOrder(OrderDto dto, Authentication auth) {
        User user = (User) auth.getPrincipal();

        if (user == null) {
            return;
        }

        log.info("New order {}", dto.getOrders().toString());

        List<OrderItemDto> orders = dto.getOrders();
        com.example.edufood.model.User customer = userRepository.findUserByEmail(user.getUsername()).orElseThrow(() -> new NoSuchElementException("user not found"));

        Order order = Order.builder()
                .orderDate(LocalDateTime.now())
                .totalPrice(dto.getTotalPrice())
                .user(customer)
                .orderItems(
                        dto.getOrders()
                                .stream()
                                .map(this::makeItemDto)
                                .collect(Collectors.toList()))
                .build();

        saveOrder(order);

    }

    private OrderItem makeItemDto(OrderItemDto dto) {
        return OrderItem.builder()
                .dish(dishRepository.findById(dto.getDishId()).get())
                .quantity(dto.getQuantity())
                .build();
    }

    public void saveOrder(Order order) {
        repository.save(order);
    }

    public Page<OrderDto> getOrdersByUser(Authentication auth, int page, int size, String sort) {
        User user = (User) auth.getPrincipal();
        Long userId = userRepository.findUserByEmail(user.getUsername()).get().getId();

        if (user == null){
            return null;
        }


        Pageable pageable = PageRequest.of(page, size, Sort.by(sort));
        Page<Order> orders = repository.findByUserId(userId, pageable);

        return orders.map(this::makeDto);
    }

    private OrderDto makeDto(Order o) {
        return OrderDto.builder()
                .totalPrice(o.getTotalPrice())
                .orderDate(o.getOrderDate())
                .build();
    }
}
