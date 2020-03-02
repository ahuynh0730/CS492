import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../widgets/myAppBar.dart';
import '../widgets/settingsDrawer.dart';
import '../widgets/customTextFormField.dart';

class JournalEntryFields {
  String title;
  String body;
  DateTime dateTime;
  int rating;
  void addDateToJournalEntryValues(){
    dateTime = new DateTime.now();
  }
  String toString(){
    return 'Title: $title, Body: $body, Time: $dateTime, Rating: $rating';
  }
}



class NewEntryPage extends StatefulWidget {

  final String title = "New Journal Entry";
  static const routeName = 'newEntry';
  final journalEntryFields = JournalEntryFields();

  @override
  _NewEntryPageState createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final journalEntryFields = JournalEntryFields();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(title: widget.title, scaffoldKey: _scaffoldKey),
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
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    journalEntryFields.title = value;
                  },
                  validator: (value) {
                    if(value.isEmpty){
                      return 'Field cannot be empty';
                    } else return null;
                  },
                ),
                Padding(padding: const EdgeInsets.all(10)),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Body',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    journalEntryFields.body = value;
                  },
                  validator: (value) {
                    if(value.isEmpty){
                      return 'Field cannot be empty';
                    } else return null;
                  },
                ),
                Padding(padding: const EdgeInsets.all(10)),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Rating',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) {
                    journalEntryFields.rating = int.parse(value);
                  },
                  validator: (value) {
                    if(value.isEmpty){
                      return 'Field cannot be empty';
                    } else if (int.tryParse(value) == null){
                      return 'Please input a number';
                    } else if (int.parse(value) < 1 || int.parse(value) > 4){
                      return 'Please input a number between 1 and 4';
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(padding: const EdgeInsets.all(10)),
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RaisedButton(
                        onPressed: (){Navigator.of(context).pop();},
                        child: Text('Cancel'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        onPressed: () async {
                          if (formKey.currentState.validate()){
                            formKey.currentState.save();
                            journalEntryFields.addDateToJournalEntryValues();
                            await deleteDatabase('journal.db');

                            Navigator.of(context).pop();
                          }
                        },
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