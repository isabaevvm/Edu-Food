package com.example.edufood.repository;

import com.example.edufood.model.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {

    List<Restaurant> searchByNameContainingIgnoreCase(String name);

    Optional<Restaurant> findByName(String name);
}
