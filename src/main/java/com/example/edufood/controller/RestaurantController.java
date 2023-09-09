package com.example.edufood.controller;

import com.example.edufood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class RestaurantController {
    private final RestaurantService service;

    @GetMapping
    public String getAllRestaurants(
            Model model,
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "size", defaultValue = "5") int size
    ){
        model.addAttribute("restaurants", service.getAllRestaurants(page, size));
        return "restaurants";
    }
}
