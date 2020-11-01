import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/main_chat_screen/main_chat_screen.dart';
import 'package:flutter_chat/app_bar.dart';
import 'package:flutter_chat/api.dart' as api;
import 'package:flutter_chat/constants.dart';
import 'package:http/http.dart' as http;

class ChannelScreenArguments {
  final String username;
  final String token;
  ChannelScreenArguments(this.username, this.token);
}

class ChannelListScreen extends StatefulWidget {
  final String username;
  static const routeName = '/channel';
  ChannelListScreen({Key key, this.username}) : super(key: key);

  @override
  _ChannelListScreenState createState() => _ChannelListScreenState();
}

class _ChannelListScreenState extends State<ChannelListScreen> {
  final List<String> entries = <String>['Channel A', 'Channel B', 'Channel C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  final addChannelController = TextEditingController();
  bool _isVisible = false;
  @override
  void dispose() {
    addChannelController.dispose();
    super.dispose();
  }

  _addChannel(String channelName){
   var request =  api.addChannel(channelName);
   request.whenComplete(() => request.then((value) =>    print('add channel response status ${value.statusCode} body: ${ value.body}')));

  }
  @override
  Widget build(BuildContext context) {
    final ChannelScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    api.getChannels(args.token);


    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ChatAppBar(
        barTitle: 'Channels',
        username: (widget.username == null) ? args.username : '_offline',
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(121, 194, 243, 1),
                        Color.fromRGBO(255, 180, 239, 1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // background-image: linear-gradient( 114.2deg,  rgba(121,194,243,1) 22.6%, rgba(255,180,239,1) 67.7% );
                    )),
                    height: 50,
                    child: ListTile(
                      title: Text('${entries[index]}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MainChatScreen(
                                channelName: '${entries[index]}',
                                username: args.username,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _isVisible ? 1.0 : 0.0,
            //opacity: .5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 60,
              decoration: kSecondaryGradient,
              child: TextFormField(
                controller: addChannelController,
                decoration: InputDecoration(
                  hintText: 'Add new channel...',
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        onPressed: () {
          // Call setState. This tells Flutter to rebuild the
          // UI with the changes.
          setState(() {
            _isVisible = !_isVisible;
            if(_isVisible) {
              if (addChannelController.text != null) {
                _addChannel(addChannelController.text);
                addChannelController.clear();
              }
            }
          });
        },
        tooltip: 'Add channel',
        child: Icon(
          Icons.add_box,
          size: 50,
          color: kPinkColor,
        ),
      ),
    );
  }
}
