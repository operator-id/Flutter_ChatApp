import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/components/background.dart';
import 'package:flutter_chat/Screens/login_screen/components/rounded_input_field.dart';
import 'package:flutter_chat/Screens/login_screen/components/rounded_password_field.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {},
            ),
            SizedBox(
              height: size.height * .025,
            ),
            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {},
            )
          ],
        ),
      ),
    );
  }
}
