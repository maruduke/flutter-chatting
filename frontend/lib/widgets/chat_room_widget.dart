import 'package:flutter/material.dart';
import 'package:frontend/models/room_data.dart';

class chatRoom extends StatelessWidget {
  final Room room;
  const chatRoom({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Text('test: ${room.name} : ${room.id}');
  }
}
