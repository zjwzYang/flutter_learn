import 'package:flutter/material.dart';

/**
 * 这个页面是为了路由
 *
 * 1.组件路由：在main中用Navigator.push(context, MaterialPageRoute(builder: (context) {})
 * 2.命名路由：Navigator.of(context).pushNamed("/second");
 */
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
