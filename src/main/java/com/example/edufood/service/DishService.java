package com.example.edufood.service;

import com.example.edufood.dto.DishDto;
import com.example.edufood.model.Dish;
import com.example.edufood.repository.DishRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DishService {
    private final DishRepository repository;

    public Page<DishDto> getDishesByRestaurant(String name, int page, int size, String sort) {
        Pageable pageable = PageRequest.of(page, size, Sort.by(sort));
        Page<Dish> dishes = repository.findByRestaurantName(name, pageable);

        return dishes.map(this::makeDto);
    }

    private DishDto makeDto(Dish dish) {
        return DishDto.builder()
                .id(dish.getId())
                .restaurant_id(dish.getRestaurant().getId())
                .name(dish.getName())
                .description(dish.getDescription())
                .price(dish.getPrice())
                .build();
    }
}
