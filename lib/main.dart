import 'package:flutter/material.dart';
import 'list.dart';
import 'net.dart';
import 'listitem.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: RoutePage(),
      routes: {
        "/route": (context) {
          return new RoutePage();
        },
        "/list": (context) {
          return new ListPage();
        },
        "/listItem": (context) {
          return new ListItemPage();
        },
        "/net": (context) {
          return new NetPage();
        },
      },
    );
  }
}

/**
 * 这个页面是为了路由
 *
 * 1.组件路由：在main中用Navigator.push(context, MaterialPageRoute(builder: (context) {})
 * 2.命名路由：Navigator.of(context).pushNamed("/second");
 */
class RoutePage extends StatefulWidget {
  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    int sizeNum = 30;
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text("Flutter学习"),
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlatButton(
              onPressed: () {
                // 这是跳转的第一种方法
                Navigator.pushNamed(context, "/list", arguments: sizeNum);
              },
              child: _getClickText("ListViewDemo")),
          new Padding(padding: EdgeInsets.all(10)),
          new FlatButton(
              onPressed: () {
                // 这是跳转的第二种方法
//                Navigator.push(context,
//                    new MaterialPageRoute(builder: (context) {
//                  new NetPage();
//                }));
                Navigator.pushNamed(context, "/net");
              },
              child: _getClickText("网络请求Demo"))
        ],
      ),
    );
  }
}

_getClickText(String textStr) {
  return new Center(
      child: new Text(textStr,
          style: TextStyle(
              color: Colors.black, fontSize: 16, backgroundColor: Colors.red)));
}
