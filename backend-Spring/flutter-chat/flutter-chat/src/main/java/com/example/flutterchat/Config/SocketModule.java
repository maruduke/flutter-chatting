package com.example.flutterchat.Config;

import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.annotation.OnConnect;
import com.corundumstudio.socketio.listener.ConnectListener;
import com.corundumstudio.socketio.listener.DataListener;
import com.corundumstudio.socketio.listener.DisconnectListener;
import com.example.flutterchat.Dto.Message.Message;
import com.example.flutterchat.Service.SocketServcie;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
public class SocketModule {
    private final SocketIOServer server;
    private final SocketServcie socketServcie;

    public SocketModule(SocketIOServer server, SocketServcie socketServcie) {
        this.server = server;
        this.socketServcie = socketServcie;

        server.addConnectListener(onConnected());
        server.addDisconnectListener(onDisconnected());

        server.addEventListener("test", String.class, onTest());
        server.addEventListener("send_message", Message.class, onChatReceived());
    }

    private DataListener<String> onTest() {
        return (senderClient, data, ackSender) -> {System.out.println(data);};
    };
    private ConnectListener onConnected() {
        return (client) -> {
            System.out.println("connect client");
            // url 파싱 ex) http://localhost:8082?room=RoomName
            String room = client.getHandshakeData().getSingleUrlParam("room");
            client.joinRoom(room);
        };
    }

    private DisconnectListener onDisconnected() {
        return (client) -> {
            System.out.println("Client Disconnected from socket" + client.getSessionId().toString());
        };
    }



    private DataListener<Message> onChatReceived() {

        return (senderClient, data, ackSender) -> {
            System.out.println("send message");
            socketServcie.sendMessage(data.getRoom(), "get_message", senderClient, data);
        };
    }
}
