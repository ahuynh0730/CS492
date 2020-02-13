import 'package:flutter/material.dart';

import 'mainTabController.dart';

class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Me Maybe',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainTabController()
    );
  }
}