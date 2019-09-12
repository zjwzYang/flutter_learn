import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  TabController tabController;
  PageController pageController;
  var isPageCanChanged = true;
  var imgs = [
    "https://n.sinaimg.cn/baby/transform/500/w300h200/20190911/ad7e-iekuaqu0579783.jpg",
    "https://cms-bucket.ws.126.net/2019/09/12/1620d5c37be749c79087b1fbd021ddef.png",
    "https://n.sinaimg.cn/ent/transform/500/w300h200/20190912/f920-iepyyhh5169946.jpg",
    "https://n.sinaimg.cn/sinacn20190912ac/782/w1110h472/20190912/5765-iepyyhh5200839.jpg"
  ];
  List<Widget> tabs;

  @override
  void initState() {
    super.initState();
    tabs = new List();
    for (int i = 0; i < imgs.length; i++) {
      if (i == 0) {
        tabs.add(new Padding(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: new Text(
            i.toString(),
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
        ));
      } else {
        tabs.add(new Padding(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: new Text(
            i.toString(),
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ));
      }
    }
    tabController = new TabController(length: tabs.length, vsync: this);
    pageController = new PageController(initialPage: 0);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        onChange(tabController.index, p: pageController);
      }
    });
  }

  onChange(int index, {PageController p, TabController t}) async {
    setState(() {
      tabs.clear();
      for (int i = 0; i < imgs.length; i++) {
        if (i == index) {
          tabs.add(new Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: new Text(
              i.toString(),
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ));
        } else {
          tabs.add(new Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: new Text(
              i.toString(),
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ));
        }
      }
    });
    if (p != null) {
      isPageCanChanged = false;
      await p.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
      isPageCanChanged = true;
    } else {
      t.animateTo(index);
    }
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Tabbar画面"),
        bottom: new TabBar(
          tabs: tabs,
          indicatorColor: Colors.red,
          controller: tabController,
        ),
      ),
      backgroundColor: Colors.grey,
      body: new PageView.builder(
        itemBuilder: (context, index) {
          return Image.network(
            imgs[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: imgs.length,
        scrollDirection: Axis.horizontal,
        controller: pageController,
        onPageChanged: (index) {
          if (isPageCanChanged) {
            onChange(index, t: tabController);
          }
          print("12345678变化：" + index.toString());
        },
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          tabs: tabs,
          indicatorColor: Colors.red,
          controller: tabController,
        ),
      ),
    );
  }
}
