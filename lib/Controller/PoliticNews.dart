import 'package:flutter/material.dart';
import 'package:flutter_news2/View/PoliticsNews/Po_all_news.dart' as allNews;
import 'package:flutter_news2/View/PoliticsNews/Po_news_gallery.dart' as gallery;

class Politcs extends StatefulWidget {
  @override
  _PolitcsState createState() => new _PolitcsState();
}

class _PolitcsState extends State<Politcs>with SingleTickerProviderStateMixin {

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
          title: new Text("Politics News"),
          backgroundColor: Color(0xFF272B4A),
          bottom: new TabBar(
            controller: tabController,
            indicatorColor: Colors.blueGrey,
            indicatorWeight: 5.0,

            tabs: <Widget>[

              new Tab(icon: Icon(Icons.next_week),text: "Politics News",),
              new Tab(icon: Icon(Icons.image),text: "Gallery",)

            ],
          )
      ),

      body: new TabBarView(
        controller: tabController,
        children: <Widget>[

          new allNews.Politica_all_News(),
          new gallery.PoliticsGallery()
        ],
      ),

    );
  }
}

