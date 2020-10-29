import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/components/background.dart';
import 'package:flutter_chat/Screens/components/rounded_button.dart';
import 'package:flutter_chat/Screens/login_screen/components/rounded_input_field.dart';
import 'package:flutter_chat/Screens/login_screen/components/rounded_password_field.dart';
import 'package:flutter_chat/Screens/main_chat_screen/main_chat_screen.dart';
import 'package:flutter_chat/Screens/signup_screen/signup_screen.dart';
import 'package:flutter_chat/constants.dart';

class LoginBody extends StatelessWidget {
  final myController = TextEditingController();



  //http status ok
  //http unauthorized
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          RoundedInputField(
            hintText: "Username",
            controller: myController,
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            hintText: "Password",
            onChanged: (value) {},
          ),
          SizedBox(
            height: size.height * .025,
          ),
          RoundedButton(
            text: "LOGIN",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MainChatScreen(username: myController.text,);
                  },
                ),
              );
            },
          ),
          SizedBox(
            height: size.height * .0125,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Don't have an account?",
                //style: TextStyle(color: kPrimaryColor),
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
    );
  }
}
