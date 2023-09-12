package com.example.edufood.controller;

import com.example.edufood.dto.OrderDto;
import com.example.edufood.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/order")
@RequiredArgsConstructor
public class OrderRestController {
    private final OrderService service;

    @PostMapping
    public void newOrder(@RequestBody OrderDto dto){
        service.newOrder(dto);
    }
}
