import 'package:flutter/material.dart';
import 'package:frontend/models/room_data.dart';
import 'package:frontend/screens/chat_room_screen.dart';
import 'package:frontend/screens/create_room.dart';
import 'package:frontend/services/room_service.dart';
import 'package:frontend/widgets/chat_room_widget.dart';

// 대화 room 보여주기
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final Future<List<Room>> rooms = RoomService.getRoomList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('chat room'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateRoom(),
                  ),
                );
              },
              icon: const Icon(Icons.create))
        ],
      ),
      body: FutureBuilder(
        future: rooms,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return makeList(snapshot);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<Room>> snapshot) {
    return ListView.separated(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        Room room = snapshot.data![index];
        return TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatRoomScreen(roomName: room.name),
              ),
            );
          },
          child: chatRoom(room: room),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
