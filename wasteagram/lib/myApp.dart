import 'package:flutter/material.dart';
import 'screens/wasteList.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WasteList(),
    );
  }
}


