import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class NetPage extends StatefulWidget {
  @override
  _NetPageState createState() => _NetPageState();
}

class _NetPageState extends State<NetPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text("网络请求"),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Center(
            child: new Card(
              child: new FlatButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "原生网络请求", toastLength: Toast.LENGTH_SHORT);
                    _httpOrign();
                  },
                  child: new Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: new Text("原生网络请求"),
                  )),
            ),
          ),
          new Center(
              child: new Card(
            child: new FlatButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "Http网络请求", toastLength: Toast.LENGTH_SHORT);
                  _httpHttp();
                },
                child: new Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: new Text("Http网络请求"),
                )),
          )),
          new Center(
              child: new Card(
            child: new FlatButton(
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "第三方网络请求", toastLength: Toast.LENGTH_SHORT);
                  _httpDio();
                },
                child: new Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: new Text("第三方网络请求"),
                )),
          )),
        ],
      ),
    );
  }
}

var url =
    "https://api.jisuapi.com/news/get?channel=头条&start=0&num=10&appkey=695f0de3bc40b627";

_httpOrign() async {
  var httpClient = new HttpClient();
  var request = await httpClient.getUrl(Uri.parse(url));
  var response = await request.close();
  if (response.statusCode == HttpStatus.ok) {
    String responseBody = await response.transform(utf8.decoder).join();
    _formatToMap(responseBody);
  }
  httpClient.close();
}

_httpHttp() async {
  // 学法一
//  var client = new http.Client();
//  http.Response response = await client.get(url);
//  if (response.statusCode == HttpStatus.ok) {
//    String body = response.body.toString();
//
//  }
  // 写法二
  http.Client().get(url).then((http.Response response) {
    String responseBody = response.body.toString();
    _formatToBean(responseBody);
  });
}

_httpDio() async {
  Dio dio = new Dio();
  Response response = await dio.get(url);
  String data = response.data.toString();
  print(data);
}

_formatToMap(String data) {
  Map<String, dynamic> map = json.decode(data);
  map.forEach((key, value) {
    if (key == "msg") {
      print(value);
    }
  });
}

/**
 * 这种方法比较繁琐。
 */
_formatToBean(String data) {
  News news = News.fromatJson(json.decode(data));
  print("12345678:" + news.msg);
  return news;
}

class News {
  int status;
  String msg;
  Result result;

  News({this.status, this.msg, this.result});

  factory News.fromatJson(Map<String, dynamic> map) {
    return News(status: map["status"], msg: map["msg"]);
  }
}

class Result {
  String channel;
  int num;
  List<NewsDetail> list;

  Result({this.channel, this.num, this.list});
}

class NewsDetail {
  String title;
  String time;
  String src;
  String pic;
  String url;
}
