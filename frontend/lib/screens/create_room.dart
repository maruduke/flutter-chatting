import 'package:flutter/material.dart';
import 'package:frontend/services/room_service.dart';

class CreateRoom extends StatelessWidget {
  const CreateRoom({super.key});

  void onPressed(String text) {
    // 방 생성
    RoomService.createRoom(text);
  }

  @override
  Widget build(BuildContext context) {
    final roomName = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("방 생성"),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          TextField(
            controller: roomName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Room name',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () {
              onPressed(roomName.text);
              Navigator.pop(context);
            },
            child: const Text("create Room"),
          ),
        ],
      ),
    );
  }
}
