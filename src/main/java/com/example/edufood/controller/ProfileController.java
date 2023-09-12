package com.example.edufood.controller;

import com.example.edufood.service.OrderService;
import com.example.edufood.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class ProfileController {
    private final UserService service;
    private final OrderService orderService;

    @GetMapping("/profile")
    public String getProfilePage(
            Authentication auth,
            Model model,
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "size", defaultValue = "5") int size,
            @RequestParam(name = "sort", defaultValue = "orderDate") String sort
    ) {
        User user = (User) auth.getPrincipal();

        model.addAttribute("user", service.getUserByEmail(user.getUsername()));
        model.addAttribute("orders", orderService.getOrdersByUser(auth, page, size, sort));
        return "users/profile";
    }
}
