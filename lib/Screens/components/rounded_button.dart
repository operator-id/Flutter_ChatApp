import 'package:flutter/material.dart';
import 'package:flutter_chat/constants.dart';

class RoundedButton extends StatelessWidget {
  final Function press;
  final String text;
  final Color color, textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

        width: size.width * .8,
        child: ClipRRect(

            borderRadius: BorderRadius.circular(10),

            child:Container(
              decoration: kPrimaryGradient,

            child: FlatButton(

              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              onPressed: press,
              child: Text(
                text,
                style: Theme.of(context).textTheme.button,
              ),
            ),
            )));
  }
}
