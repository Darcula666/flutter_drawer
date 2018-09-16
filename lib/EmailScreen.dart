import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_video_player/flutter_simple_video_player.dart';

class EmailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EmailScreenState();
}

class EmailScreenState extends State<EmailScreen> {
  List subjects = [];
  String title = '';
  var curPage = 0;
  ScrollController _controller = new ScrollController();
  double downY = 0.0;
  double lastDownY = 0.0;
  double lastListLength = 0.0;
  bool isRefreshing = false;
  bool isLoadingMore = false;

  @override
  void initState() {
    curPage = 0;
    loadData(curPage);
    //_controller..addListener(_scrollListener);
  }

  void _scrollListener() {
    //滑到最底部刷新
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      loadData(curPage);
    }
  }

  Future<Null> _pullToRefresh() async {
    curPage = 0;
    print(curPage);
    subjects = []; //清空
    //下拉刷新做处理
    setState(() {
      //改变数据，这里随意发挥
      loadData(curPage);
    });
    return null;
  }

  getBody() {
    if (subjects.length != 0) {
      return List.generate(
        subjects.length,
        (int index) => Container(
            padding: EdgeInsets.all(2.0),
            child: new InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoFullPage(
                            'https://youku.cdn-56.com/20180622/3878_d3968706/index.m3u8',
                          )),
                );
              },
              child: new ConstrainedBox(
                constraints: new BoxConstraints(
                  minHeight: 500.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Image.network(subjects[index]['images']['large']),
                    new Text(subjects[index]['title'])
                  ],
                ),
              ),
            )),
      );
    } else {
      // 加载菊花
      return CupertinoActivityIndicator();
    }
  }

  loadData(int start) async {
    String loadRUL =
        "https://api.douban.com/v2/movie/in_theaters?count=10&start=$start";
    http.Response response = await http.get(loadRUL);
    var result = json.decode(response.body);
    setState(() {
      title = result['title'];
      subjects += result['subjects'];
      isLoadingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var listener = new Listener(
        onPointerDown: (event) {
          var position = event.position.distance;
          downY = position;
        },
        onPointerMove: (event) {
          var position = event.position.distance;
          var detal = position - lastDownY;
          var scrollExtent = _controller.position.maxScrollExtent;
          var pixels = _controller.position.pixels;
          bool isBottom = (pixels == scrollExtent);
          print("scrollExtent" + scrollExtent.toString());
          print("pixels" + pixels.toString());
          if (detal > 0) {
            print("================向下移动================");
          } else {
            //所摸点长度 +滑动距离  = IistView的长度  说明到达底部
            print("================向上移动================");
            if (pixels == scrollExtent) {
              print("scrollController====到达底部");
              print("isLoadingMore" + isLoadingMore.toString());
              lastListLength = scrollExtent;
              if (!isLoadingMore && isBottom && !isRefreshing) {
                setState(() {
                  isRefreshing = false;
                  isLoadingMore = true;
                  curPage++;
                  print(curPage);
                  loadData(curPage);
                });
              }
            }
          }
          lastDownY = position;
        },
        child: new GridView.count(
            controller: _controller,
            padding: EdgeInsets.all(8.0),
            crossAxisCount: 2,
            children: getBody()));
    var refreshIndicator = new RefreshIndicator(
        child: Stack(
          children: <Widget>[
            listener,
          ],
        ),
        onRefresh: _pullToRefresh);
    return refreshIndicator;
  }
}
