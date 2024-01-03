package com.example.flutterchat.Service;

import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.example.flutterchat.Dto.Message.Message;
import com.example.flutterchat.Dto.MessageType;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class SocketServcie {
    private final SocketIOServer socketIOServer;

    public void sendMessage(String room, String eventName, SocketIOClient senderClient, Message message) {
        for(SocketIOClient client : senderClient.getNamespace().getRoomOperations(room).getClients()) {
            System.out.println("client session" + client.getSessionId());
            if(!client.getSessionId().equals(senderClient.getSessionId())) {
                client.sendEvent(eventName, message);
            }
        }
    }

}
