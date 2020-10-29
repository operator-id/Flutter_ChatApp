import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/components/background.dart';
import 'package:flutter_chat/Screens/components/rounded_button.dart';
import 'package:flutter_chat/Screens/login_screen/components/login_body.dart';
import 'package:flutter_chat/Screens/login_screen/components/rounded_input_field.dart';
import 'package:flutter_chat/Screens/login_screen/components/rounded_password_field.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

        body: Background(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGN UP",
            style: TextStyle(fontWeight: FontWeight.bold),
           ),
            RoundedInputField(
              hintText: "Your username",
              onChanged: (value){},
            ),
              RoundedPasswordField(
                hintText: "Password",
                onChanged: (value){},
              ),
              RoundedPasswordField(
                hintText: "Repeat your password",
                onChanged: (value){},
              ),
            SizedBox(height: size.height * .025,),
            RoundedButton(
              text: "SIGN UP",
              press: (){}
            )
               ]
        )
        )
    );
  }
}

