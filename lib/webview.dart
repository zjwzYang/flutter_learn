import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  String url;
  String title;

  WebViewPage(this.url, this.title);

  @override
  _WebViewPageState createState() => _WebViewPageState(this.url, this.title);
}

class _WebViewPageState extends State<WebViewPage> {
  String url;
  String title;

  _WebViewPageState(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new WebView(
        initialUrl: url,
      ),
    );
  }
}
