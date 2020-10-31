import 'package:flutter/material.dart';
import 'package:flutter_chat/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      color: Colors.black45,

      child: Stack(

        alignment: Alignment.center,
        children: <Widget>[

          child,
        ],
      ),
    );
  }
}
