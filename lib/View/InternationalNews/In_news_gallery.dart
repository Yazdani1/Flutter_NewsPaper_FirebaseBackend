import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class In_Gallery extends StatefulWidget {
  @override
  _In_GalleryState createState() => new _In_GalleryState();
}
class _In_GalleryState extends State<In_Gallery> {

  StreamSubscription<QuerySnapshot>subscription;

  List<DocumentSnapshot>snapshot;
  CollectionReference collectionReference=Firestore.instance.collection("InternationalNews");

  @override
  void initState() {
    subscription=collectionReference.snapshots().listen((datasnap){
      setState(() {
        snapshot=datasnap.documents;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFF222240),
      body: new ListView.builder(
        itemCount: snapshot.length,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.all(10.0),
            child: new Stack(
              children: <Widget>[
                new Container(
                  child: new ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: new Image.network(snapshot[index].data["image"],
                    height: 300.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                new Positioned(
                  top: 40.0,
                  left: 30.0,
                  child: new Container(
                    height: 50.0,
                    width: 250.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)
                      )
                    ),
                    child: Align(
                      alignment: Alignment.center,
                        child: new Text("International News",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                        ),
                        )
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),

    );
  }
}
