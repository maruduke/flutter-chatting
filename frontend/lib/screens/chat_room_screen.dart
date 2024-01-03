import 'package:flutter/material.dart';
import 'package:frontend/models/message.dart';
import 'package:frontend/services/socket_service.dart';
import 'package:frontend/widgets/message_box.dart';

// message 방마다 전송하는데 문제 발생 Spring에서 응답 없음 해결확인
class ChatRoomScreen extends StatefulWidget {
  final String roomName;

  const ChatRoomScreen({super.key, required this.roomName});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoomScreen> {
  final _messageController = TextEditingController();
  late final String roomName;
  late final SocketService socketService;
  List<Message> messages = [];

  void getMessage(Message message) {
    setState(() {
      messages.add(message);
      debugPrint('$messages.length');
    });
  }

  @override
  void initState() {
    roomName = widget.roomName;
    socketService = SocketService(roomName, getMessage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(roomName),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 10),
                reverse: false,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  if (messages.isNotEmpty) {
                    if (messages[index].id == socketService.getSocketId()) {
                      // 자신의 메시지 오른쪽 배치
                      return MessageBox(
                        boxColor: Colors.yellow,
                        isMe: true,
                        message: messages[index].message,
                      );
                    } else {
                      // 타인의 메시지 왼쪽 정렬
                      return MessageBox(
                        boxColor: Colors.white,
                        isMe: false,
                        message: messages[index].message,
                      );
                    }
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            Container(
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: _messageController,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (_messageController.text != "") {
                          debugPrint("onpressed send");
                          socketService.sendMessage(_messageController.text);

                          debugPrint("test");
                          _messageController.text = "";
                        }
                      },
                      icon: const Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
