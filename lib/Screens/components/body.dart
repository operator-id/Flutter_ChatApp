import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/components/background.dart';
import 'package:flutter_chat/Screens/components/rounded_button';
import 'package:flutter_chat/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Log in",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

              RoundedButton(
                text: "Login",
                press: (){},
              ),
               RoundedButton(
                text: "Register",
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press: (){},
              ),


        ],
      ),
    );
  }
}

