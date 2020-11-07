import 'package:flutter/material.dart';
import 'package:flutter_chat/constants.dart';

class RoundedListElement extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color, textColor;

  const RoundedListElement({
    Key key,
    this.text,
    this.onTap,
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: kPrimaryGradient,
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                onPressed: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Text(
                        
                        text,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
