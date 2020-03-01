import '../models/magic8ball.dart';

import 'package:call_me_maybe/models/magic8ball.dart';
import 'package:flutter/material.dart';


class PredictorScreen extends StatefulWidget {
  @override
  _PredictorScreenState createState() => _PredictorScreenState();
}

class _PredictorScreenState extends State<PredictorScreen> {

  String predictorText ='Prediction';
  final magic8Ball = Magic8Ball();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [ 
        Text('Call Me...Maybe?', style: TextStyle(fontSize: 30)),
        Padding(
          padding: EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () { setState ( () {predictorText = magic8Ball.shake();}); },
            child: Text('Ask a question, tap for the answer', style: TextStyle(fontSize: 20),),
          ),
        ),
        Text('$predictorText', style: TextStyle(fontSize: 30)),
      ],
    );
  }

  
}
