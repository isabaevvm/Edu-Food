package com.example.edufood.error;

import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.SneakyThrows;

import java.util.List;

@Builder
@Getter
@Setter
public class ErrorResponseBody {
    private String title;
    private List<String> reasons;

    @SneakyThrows
    @Override
    public String toString() {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(this);
    }
}
