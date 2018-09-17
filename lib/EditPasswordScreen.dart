import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EditPasswordScreenState();
}

class EditPasswordScreenState extends State<EditPasswordScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("修改密码"),
      ),
      body: new Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  new TextField(
                    decoration: new InputDecoration(
                        hintText: '原密码',
                        border: new OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  new TextField(
                    decoration: new InputDecoration(
                        hintText: '新密码',
                        border: new OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  new TextField(
                    decoration: new InputDecoration(
                        hintText: '确认密码',
                        border: new OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0)))),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new RaisedButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "修改成功",
                      toastLength: Toast.LENGTH_LONG,
                      bgcolor: "#123456",
                      textcolor: '#ffffff',
                      gravity: ToastGravity.TOP,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "修改密码",
                    style: TextStyle(color: Colors.white,fontSize: 25.0),
                  ),
                ),
                color: Colors.green,
              ),
            )
          ],
        ),
      ),
    );
  }
}
