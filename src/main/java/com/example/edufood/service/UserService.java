package com.example.edufood.service;

import com.example.edufood.dto.UserDto;
import com.example.edufood.model.User;
import com.example.edufood.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.NoSuchElementException;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {
    private final UserRepository repository;
    private final PasswordEncoder encoder;

    public void createUser(UserDto userDto){
        User user = User.builder()
                .email(userDto.getEmail())
                .password(encoder.encode(userDto.getPassword()))
                .build();

        repository.save(user);
        log.info("New user: {}", userDto);
    }

    public UserDto getUserByEmail(String email) {
        User user = repository.findUserByEmail(email).orElseThrow(() -> new NoSuchElementException("user not found"));
        return UserDto.builder().id(user.getId()).email(user.getEmail()).build();
    }
}
