import 'package:flutter/material.dart';
import 'package:frontend/models/message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  String host = 'localhost';
  String port = '8082';
  String roomName;
  late IO.Socket socket;
  late Function cb;

  SocketService(this.roomName, this.cb) {
    connectRoom(roomName);
  }

  connectRoom(String room) {
    socket = IO.io(
      'http://$host:$port?room=$room',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );
    socket.connect();

    socket.onConnect((_) => debugPrint("socket connect"));
    socket.on("get_message", (data) {
      Message message = Message.fromJson(data as Map<String, dynamic>);
      cb(message);
    });
  }

  sendMessage(String message) {
    Message sendMessage = Message(socket.id!, message, roomName);
    if (socket.id != null) {
      socket.emit("send_message", sendMessage.toJson());
      cb(sendMessage);
    } else {
      debugPrint("socket is null");
    }
  }

  String getSocketId() {
    return socket.id!;
  }
}
