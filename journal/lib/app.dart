import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:journal/screens/newEntry.dart';
import 'screens/homepage.dart';


class MyApp extends StatelessWidget {

  static final routes = {
    MyHomePage.routeName: (context) => MyHomePage(),
    NewEntryPage.routeName: (context) => NewEntryPage(),
  };

  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => new ThemeData(
        primarySwatch: Colors.indigo,
        brightness: brightness,
      ),
      themedWidgetBuilder: (context, theme){
        return new MaterialApp(
          title: 'Journal',
          theme: theme,
          routes: routes,
        );
      }
    );
  }
}
