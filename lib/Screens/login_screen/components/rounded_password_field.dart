import 'package:flutter/material.dart';
import 'package:flutter_chat/Screens/login_screen/components/text_field_container.dart';

import '../../../constants.dart';


class RoundedPasswordField extends StatefulWidget {

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
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: _isObscure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            icon: Icon(
              widget.icon,
              color: kPrimaryColor,
            ),
            suffixIcon: IconButton(icon: Icon(Icons.visibility), onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            } , color: kPrimaryColor,),

            border: InputBorder.none,
          ),
        ));
  }
}