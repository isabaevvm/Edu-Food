package com.example.edufood.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class OrderController {

    @GetMapping("/cart")
    public String getCartPage() {
        return "orders/cart";
    }
}
