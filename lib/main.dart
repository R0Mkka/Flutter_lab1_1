import 'package:flutter/material.dart';

import './counter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My own first app!'),
        ),
        body: Counter(),
      ),
    );
  }
}