import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/channel_list_screen/rounded_list_element.dart';
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
  final _addChannelController = TextEditingController();
  bool _isVisible = false;
  @override
  void dispose() {
    _addChannelController.dispose();
    super.dispose();
  }

  _validate(String input) {
    if (input.trim().isNotEmpty) {
      print('input not empty, channel name: $input');
      _addChannel(input);
      _addChannelController.clear();
    }
  }

  ListView _channelListView(data, String username) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: data.length,
        padding: EdgeInsets.only(bottom: 30,),
        itemBuilder: (context, index) {
          {
            return RoundedListElement(text: data[index].name, onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainChatScreen(
                      username: username,
                      channelName: data[index].name,
                    );
                  },
                ),
              );
            },);
              //_tile(data[index].name, username);
          }
        }, separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 10,);
    },);
  }


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
                    onFieldSubmitted: (String value) {
                      _validate(value);
                    },
                    controller: _addChannelController,
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
