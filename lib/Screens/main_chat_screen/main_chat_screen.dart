import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/components/background.dart';
import 'package:flutter_chat/Screens/components/custom_circular_indicator.dart';
import 'package:flutter_chat/app_bar.dart';
import 'package:flutter_chat/constants.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../message_model.dart';
import '../../user_model.dart';

class MainChatScreen extends StatefulWidget {
  final WebSocketChannel channel;
  final String id;
  final String channelName;
  final String username;

  MainChatScreen(
      {Key key,
      this.channelName,
      this.username,
      @required this.channel,
      this.id})
      : super(key: key);
  @override
  _MainChatState createState() => _MainChatState();
}

final User cuck228 = User(id: 1, name: 'cuck228');
User currentUser = User(id: 0, name: 'jakir0');
List<Message> _messages = [];

class _MainChatState extends State<MainChatScreen> {
  final messageController = TextEditingController();

  @override
  void dispose() {
    widget.channel.sink.close();
    messageController.dispose();
    super.dispose();
  }

  _sendMessage(String messageText) {
    DateTime date = new DateTime.now();
    Message newMessage = Message(
        sender: widget.username,
        messageText: messageText,
        timeSent: '${date.day}/${date.month} ${date.hour}:${date.minute}');
    //_messages.insert(0, newMessage);

    widget.channel.sink.add(newMessage);
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      decoration: kSecondaryGradient,
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.tag_faces), onPressed: null),
          Expanded(
              child: TextField(
            controller: messageController,
            decoration: InputDecoration(
              hintText: 'Type something in chat...',
              border: InputBorder.none,
            ),
          )),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _sendMessage(messageController.text);
                messageController.clear();
              }),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(message.sender != null ? message.sender : ''),
              Text(message.timeSent != null ? message.timeSent : ''),
            ],
          ),
          Text(message.messageText),
        ],
      ),
    );
  }

  @override
  void initState() {
    print('room owner' ' \nroom id ${widget.id}');
    widget.channel.sink.add(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print('connection status ${widget.channel.stream.}' );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: ChatAppBar(
          barTitle: widget.channelName,
          username: widget.username,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  //child:
                  child: StreamBuilder(
                    stream: widget.channel.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
//                        List jsonResponse = json.decode(response.body);
//                        return jsonResponse.map((channel) => new Channel.fromJson(channel)).toList();
                        List jsonResponse = json.decode(snapshot.data);
                        if (jsonResponse != null) {
                        var messages = jsonResponse
                            .map((message) => new Message.fromJson(message))
                            .toList();

                        print('Message list length: ${messages.length}');

                          return ListView.builder(
                              reverse: true,
                              itemCount: messages.length,
                              itemBuilder: (BuildContext context, int index) {
                                //final Message message = new Message(messageText: snapshot.data);
                                bool isMe =
                                    messages[index].sender == widget.username;

                                return _buildMessage(messages[index], isMe);
                              });
                        } else {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(
                                'Wow, such empty! Be the first one to type a message'),
                          );
                        }
                      } else {
                        return CustomCircularIndicator();
                      }
                    },
                  ),
                ),
              ),
              _buildMessageComposer(),
            ],
          ),
        ));
  }
}
