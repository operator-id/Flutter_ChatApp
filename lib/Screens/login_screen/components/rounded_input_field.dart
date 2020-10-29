import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/login_screen/components/text_field_container.dart';

import '../../../constants.dart';

class RoundedInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.controller,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
