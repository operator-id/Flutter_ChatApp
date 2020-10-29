import 'package:flutter/material.dart';
import 'file:///C:/Users/L440/Desktop/Teme/flutter_chat/lib/Screens/welcome_screen/welcome_screen.dart';
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
        scaffoldBackgroundColor: Colors.black12,
      ),
      home: WelcomeScreen(),
    );

  }
}
