package com.example.edufood.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class DishDto {
    private Long id;
    private RestaurantDto restaurant;
    private String name;
    private String description;
    private Float price;
}
