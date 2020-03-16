import 'package:flutter/material.dart';
import '../screens/wasteDetail.dart';

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


Widget scaffoldBody(BuildContext context, AsyncSnapshot<dynamic> snapshot){
  if(snapshot.hasData && snapshot.data.documents != null && snapshot.data.documents.length > 0){
    return ListView.builder(
      itemCount: snapshot.data.documents.length,
      itemBuilder: (content, index) {
        var post = snapshot.data.documents[index];
        return ListTile(
          title: Text(getTitle(post['date'].toDate())),
          trailing: Text(post['wasteAmount'].toString()),
          onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>WasteDetail(snapshot: post)));
            },
        );
      }
    );
  } else {
    return Center(child: CircularProgressIndicator());
  }

}