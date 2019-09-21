import 'package:flutter/material.dart';
import 'package:flutter_news2/View/InternationalNews/In_all_news.dart' as allnews;
import 'package:flutter_news2/View/InternationalNews/In_news_gallery.dart' as gallery;

class InternationalNews extends StatefulWidget {
  @override
  _InternationalNewsState createState() => new _InternationalNewsState();
}

class _InternationalNewsState extends State<InternationalNews>with SingleTickerProviderStateMixin {

  TabController tabController;

  @override
  void initState() {
    tabController=new TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("International News"),
        backgroundColor: Color(0xFF272B4A),
        bottom: new TabBar(
          controller: tabController,
          indicatorColor: Colors.blueGrey,
          indicatorWeight: 5.0,

          tabs: <Widget>[

            new Tab(icon: Icon(Icons.next_week),text: "International News",),
            new Tab(icon: Icon(Icons.image),text: "Gallery",)

          ],
        )
      ),

      body: new TabBarView(
        controller: tabController,
        children: <Widget>[

          new allnews.In_AllNews(),
          new gallery.In_Gallery()
        ],
      ),

    );
  }
}







