class Room {
  late final int id;
  late final String name;

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
