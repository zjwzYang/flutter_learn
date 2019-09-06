import 'package:flutter/material.dart';

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
          new FlatButton(onPressed: () {}, child: new Text("原生网络请求"))
        ],
      ),
    );
  }
}
