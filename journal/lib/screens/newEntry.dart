import 'package:flutter/material.dart';
import '../widgets/myAppBar.dart';
import '../widgets/settingsDrawer.dart';
import '../widgets/customTextFormField.dart';

class NewEntryPage extends StatefulWidget {

  final String title = "New Journal Entry";
  static const routeName = 'newEntry';

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
      appBar: MyAppBar(title: widget.title, scaffoldKey: _scaffoldKey),
      endDrawer: SettingsDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                CustomTextFormField(labelName: 'Title'),
                CustomTextFormField(labelName: 'Body'),
                CustomTextFormField(labelName: 'Rating'),
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
                        onPressed: (){
                          if (formKey.currentState.validate()){
                            formKey.currentState.save();
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