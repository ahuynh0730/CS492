import 'package:flutter/material.dart';
import 'package:journal/screens/newEntry.dart';
import '../myAppBar.dart';
import '../settingsDrawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  final String title = 'Journal';
  static const routeName = '/';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void pushEntryScreen(BuildContext context){
    Navigator.of(context).pushNamed(NewEntryPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(title: widget.title, scaffoldKey: _scaffoldKey),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.book
            ),
            Text(
              'Journal',
            ),
          ],
        ),
      ),
      endDrawer: SettingsDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){pushEntryScreen(context);},
        child: Icon(Icons.add),
      ),
    );
  }
}