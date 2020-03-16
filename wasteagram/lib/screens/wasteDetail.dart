
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WasteDetail extends StatelessWidget {
  
  final String title = 'Wasteagram';
  final DocumentSnapshot snapshot;

  WasteDetail({Key key, @required this.snapshot}) : super(key: key);

  String getWeekday(day){
    switch (day) {
      case 1:
        return 'Monday';
        break;
      case 2:
        return 'Tuesday';
        break;
      case 3:
        return 'Wednesday';
        break;
      case 4:
        return 'Thursday';
        break;
      case 5:
        return 'Friday';
        break;
      case 6:
        return 'Saturday';
        break;
      case 7:
        return 'Sunday';
        break;
      default:
        return 'Not valid';
        break;
    }
  }

  String getMonth(day){
    switch (day){
      case 1:
        return "Jan";
        break;
      case 2:
        return "Feb";
        break;
      case 3:
        return "Mar";
        break;
      case 4:
        return "Apr";
        break;
      case 5:
        return "May";
        break;
      case 6:
        return "June";
        break;
      case 7:
        return "July";
        break;
      case 8:
        return "Aug";
        break;
      case 9:
        return "Sept";
        break;
      case 10:
        return "Oct";
        break;
      case 11:
        return "Nov";
        break;
      case 12:
        return "Dec";
        break;
      default:
        return "Not Valid";
        break;
    }
  }

  String getHeader(day){
    return getWeekday(day.weekday) + ', ' + getMonth(day.month) + ' ' + day.day.toString() + ', ' + day.year.toString();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
              getHeader(snapshot['date'].toDate()),
              style: TextStyle(fontSize: 25),
            ),
            ),
            Flexible(
              child: Image.network(snapshot['imageURL']),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                snapshot['wasteAmount'].toString(),
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '(${snapshot['latitude'].toString()},  ${snapshot['longitude'].toString()})',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}