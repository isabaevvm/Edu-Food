package com.example.edufood.service;

import com.example.edufood.dto.RestaurantDto;
import com.example.edufood.model.Restaurant;
import com.example.edufood.repository.RestaurantRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class RestaurantService {
    private final RestaurantRepository repository;

    public Page<RestaurantDto> getAllRestaurants(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Restaurant> restaurants = repository.findAll(pageable);

        return restaurants.map(this::makeDto);
    }

    private RestaurantDto makeDto(Restaurant r) {
        return RestaurantDto.builder()
                .id(r.getId())
                .name(r.getName())
                .build();
    }

    public RestaurantDto getRestaurantById(Long id){
        return makeDto(repository.findById(id).get());
    }

    public List<RestaurantDto> searchRestaurant(String search) {
        List<Restaurant> restaurants = repository.searchByNameContainingIgnoreCase(search);

        return restaurants.stream().map(this::makeDto).collect(Collectors.toList());
    }

    public RestaurantDto getRestaurantByName(String name) {
        return makeDto(repository.findByName(name).orElseThrow(() -> new NoSuchElementException("restaurant not found")));
    }
}
