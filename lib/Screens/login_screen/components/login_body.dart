import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/channel_list_screen/channel_list_screen.dart';
import 'package:flutter_chat/Screens/components/background.dart';
import 'package:flutter_chat/Screens/components/rounded_button.dart';
import 'package:flutter_chat/Screens/login_screen/components/rounded_input_field.dart';
import 'package:flutter_chat/Screens/login_screen/components/rounded_password_field.dart';
import 'package:flutter_chat/Screens/signup_screen/signup_screen.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_chat/api.dart' as api;

const String Unauthorized = 'Login failed, username not found';

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _status;


  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void continueToChat(http.Response response) {
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ChannelListScreen();
          },
        ),
      );
    } else {
      print('LOGIN unsuccessful');
      if (response != null) print(response.body);
      setState(() {

        _status = 'TRY THAT...AGAIN!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login",

          style:   Theme.of(context).textTheme.headline3,),
            SizedBox(
              height: size.height * .075,
            ),
            RoundedInputField(
              hintText: "Username",
              controller: usernameController,
              validator: (value) {
                return value.isEmpty ? 'Please complete this field' : null;
              },
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              controller: passwordController,
              validator: (value) {
                return value.isEmpty ? 'Please complete this field' : null;
              },
              onChanged: (value) {},
            ),
            SizedBox(
              height: size.height * .025,
            ),
            RoundedButton(
              text: "Login",
              press: () {
                {
                  if (_formKey.currentState.validate()) {
                    var response = api.loginUser(
                        usernameController.text, passwordController.text);
                    response.whenComplete(
                        () => response.then((value) => continueToChat(value)));
                  }
                }
              },
            ),
            SizedBox(
              height: size.height * .0125,
            ),
            Text((_status == null) ?  "" :  _status,
            style:   Theme.of(context).textTheme.bodyText2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
