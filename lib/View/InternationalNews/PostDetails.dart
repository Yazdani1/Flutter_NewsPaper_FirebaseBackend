import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';


class PostDetails extends StatefulWidget {

  DocumentSnapshot snapshot;
  PostDetails(this.snapshot);

  @override
  _PostDetailsState createState() => new _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      appBar: new AppBar(
        title: new Text("International Post Details"),
        backgroundColor: Color(0xFF222240),
      ),
      backgroundColor: Color(0xFF222240),

      body: new ListView(
        children: <Widget>[

          //start first container..
          new Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: new Image.network(widget.snapshot.data["image"],
              height: 250.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          //end first container..
          
          new Container(
            margin: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            color: Color(0xFF272B4A),
            child: new Column(
              children: <Widget>[

                //first container...
                new Container(
                  margin: EdgeInsets.all(10.0),
                  child: new Row(
                    children: <Widget>[
                      
                      new CircleAvatar(
                        child: new Text(widget.snapshot.data["title"][0]),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepOrange,
                      ),
                      new SizedBox(width: 8.0,),
                      
                    ],
                  ),
                ),

              ],
            ),
          ),
          

        ],
      ),

    );
  }
}




