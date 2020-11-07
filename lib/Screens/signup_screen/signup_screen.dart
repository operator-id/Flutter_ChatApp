import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/components/background.dart';
import 'package:flutter_chat/Screens/components/rounded_button.dart';
import 'package:flutter_chat/Screens/login_screen/components/rounded_input_field.dart';
import 'package:flutter_chat/Screens/login_screen/components/rounded_password_field.dart';
import 'package:flutter_chat/Screens/login_screen/login_screen.dart';
import 'package:flutter_chat/api.dart' as api;
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final firstPasswordController = TextEditingController();
  final secondPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _warning = '';

  @override
  void dispose() {
    usernameController.dispose();
    firstPasswordController.dispose();
    secondPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(
                height: size.height * .075,
              ),
              RoundedInputField(
                hintText: "Your username",
                controller: usernameController,
                validator: (value) {
                  if (value.length < 3) {
                    return 'Please complete this field';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                hintText: "Password",
                controller: firstPasswordController,
                validator: (value) {
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                hintText: "Repeat your password",
                controller: secondPasswordController,
                validator: (value) {
                  if (firstPasswordController.text !=
                      secondPasswordController.text) {
                    return 'The passwords must match';
                  }
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(
                height: size.height * .025,
                child: Text(_warning),
              ),
              RoundedButton(
                  text: "Sign Up",
                  press: () {
                    print('username: ' + usernameController.text);
                    if (_formKey.currentState.validate()) {
                      var response = api.registerUser(usernameController.text,
                          firstPasswordController.text);
                      response.whenComplete(() => response.then(
                          (value) => _checkIfRegistrationSuccessful(value)));
                    }
                  })
            ]),
      ),
    ));
  }

  _checkIfRegistrationSuccessful(http.Response response) {
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        ),
      );
    } else if (response.statusCode == 400) {
      setState(() {
        _warning = 'Username already taken';
      });
    } else {
      print('Registration went wrong, status code: ${response.statusCode}');
    }
  }
}
