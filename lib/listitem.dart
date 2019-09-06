import 'package:flutter/material.dart';

class ListItemPage extends StatefulWidget {
  @override
  _ListItemPageState createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: new AppBar(
        title: new Text("这是" + index.toString() + "个"),
      ),
      body: Center(
          child: new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text(index.toString()),
          )),
    );
  }
}

