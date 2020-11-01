import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/login_screen/components/text_field_container.dart';

import '../../../constants.dart';


class RoundedPasswordField extends StatelessWidget {

  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.validator,
    this.controller,
    this.icon = Icons.lock,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            hintText: hintText,
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryColor,

            ),
            border: InputBorder.none,
          ),
        ));
  }
}