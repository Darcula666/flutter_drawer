import 'package:flutter/material.dart';
import 'package:flutter_drawer/AlarmsScreen.dart';
import 'package:flutter_drawer/EmailScreen.dart';
import 'package:flutter_drawer/AlrplayScreen.dart';
import 'package:flutter_drawer/HomeScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> pages = List<Widget>();
  var _bottomNavigationIndex=0;
  final _bottomNavigationBarItemColor = Colors.teal;
  final _bottomNavigationColor = Colors.blue;
  int _currentIndex = 0;

  @override
  void initState() {
    pages
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(AlarmsScreen())
      ..add(AlrplayScreen());
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var headerText = new Text('header');
    var header = new DrawerHeader(child: headerText);
    var children = [header];
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
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '微信',
              style: TextStyle(color: _bottomNavigationColor),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '通讯录',
              style: TextStyle(color: _bottomNavigationColor),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '发现',
              style: TextStyle(color: _bottomNavigationColor),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.ac_unit,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '我',
              style: TextStyle(color: _bottomNavigationColor),
            )),
      ],
        currentIndex: _currentIndex,
        onTap: (int index){
        setState(() {
          _currentIndex = index;
          _bottomNavigationIndex=index;
        });
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}
