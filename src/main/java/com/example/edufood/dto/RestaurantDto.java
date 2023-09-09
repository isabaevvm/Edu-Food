package com.example.edufood.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class RestaurantDto {
    private final Long id;
    private final String name;
}
