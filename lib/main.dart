import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: DemoPage());
  }
}

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      appBar: new AppBar(
        title: new Text("demo学习"),
      ),
      body: new ListView.builder(
        itemBuilder: (context, index) {
          return new DemoItem(index);
        },
        itemCount: 20,
      ),
    );
  }
}

class DemoItem extends StatefulWidget {
  var index;

  DemoItem(this.index);

  @override
  _DemoItemState createState() => _DemoItemState(index);
}

class _DemoItemState extends State<DemoItem> {
  var index;

  _DemoItemState(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Card(
          child: new FlatButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "点击了：" + index.toString(),
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                );
              },
              child: new Padding(
                padding: new EdgeInsets.only(
                    left: 10, top: 10, right: 10, bottom: 10),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Container(
                      child: new Text(
                        "这是一条描述-" + index.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 14.0),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                      alignment: Alignment.topLeft,
                    ),
                    new Padding(
                        padding: new EdgeInsets.only(top: 5, bottom: 5)),
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _getBottomItem(Icons.star, "星星"),
                        _getBottomItem(Icons.link, "链接"),
                        _getBottomItem(Icons.subject, "其他")
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}

_getBottomItem(IconData icon, String text) {
  return new Expanded(
    flex: 1,
    child: new Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Icon(
            icon,
            size: 16,
            color: Colors.blue,
          ),
          new Padding(padding: new EdgeInsets.only(left: 5.0)),
          new Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 14.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    ),
  );
}
