package com.example.edufood.service;

import com.example.edufood.dto.RestaurantDto;
import com.example.edufood.model.Restaurant;
import com.example.edufood.repository.RestaurantRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class RestaurantService {
    private final RestaurantRepository repository;

    public Page<RestaurantDto> getAllRestaurants(int page, int size){
        Pageable pageable = PageRequest.of(page, size);
        Page<Restaurant> restaurants = repository.findAll(pageable);

        return restaurants.map(this::makeDto);
    }

    private RestaurantDto makeDto(Restaurant r){
        return RestaurantDto.builder()
                .id(r.getId())
                .name(r.getName())
                .build();
    }
}
