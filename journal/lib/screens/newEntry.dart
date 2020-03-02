import 'package:flutter/material.dart';
import 'package:journal/myAppBar.dart';
import 'package:journal/settingsDrawer.dart';

class NewEntryPage extends StatefulWidget {

  final String title = "New Journal Entry";

  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () => _scaffoldKey.currentState.openEndDrawer()
          ),
        ],
      ),
      endDrawer: SettingsDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(padding: const EdgeInsets.all(10)),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()
                  ),
                ),
                Padding(padding: const EdgeInsets.all(10)),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Body', border: OutlineInputBorder()
                  ),
                ),
                Padding(padding: const EdgeInsets.all(10)),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Rating', border: OutlineInputBorder()
                  ),
                ),
                Padding(padding: const EdgeInsets.all(10)),
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RaisedButton(
                        onPressed: (){},
                        child: Text('Cancel'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        onPressed: (){},
                        child: Text('Save'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}