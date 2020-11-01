import 'package:flutter_chat/user_model.dart';

class Message{
  final User sender;
  final String messageText;
  final String timeSent;

  Message({
    this.sender,
    this.messageText,
    this.timeSent,
});
}