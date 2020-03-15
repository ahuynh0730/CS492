import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class WasteList extends StatefulWidget {
  WasteList({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _WasteListState createState() => _WasteListState();
}

class _WasteListState extends State<WasteList> {

  int wasteCount = 0;

  void calculateWaste(AsyncSnapshot<dynamic> snapshot){
    wasteCount = 0;
    for (int i = 0; i< snapshot.data.documents.length; i++){
      wasteCount += snapshot.data.documents[i]['wasteAmount'];
    }
  }

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

  String getTitle(day){
    return getWeekday(day.weekday) + ', ' + getMonth(day.month) + ' ' + day.day.toString();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data.documents != null && snapshot.data.documents.length > 0){
          calculateWaste(snapshot);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(widget.title + ' - ' + '$wasteCount'),
            ),
            body: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (content, index) {
                var post = snapshot.data.documents[index];
                return ListTile(
                  title: Text(getTitle(post['date'].toDate())),
                  trailing: Text(post['wasteAmount'].toString())
                );
              }
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: null,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(widget.title + ' - ' + 0.toString()),
            ),
            body: Center(child: CircularProgressIndicator()),
            floatingActionButton: FloatingActionButton(
              onPressed: null,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
        }
      }
    );
  }
}

