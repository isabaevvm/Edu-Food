package com.example.edufood.controller;

import com.example.edufood.dto.RestaurantDto;
import com.example.edufood.service.RestaurantService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/restaurants")
@RequiredArgsConstructor
public class RestaurantRestController {
    private final RestaurantService service;

    @GetMapping("/search/{name}")
    public List<RestaurantDto> searchRestaurant(@PathVariable String name){
        return service.searchRestaurant(name);
    }
}
