import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  final title;
  MyAppBar({Key key, this.title, this.scaffoldKey}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  final Size preferredSize;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: Text(title),),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () => scaffoldKey.currentState.openEndDrawer()
        ),
      ],
    );
  }
}