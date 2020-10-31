import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/components/background.dart';
import 'package:flutter_chat/constants.dart';

class MainChatScreen extends StatefulWidget {
  final String channelName;
  MainChatScreen({Key key, this.channelName}) : super (key: key);
  @override
  _MainChatState createState() => _MainChatState();
}
 class _MainChatState extends State<MainChatScreen> {

  @override
  void initState(){
    super.initState();
  }
   @override
   Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     return Scaffold(
         body: Background(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text(

                   "Welcome to " + widget.channelName,

    style: Theme.of(context).textTheme.bodyText1,
               )
             ],
           ),

         )
     );
   }
 }