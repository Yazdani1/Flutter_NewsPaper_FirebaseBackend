import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_news2/View/SportsNews/SportPostDetails.dart';

class SportsAllNews extends StatefulWidget {
  @override
  _SportsAllNewsState createState() => new _SportsAllNewsState();
}

class _SportsAllNewsState extends State<SportsAllNews> {
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
              height: 170.0,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF272B4A),
              ),
              margin: EdgeInsets.all(10.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: new Image.network(snapshot[index].data["image"],
                        height: 170.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  new SizedBox(width: 10.0,),

                  new Expanded(
                    flex: 2,
                    child: new Column(
                      children: <Widget>[

                        new Text(snapshot[index].data["title"],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 19.0,
                              color: Colors.white
                          ),
                        ),
                        new SizedBox(height: 5.0,),

                        new Text(snapshot[index].data["des"],
                          maxLines: 4,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white
                          ),
                        ),
                        new SizedBox(height: 15.0,),

                        new Container(
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              new Container(
                                child: new Row(
                                  children: <Widget>[

                                    new Icon(Icons.remove_red_eye,
                                      color: Colors.deepOrange,
                                    ),
                                    new SizedBox(width: 5.0,),
                                    new Text(snapshot[index].data["view"]+"View",
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.blueGrey.withOpacity(1.0)
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              new Container(
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: new Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.0),
                                        color: Colors.blueGrey
                                    ),
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>SportsPostDetails(snapshot[index])));
                                      },
                                      child: new Text("View Details",
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),

                      ],
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


