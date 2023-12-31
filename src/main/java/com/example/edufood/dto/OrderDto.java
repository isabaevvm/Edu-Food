package com.example.edufood.dto;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
public class OrderDto {
    private Double totalPrice;
    private List<OrderItemDto> orders;
    private LocalDateTime orderDate;
}
