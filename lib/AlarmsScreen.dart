import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlarmsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlarmsScreenState();
}

class AlarmsScreenState extends State<AlarmsScreen> {
  double _initHeight;
  double _height;

  @override
  void initState() {
    _initHeight = 10.0;
    _height = _initHeight;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          _height = _initHeight + (_initHeight * (details.scale * .35));
          print("scale=${details.scale}  height=$_height ih=$_initHeight");
        });
      },
      onScaleEnd: (ScaleEndDetails details) {
        setState(() {
          _initHeight = _height;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Alarms'),
        ),
        body: new Center(
            child: new SizedBox(
          height: _height,
          child: new FittedBox(
            child: Text('Alarms'),
          ),
        )),
      ),
    );
  }
}
