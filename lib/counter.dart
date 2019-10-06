import 'package:flutter/material.dart';
import 'dart:async';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  int _increaser = 1;
  Timer _timer;
  bool _running = true;

  _CounterState() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() => _counter += _increaser);
    });
  }

  void toggleTimer() {
    setState(() {
      if (_timer.isActive) {
        _timer.cancel();
        _running = false;

        return;
      }

      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() => _counter += _increaser);
      });
      
      _running = true; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: RaisedButton(
            child: Text('Reset'),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () => setState(() => _counter = 0),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            'Increaser: $_increaser',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Text(
            'Current value: $_counter.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.blue,
                onPressed: () => setState(() => _increaser += 1),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: FloatingActionButton(
                  child: _running ? Icon(Icons.pause) : Icon(Icons.play_arrow),
                  backgroundColor: _running ? Colors.red : Colors.green,
                  onPressed: toggleTimer,
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.remove),
                backgroundColor: Colors.blue,
                onPressed: () => setState(() => _increaser -= 1),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
