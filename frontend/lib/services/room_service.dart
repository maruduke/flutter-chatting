import "dart:convert";

import "package:frontend/models/room_data.dart";
import "package:http/http.dart" as http;

class RoomService {
  static const String baseurl = "http://localhost:8080";
  static const String room = "room";

  static Future<List<Room>> getRoomList() async {
    final List<Room> roomInstances = [];

    final url = Uri.parse("$baseurl/$room");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> rooms = jsonDecode(response.body);

      for (var room in rooms) {
        roomInstances.add(Room.fromJson(room));
      }

      return roomInstances;
    }
    throw Error();
  }

  static void createRoom(String roomName) async {
    final url = Uri.parse("$baseurl/$room");
    final response = await http.post(url, body: roomName);

    if (response.statusCode == 200) {
      print("create room");
    }
    throw Error();
  }
}
