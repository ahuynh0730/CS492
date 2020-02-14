import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessCardScreen extends StatelessWidget {

  final phoneNumber = '314-707-6765';

  @override
  Widget build(BuildContext context) {
    return Column(
     children: <Widget>[
        Text('Anthony Huynh'),
        Text('Software Engineer'),
        RaisedButton(
          onPressed: _sendSMS,
          child: Text(phoneNumber),
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('github.com/ahuynh0730'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text('ahuynh0730@gmail.com'),
            ),
          ]
        ),
     ]
    );
  }

  _sendSMS() async {
    final numberWithoutDashes = phoneNumber.replaceAll('-', '');
    final launchString = 'sms:' + numberWithoutDashes;
    if (await canLaunch(launchString)) {
      await launch(launchString);
    } else {
      throw 'Could not launch $launchString';
    }
  }
}

