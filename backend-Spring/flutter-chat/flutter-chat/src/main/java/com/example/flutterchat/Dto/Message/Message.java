package com.example.flutterchat.Dto.Message;

import com.example.flutterchat.Dto.MessageType;
import lombok.Getter;

@Getter
public class Message {

    private String id;
    private String message;
    private String room;

    public Message() {
    }


}

