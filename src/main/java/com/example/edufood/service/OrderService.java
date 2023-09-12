package com.example.edufood.service;

import com.example.edufood.dto.OrderDto;
import com.example.edufood.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class OrderService {
    private final OrderRepository repository;

    public void newOrder(OrderDto dto) {
        log.info("New order {}", dto.getOrders().toString());
    }
}
