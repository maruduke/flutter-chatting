package com.example.flutterchat.Dto;

import lombok.AllArgsConstructor;
import lombok.Getter;


@Getter
public class RoomResponse {
    private Long id;
    private String name;

    public RoomResponse(Long id, String name) {
        this.id = id;
        this.name = name;
    }
}
