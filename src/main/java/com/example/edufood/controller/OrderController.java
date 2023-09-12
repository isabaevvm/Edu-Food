package com.example.edufood.controller;

import com.example.edufood.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class OrderController {
    private final OrderService service;

    @GetMapping
    public String getCartPage(){
        return "orders/cart";
    }
}
