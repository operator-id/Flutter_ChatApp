import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/components/background.dart';

class MainChatScreen extends StatefulWidget {
  final String username;
  MainChatScreen({Key key, this.username}) : super (key: key);
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
                   "Hello, " + widget.username,

               )
             ],
           ),

         )
     );
   }
 }