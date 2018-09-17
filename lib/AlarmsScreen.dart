import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_drawer/EditPasswordScreen.dart';

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
                    minRadius: 20.0,
                    maxRadius: 40.0,
                    backgroundColor: Colors.white10,
                    backgroundImage: NetworkImage(
                        "http://f005.bai.com/data/uploads/2017/0228/15/823ad05883744ecbdc83b2a88ddf1e7c_middle.jpeg")),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,8.0,1.0,8.0),
                child: new RaisedButton(
                  onPressed: (){
                    print("我的");
                  },
                  color: Colors.blue[400],
                  splashColor: Colors.blue[700],
                  child:
                      new Text(
                          "我的",
                          style: new TextStyle(color: Colors.white)),
                ),
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
                child: Text(
                    '2018-11-12 12:34:00',
                 style: new TextStyle(
                   color: Colors.black38
                 ),
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
                child: Text('会员续费'),
              ),
              new RaisedButton(
                onPressed: (){
                  print('会员续费');
                },
                color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('点击输入卡密续费',style: new TextStyle(color: Colors.white)),
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
                onPressed: (){
                  print('会员续费');
                },
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('邀请码和下载链接',style: new TextStyle(color: Colors.white)),
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
                  onPressed: (){
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => new EditPasswordScreen()),
                    );
                  },
                  color:Colors.deepPurple,
                  child: Text('修改密码',style: new TextStyle(color: Colors.white)),
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
                onPressed:(){
                  print('用户条款');
                },
                color: Colors.lightGreenAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('用户条款',style: new TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new RaisedButton(
            onPressed: (){
              print('会员续费');
            },
            color: Colors.green,
            child: Text('退出登录',style: new TextStyle(color: Colors.white)),
          ),
        )
      ],
    ));
  }
}
