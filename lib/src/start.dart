import 'dart:async';

import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  @override
  createState() {
    return StartState();
  }
}

class StartState extends State<Start> {

  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer timer;

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }


  @override
  Widget build(context) {
    if (timer == null)
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });

    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);



    return MaterialApp(
      title: 'Timer',
      home: Scaffold(
        body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              CustomTextContainer(
                  label: 'HRS', value: hours.toString().padLeft(2, '0')),
              CustomTextContainer(
                  label: 'MIN', value: minutes.toString().padLeft(2, '0')),
              CustomTextContainer(
                  label: 'SEC', value: seconds.toString().padLeft(2, '0')),
            ]),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: RaisedButton(
                child: Text(isActive ? 'STOP' : 'START'),
                onPressed: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CustomTextContainer extends StatelessWidget {
  CustomTextContainer({this.label, this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.black87),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: TextStyle(
                color: Colors.white, fontSize: 54, fontWeight: FontWeight.bold),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: Colors.white70,
            ),
          )
        ],
      ),
    );
  }
}
