import 'package:flutter/material.dart';
import 'package:flutter_drawer/AlarmsScreen.dart';
import 'package:flutter_drawer/EmailScreen.dart';
import 'package:flutter_drawer/AlrplayScreen.dart';
import 'package:flutter_drawer/HomeScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Apart',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Apart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  List<Widget> pages = List<Widget>();
  var _bottomNavigationIndex = 0;
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  Animation<double> tween;
  AnimationController animationController;
  CurvedAnimation curved; //曲线动画，动画插值，
  bool forward = true;

  @override
  void initState() {
    checkNetwork();
    pages
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(AlarmsScreen())
      ..add(AlrplayScreen());

    animationController = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    /*创建补间对象*/
    tween = new Tween(begin: 0.0, end: 1.0)
        .animate(animationController) //返回Animation对象
          ..addListener(() {
            //添加监听
            setState(() {
              print(tween.value); //打印补间插值
            });
          });
    curved = new CurvedAnimation(
        parent: animationController, curve: Curves.bounceOut); //模仿小球自由落体运动轨迹
    animationController.forward();
  }
    checkNetwork() async{
      var connectivityResult = await (new Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        print('4G');
      } else if (connectivityResult == ConnectivityResult.wifi) {
        print('wifi');
      }
    }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var headerText = new Text('header');
    var header = new DrawerHeader(
      child: headerText,
    );
    var children = [
      new UserAccountsDrawerHeader(
        accountName: new Text('百里守约'),
        accountEmail: new Text('117245692@qq.com'),
        currentAccountPicture: new CircleAvatar(
            backgroundImage: NetworkImage(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1537183282600&di=1da2b3f743f81ff7ad697725e559533e&imgtype=0&src=http%3A%2F%2Fupload.3367.com%2Fdb%2FPVP%2F59896635ecafc.png")),
      ),
      ListTile(
          onTap: () {
            Fluttertoast.showToast(
              msg: "乖宝宝",
              toastLength: Toast.LENGTH_LONG,
              bgcolor: "#123456",
              textcolor: '#ffffff',
              gravity: ToastGravity.CENTER,
            );
          },
          title: Text('itme1'),
          leading: new CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.camera),
          )
      ),
      ListTile(
        title: Text(
          'itme2',
        ),
        leading: new CircleAvatar(
          backgroundColor: Colors.lightGreenAccent,
          child: Icon(Icons.add_shopping_cart),
        ),
      ),
      ListTile(
        title: Text(
          'itme3',
        ),
        leading: new CircleAvatar(
          child: Icon(Icons.favorite),
          backgroundColor: Colors.orange,
        ),
      ),
    ];
    var listView = new ListView(
      children: children,
    );
    var drawer = new Drawer(
      child: listView,
    );
    return new Scaffold(
      drawer: drawer,
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: pages[_bottomNavigationIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '直播',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.email,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '视频',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pages,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            _bottomNavigationIndex = index;
          });
        },
      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ),
    );
  }
}
