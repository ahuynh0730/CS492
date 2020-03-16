import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/scaffoldBody.dart';
import 'photoSelection.dart';


class WasteList extends StatefulWidget {
  WasteList({Key key}) : super(key: key);

  final String title = 'Wasteagram';

  @override
  _WasteListState createState() => _WasteListState();
}

class _WasteListState extends State<WasteList> {

  int wasteCount = 0;

  void calculateWaste(AsyncSnapshot<dynamic> snapshot) async {
    wasteCount = 0;
    for (int i = 0; i< snapshot.data.documents.length; i++){
      wasteCount += snapshot.data.documents[i]['wasteAmount'];
    }
  }


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
      builder: (context, snapshot) {
        calculateWaste(snapshot);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(widget.title + ' - ' + '$wasteCount'),
          ),
          body: scaffoldBody(context, snapshot),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotoSelection()));
            },
            tooltip: 'Add new post',
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, 
        );
      }
    );
  }
}

