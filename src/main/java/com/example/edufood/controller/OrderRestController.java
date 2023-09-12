package com.example.edufood.controller;

import com.example.edufood.dto.OrderDto;
import com.example.edufood.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/order")
@RequiredArgsConstructor
public class OrderRestController {
    private final OrderService service;

    @PostMapping
    public ResponseEntity<?> newOrder(@RequestBody OrderDto dto, Authentication auth){
        service.newOrder(dto, auth);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
