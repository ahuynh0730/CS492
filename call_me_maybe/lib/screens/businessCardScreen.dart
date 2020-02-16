import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BusinessCardScreen extends StatelessWidget {

  final phoneNumber = '314-707-6765';
  final link = 'github.com/ahuynh0730';
  final email = 'ahuynh0730@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset('assets/pictures/myPhoto.jpg')
          ),
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
              child: FlatButton(
                onPressed: _openLink,
                child: Text(link),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: _sendEmail,
                child: Text(email),
              ),
            ),
          ]
        ),
        ]
      )
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

  _openLink() async {
    final url = 'https://' + link;
    if (await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not open $url';
    } 
  }

  _sendEmail() async{
    final launchString = 'mailto:' + email;
    if (await canLaunch(launchString)) {
      await launch(launchString);
    } else {
      throw 'Could not launch $launchString';
    }

  }
}

