package com.example.flutterchat.Config;


import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.ConnectListener;
import lombok.extern.java.Log;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class socketConfig {

    private String host = "localhost";
    private int port = 8082;

    @Bean
    public SocketIOServer socketIOServer() {
        com.corundumstudio.socketio.Configuration config = new com.corundumstudio.socketio.Configuration();
        config.setHostname(host);
        config.setPort(port);
        // socket port 번호는 http 통신 포트와 다르게 입력해야 오류 발생하지 않음

        return new SocketIOServer(config);

    }
}
