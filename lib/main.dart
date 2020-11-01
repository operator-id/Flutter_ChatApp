import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/channel_list_screen/channel_list_screen.dart';
import 'package:flutter_chat/Screens/welcome_screen/welcome_screen.dart';
import 'package:flutter_chat/constants.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Authorization',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.black45,

        textTheme: TextTheme(
          button: TextStyle(fontSize: 20.0, fontFamily: 'Roboto Slab', color: Colors.white),//R:255, G:47, B:235
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color:   Color.fromRGBO(255, 47, 235, 1)),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
          headline1: TextStyle(fontSize: 40.0, fontFamily: 'Playfair Display', color: Colors.white),
          headline3: TextStyle(fontSize: 28.0, fontFamily: 'Playfair Display', color: Colors.white),

        ),

      ),
      home:  WelcomeScreen(),
      //home: ChannelListScreen(username: '_offline',),
      routes: {ChannelListScreen.routeName: (context) => ChannelListScreen()},
    );

  }
}
