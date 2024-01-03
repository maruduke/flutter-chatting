class Message {
  late final String id;
  late final String message;
  late final String room;

  Message(this.id, this.message, this.room);

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    room = json['room'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['room'] = room;
    return data;
  }
}
