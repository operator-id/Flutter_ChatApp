import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/login_screen/components/text_field_container.dart';

import '../../../constants.dart';

class RoundedInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key key,
    this.controller,
    this.validator,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);
  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}
  class _RoundedInputFieldState extends State<RoundedInputField>{

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: kPrimaryColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
