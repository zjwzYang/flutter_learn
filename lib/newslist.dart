import 'package:flutter/material.dart';
import 'bean/newsdetailseri.dart';
import 'bean/newsseri.dart';
import 'webview.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class NewsListPage extends StatefulWidget {
  List<NewsDetailSeri> dataList;
  String channel;

  NewsListPage({this.dataList, this.channel});

  @override
  _NewsListPageState createState() =>
      _NewsListPageState(dataList: this.dataList, channel: this.channel);
}

class _NewsListPageState extends State<NewsListPage> {
  List<NewsDetailSeri> dataList;
  String channel;
  var start = 0;

  ScrollController scrollController;

  _NewsListPageState({this.dataList, this.channel});

  @override
  void initState() {
    super.initState();
    getData();
    scrollController = new ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _synGetMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(channel),
      ),
      backgroundColor: Colors.grey,
      body: RefreshIndicator(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return _getNewsListItem(context, dataList[index]);
          },
          itemCount: dataList.length,
          controller: scrollController,
        ),
        onRefresh: _synHttpData,
      ),
    );
  }

  getData() {
    if (dataList == null) {
      dataList = List.generate(
          20, (i) => new NewsDetailSeri(i.toString(), "", "", "", ""));
    } else {
      dataList.forEach((NewsDetailSeri newsDetail) {
        // print("12345678:" + newsDetail.title);
      });
    }
  }

  Future<Null> _synHttpData() async {
    start = 0;
    var url = "https://api.jisuapi.com/news/get?channel=头条&start=" +
        start.toString() +
        "&num=10&appkey=695f0de3bc40b627";
    Dio dio = new Dio();
    Response response = await dio.get(url);
    NewsSeri newsSeri =
        NewsSeri.fromJson(json.decode(response.data.toString()));
    if (newsSeri.status != 0) {
      Fluttertoast.showToast(
          msg: newsSeri.msg, toastLength: Toast.LENGTH_SHORT);
    } else {
      setState(() {
        dataList = newsSeri.result.list;
        dataList.forEach((NewsDetailSeri newsDetail) {
          print("刷新成功:" + newsDetail.title);
        });
      });
    }
  }

  _synGetMore() async {
    start++;
    var url = "https://api.jisuapi.com/news/get?channel=头条&start=" +
        start.toString() +
        "&num=10&appkey=695f0de3bc40b627";
    Dio dio = new Dio();
    Response response = await dio.get(url);
    NewsSeri newsSeri =
        NewsSeri.fromJson(json.decode(response.data.toString()));
    setState(() {
      dataList.addAll(newsSeri.result.list);
      print("加载成功:");
    });
  }
}

_getNewsListItem(BuildContext context, NewsDetailSeri newsDetail) {
  return new Card(
      child: new FlatButton(
    onPressed: () {
      Navigator.push(context,
          new MaterialPageRoute(builder: (BuildContext context) {
        return new WebViewPage(newsDetail.url, newsDetail.title);
      }));
    },
    child: new Padding(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            newsDetail.pic,
            fit: BoxFit.cover,
          ),
          new Text(
            newsDetail.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
          ),
          new Padding(padding: EdgeInsets.all(5)),
          new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Expanded(
                  flex: 1,
                  child: new Text(
                    "来源：" + newsDetail.src,
                    style: TextStyle(fontSize: 12),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
              new Expanded(
                flex: 1,
                child: new Text(
                  "时间：" + newsDetail.time,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}
