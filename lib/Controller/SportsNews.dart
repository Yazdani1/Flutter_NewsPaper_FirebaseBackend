import 'package:flutter/material.dart';
import 'package:flutter_news2/View/SportsNews/Sp_all_news.dart' as allNews;
import 'package:flutter_news2/View/SportsNews/Sp_news_gallery.dart' as gallery;

class Sports extends StatefulWidget {
  @override
  _SportsState createState() => new _SportsState();
}

class _SportsState extends State<Sports>with SingleTickerProviderStateMixin  {

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
          title: new Text("Sports News"),
          backgroundColor: Color(0xFF272B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,

            tabs: <Widget>[

              new Tab(icon: Icon(Icons.next_week),text: "Sports News",),
              new Tab(icon: Icon(Icons.image),text: "Gallery",)

            ],
          )
      ),

      body: new TabBarView(
        controller: tabController,
        children: <Widget>[

          new allNews.SportsAllNews(),
          new gallery.SportsGallery()
        ],
      ),

    );
  }
}

