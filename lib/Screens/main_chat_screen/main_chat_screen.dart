import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/components/background.dart';
import 'package:flutter_chat/app_bar.dart';
import 'package:flutter_chat/constants.dart';

import '../../message_model.dart';
import '../../user_model.dart';


class MainChatScreen extends StatefulWidget {
  final String channelName;
  final String username;

  MainChatScreen({Key key, this.channelName, this.username}) : super(key: key);
  @override
  _MainChatState createState() => _MainChatState();
}

final User cuck228 = User(id: 1, name: 'cuck228');
 User currentUser = User(id: 0, name:  'jakir0');
List<Message> messages = [
  Message(
      sender: currentUser,
      messageText: 'message from current user, should be right',
      timeSent: '22:00'),
  Message(sender: cuck228, messageText: 'mom, im on tv', timeSent: '22:02'),
  Message(sender: cuck228, messageText: 'fuck me im famous', timeSent: '22:03'),
];

class _MainChatState extends State<MainChatScreen> {
  final messageController = TextEditingController();

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
  _sendMessage(String messageText){
    DateTime date = new DateTime.now();
    Message newMessage = Message(
      sender: currentUser,
      messageText: messageText,
      timeSent: '${date.hour}:${date.minute}'
    );
    messages.insert(0, newMessage);
  }
  _buildMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      decoration: kSecondaryGradient,
      child: Row(
        children:<Widget> [
          IconButton(icon: Icon(Icons.tag_faces), onPressed: null),
          Expanded(
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Type something in chat...',
                  border: InputBorder.none,
                ),
              )),
          IconButton(icon: Icon(Icons.send), onPressed: (){
            _sendMessage(messageController.text);
            messageController.clear();
          } ),
        ],
      ),
    );
  }
  _buildMessage(Message message, bool isMe) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: isMe ? kLightMessageGradient : kDarkMessageGradient,
      margin: isMe
          ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
          : EdgeInsets.only(top: 8, bottom: 8, right: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceBetween,
            children: [
              Text(message.sender.name),
              Text(message.timeSent),
            ],
          ),
          Text(message.messageText),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: ChatAppBar(barTitle: widget.channelName, username: widget.username,),

        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ListView.builder(
                    reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        bool isMe = message.sender.id == currentUser.id;
                        return _buildMessage(message, isMe);
                      }),
                ),
              ),
              _buildMessageComposer(),
            ],
          ),
        ));
  }
}
