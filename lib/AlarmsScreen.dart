import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AlarmsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlarmsScreenState();
}

class AlarmsScreenState extends State<AlarmsScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: Colors.white10,
                    backgroundImage: NetworkImage(
                        "http://f005.bai.com/data/uploads/2017/0228/15/823ad05883744ecbdc83b2a88ddf1e7c_middle.jpeg")),
              ),
              new RaisedButton(
                color: Colors.blue[400],
                splashColor: Colors.deepOrangeAccent,
                child:
                    new Text("我的", style: new TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text('随机id号或邀请码'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('VIP到期时间'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2018-11-12 12:34:00'),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('会员续费'),
              ),
              new RaisedButton(
                onPressed: null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('点击输入卡密续费'),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('推荐好友'),
              ),
              new RaisedButton(
                onPressed: null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('邀请码和下载链接'),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('修改密码'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new RaisedButton(
                  onPressed: null,
                  child: Text('修改密码'),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('用户条款'),
              ),
              new RaisedButton(
                onPressed: null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('用户条款'),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new RaisedButton(
            onPressed: null,
            child: Text('退出登录'),
          ),
        )
      ],
    ));
  }
}
