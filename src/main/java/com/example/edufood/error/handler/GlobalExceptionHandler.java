package com.example.edufood.error.handler;


import com.example.edufood.error.ResourceNotFoundException;
import com.example.edufood.service.ErrorService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.tomcat.util.http.fileupload.impl.FileSizeLimitExceededException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpClientErrorException;

import java.util.NoSuchElementException;

@RequiredArgsConstructor
@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {
    private final ErrorService errorService;

    @ExceptionHandler(MethodArgumentNotValidException.class)
    private ResponseEntity<?> methodArgumentNotValidHandler(MethodArgumentNotValidException exception) {
        return new ResponseEntity<>(errorService.makeBody(exception.getBindingResult()), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(NoSuchElementException.class)
    private String noSuchElementException(Model model) {
        model.addAttribute("errorCode", HttpStatus.NOT_FOUND.value());
        model.addAttribute("reason", HttpStatus.NOT_FOUND.getReasonPhrase());
        return "error";
    }


    @ExceptionHandler(ResourceNotFoundException.class)
    public String handleResourceNotFoundException(ResourceNotFoundException ex, Model model) {
        model.addAttribute("errorCode", HttpStatus.BAD_REQUEST.value());
        model.addAttribute("reason", ex.getMessage());
        return "error";
    }

    @ExceptionHandler(FileSizeLimitExceededException.class)
    private String fileSizeHandler(FileSizeLimitExceededException exception, Model model) {
        model.addAttribute("errorCode", HttpStatus.BAD_REQUEST.value());
        model.addAttribute("reason", exception.getMessage());
        return "error";
    }

    @ExceptionHandler(NullPointerException.class)
    private String fileSizeHandler(NullPointerException exception, Model model) {
        model.addAttribute("errorCode", HttpStatus.BAD_REQUEST.value());
        model.addAttribute("reason", exception.getMessage());
        return "error";
    }

    @ExceptionHandler(HttpClientErrorException.BadRequest.class)
    private String badRequest(Model model) {
        model.addAttribute("errorCode", HttpStatus.BAD_REQUEST.value());
        model.addAttribute("reason", HttpStatus.BAD_REQUEST.getReasonPhrase());
        return "error";
    }

    @ExceptionHandler({AccessDeniedException.class})
    private String unauthorized(Model model) {
        model.addAttribute("errorCode", HttpStatus.UNAUTHORIZED.value());
        model.addAttribute("errorCode", HttpStatus.UNAUTHORIZED.getReasonPhrase());
        return "error";
    }
}
