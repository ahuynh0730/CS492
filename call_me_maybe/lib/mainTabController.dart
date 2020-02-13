import 'package:flutter/material.dart';

import 'screens/businessCardScreen.dart';
import 'screens/resumeScreen.dart';
import 'screens/predictorScreen.dart';

class MainTabController extends StatelessWidget {

  static const tabs = [
    Tab(text: 'Business Card'),
    Tab(text: 'Resume',),
    Tab(text: 'Predictor')
  ];

  final screens = [BusinessCardScreen(), ResumeScreen(), PredictorScreen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Call Me Maybe'),
          bottom: TabBar(tabs: tabs)
        ),
        body: TabBarView(children: screens)
      ),
    );
  }
}