import 'package:flutter/material.dart';


class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({Key key, this.labelName, this.journalEntryFields}) : super(key: key);

  final String labelName;
  final journalEntryFields;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
          labelText: widget.labelName,
          border: OutlineInputBorder(),
        ),
        onSaved: (value) {

        },
        validator: (value) {
          if(value.isEmpty){
            return 'Field cannot be empty';
          } else return null;
        },
      ),
    );
  }
}