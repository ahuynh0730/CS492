import 'dart:math';

import 'package:flutter/material.dart';

class PredictorScreen extends StatefulWidget {
  @override
  _PredictorScreenState createState() => _PredictorScreenState();
}

class _PredictorScreenState extends State<PredictorScreen> {

  String predictorText ='Prediction';
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [ 
        Text('Call Me...Maybe?', style: TextStyle(fontSize: 30)),
        Padding(
          padding: EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () { setState ( () {predictorText = getPredictionString(random.nextInt(8));}); },
            child: Text('Ask a question, tap for the answer', style: TextStyle(fontSize: 20),),
          ),
        ),
        Text('$predictorText', style: TextStyle(fontSize: 30)),
      ],
    );
  }

  String getPredictionString(int randomNumber){
    switch (randomNumber){
      case 0: 
        return 'As I see it, yes.';
      case 1:
        return 'Ask again later.';
      case 2:
        return 'Better not tell you now.';
      case 3:
        return 'Cannot predict now.';
      case 4:
        return 'Don\'t count on it.';
      case 5:
        return 'It is certain.';
      case 6:
        return 'It is decidedly so.';
      default:
        return 'Most likely.';

    }
  }
}
