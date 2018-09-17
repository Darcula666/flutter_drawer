import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
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
  var physicalSize= window.physicalSize;

  @override
  void initState() {
    curPage = 0;
    loadData(curPage);
    print("width"+physicalSize.width.toString());
    print("height"+physicalSize.height.toString());
  }

  Future<Null> _pullToRefresh() async {
    curPage = 0;
    print(curPage);
    subjects = []; //清空
    //下拉刷新做处理
    if (!isLoadingMore) {
      setState(() {
        isRefreshing = true;
        isLoadingMore = false;
        loadData(curPage);
      });
    }
    return null;
  }

  getBody() {
//    if (subjects.length != 0) {
      List<Widget> list=List.generate(
          subjects.length,
          (int index) =>
              Center(
                child: Container(
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
                        child: new Wrap(
                          direction: Axis.vertical,
                          children: <Widget>[
                            new ConstrainedBox(
                              constraints: new BoxConstraints(
                                  minHeight: 100.0,
                                  maxHeight: 150.0,
                                  minWidth: 170.0,
                                  maxWidth: 200.0
                              ),
                              child: new Image.network(
                                subjects[index]['images']['large'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            new Text(
                              subjects[index]['title'],
                              style: new TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        )
                        //
                        )
                ),
              )
      );
        return list;
    //} else {
      // 加载菊花
      return CupertinoActivityIndicator();
    //}
  }

  loadData(int start) async {
    String loadRUL =
        "https://api.douban.com/v2/movie/in_theaters?count=12&start=$start";
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
              isRefreshing = false;
              if (!isLoadingMore && isBottom && !isRefreshing) {
                setState(() {
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
