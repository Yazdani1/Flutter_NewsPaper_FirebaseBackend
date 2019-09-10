import 'package:flutter/material.dart';
import 'package:flutter_news2/View/InternationalNews/In_all_news.dart' as allnews;
import 'package:flutter_news2/View/InternationalNews/In_news_gallery.dart' as gallery;

class InternationalNews extends StatefulWidget {
  @override
  _InternationalNewsState createState() => new _InternationalNewsState();
}

class _InternationalNewsState extends State<InternationalNews> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text("International News"),
        backgroundColor: Color(0xFF222240),

      ),

    );
  }
}







