import 'package:flutter/material.dart';

import  'constants.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String barTitle;
  final String username;
  const ChatAppBar({
    this.barTitle,
    this.username = '_not_connected',
    Key key,

  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(barTitle),
      actions: <Widget>[
        Row(
          children: <Widget>[
            Text(username),
            IconButton(icon: Icon(Icons.account_circle), onPressed: () {})
          ],
        )
      ],
    );
  }
}