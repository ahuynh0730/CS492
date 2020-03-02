import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class SettingsDrawer extends StatelessWidget {

  void changeBrightness(BuildContext context) {
    DynamicTheme.of(context).setBrightness(Theme.of(context).brightness == Brightness.dark? Brightness.light: Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Settings'),
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: IconButton(
              icon: Icon(
                Icons.lightbulb_outline,
              ), 
              onPressed: (){changeBrightness(context);}
            ),
          ),
        ],
      ),
    );
  }
}