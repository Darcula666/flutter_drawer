import 'package:flutter/material.dart';

class AlrplayScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlrplayScreenState();
}

class AlrplayScreenState extends State<AlrplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alrplay'),
      ),
      body: new Center(
        child: Text('Alrplay'),
      ),
    );
  }
}