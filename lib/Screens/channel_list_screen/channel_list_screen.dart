import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/components/rounded_button.dart';
import 'package:flutter_chat/Screens/main_chat_screen/main_chat_screen.dart';
import 'package:flutter_chat/app_bar.dart';
import 'package:flutter_chat/api.dart' as api;
import 'package:flutter_chat/channel_model.dart';
import 'package:flutter_chat/constants.dart';
import 'package:http/http.dart' as http;

import '../../api.dart';

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
  final addChannelController = TextEditingController();
  bool _isVisible = false;
  @override
  void dispose() {
    addChannelController.dispose();
    super.dispose();
  }

  ListView _channelListView(data, String username) {


        return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              {
                return _tile(data[index].name, Icons.message, username);
              }

            });

  }

  ListTile _tile(String title, IconData icon, String username) => ListTile(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainChatScreen(username: username , channelName: title,);
          },
        ),
      );
    },
    tileColor: Colors.white,
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );

  _addChannel(String channelName) {
    var request = api.addChannel(channelName);
    request.whenComplete(() => request.then((value) => print(
        'add channel response status ${value.statusCode} body: ${value.body}')));
  }

  @override
  Widget build(BuildContext context) {
    final ChannelScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ChatAppBar(
        barTitle: 'Channels',
        username: (widget.username == null) ? args.username : '_offline',
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: FutureBuilder<List<Channel>>(
            future: fetchChannels(args.token),
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                List<Channel> data = snapshot.data;
                print('Has data ${snapshot.data[0].name}');
                return _channelListView(data, args.username);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          )),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _isVisible ? 1.0 : 0.0,
            //opacity: .5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: 60,
              decoration: kSecondaryGradient,
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    controller: addChannelController,
                    decoration: InputDecoration(
                      hintText: 'Add new channel...',
                    ),
                  ),
                ),
              ]),
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

            if (addChannelController.text.trim().isNotEmpty) {
              print('not empty');
              _addChannel(addChannelController.text);
              addChannelController.clear();
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
