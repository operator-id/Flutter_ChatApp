import 'package:flutter_chat/user_model.dart';

class Message{
  final String id;
  final String sender;
  final String messageText;
  final String timeSent;

  Message({this.id,
    this.sender,
    this.messageText,
    this.timeSent,
});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      //TODO
      id: json['id'],
      sender: json['sender'],
      messageText: json['text'],
      timeSent: json['date'],
    );
  }
}