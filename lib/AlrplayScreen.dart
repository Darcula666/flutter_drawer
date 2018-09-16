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
      body: new Padding(
        padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new RaisedButton(
                onPressed: () {
                  print("  我点击了  Padding  下的  RaisedButton");
                },
                //通过控制 Text 的边距来控制控件的高度
                child: new Padding(
                  padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                  child: new Text("Padding测试Buton的宽度"),
                ),
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
