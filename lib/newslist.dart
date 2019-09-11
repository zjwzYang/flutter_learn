import 'package:flutter/material.dart';
import 'bean/newsdetailseri.dart';
import 'webview.dart';

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

  _NewsListPageState({this.dataList, this.channel});

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(channel),
      ),
      backgroundColor: Colors.grey,
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return _getNewsListItem(context, dataList[index]);
        },
        itemCount: dataList.length,
      ),
    );
  }

  getData() {
    if (dataList == null) {
      dataList = List.generate(
          20, (i) => new NewsDetailSeri(i.toString(), "", "", "", ""));
    } else {
      dataList.forEach((NewsDetailSeri newsDetail) {
        print("12345678:" + newsDetail.title);
      });
    }
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
        mainAxisSize: MainAxisSize.min,
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
