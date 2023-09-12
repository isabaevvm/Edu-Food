package com.example.edufood.controller;

import com.example.edufood.service.DishService;
import com.example.edufood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@Slf4j
public class RestaurantController {
    private final RestaurantService service;
    private final DishService dishService;

    @GetMapping
    public String getAllRestaurants(
            Model model,
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "size", defaultValue = "5") int size
    ) {
        model.addAttribute("restaurants", service.getAllRestaurants(page, size));
        return "restaurants/restaurants";
    }

    @GetMapping("/{name}")
    public String viewRestaurantProfile(
            @PathVariable String name,
            Model model,
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "size", defaultValue = "5") int size,
            @RequestParam(name = "sort", defaultValue = "name") String sort
    ) {
        model.addAttribute("restaurant", service.getRestaurantByName(name));
        model.addAttribute("dishes", dishService.getDishesByRestaurant(name, page, size, sort));

        return "restaurants/profile";
    }
}
