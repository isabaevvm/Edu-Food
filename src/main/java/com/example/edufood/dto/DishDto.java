package com.example.edufood.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class DishDto {
    private Long id;
    private Long restaurant_id;
    private String name;
    private String description;
    private Double price;
}
