import 'package:flutter_chat/user_model.dart';

class Message{
  final String sender;
  final String messageText;
  final String timeSent;

  Message({
    this.sender,
    this.messageText,
    this.timeSent,
});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      //TODO
      sender: json['id'],
      messageText: json['name'],
      timeSent: json[''],
    );
  }
}