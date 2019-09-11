import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'Controller/InternationalNews.dart';
import 'Controller/SportsNews.dart';
import 'Controller/PoliticNews.dart';
import 'Controller/LocalNews.dart';
//test

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot>snapshot;

  CollectionReference collectionReference=Firestore.instance.collection("post");

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

      appBar: new AppBar(
        title: new Text("News Portal"),
        backgroundColor: Color(0xFF222240),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

            new UserAccountsDrawerHeader(
                accountName: null,
                accountEmail: null,
              decoration: new BoxDecoration(
                color: Color(0xFF222240),
              ),
            ),
            
            new ListTile(
              title: new Text("Item 1",style: TextStyle(fontSize: 20.0),),
              leading: new Icon(Icons.search,size: 20.0,color: Colors.purple,),
            ),


            new ListTile(
              title: new Text("Item 2",style: TextStyle(fontSize: 20.0),),
              leading: new Icon(Icons.present_to_all,size: 20.0,color: Colors.purple,),
            ),


            new ListTile(
              title: new Text("Item 3",style: TextStyle(fontSize: 20.0),),
              leading: new Icon(Icons.face,size: 20.0,color: Colors.purple,),
            ),


          ],
        ),
      ),

      body: new ListView(
        children: <Widget>[

          //First Container start

          new Container(
            height: 190.0,
            margin: EdgeInsets.only(top:10.0,left: 0.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Latest Post",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white
                  ),
                  ),
                ),
                new Container(
                  height: 130.0,
                  margin: EdgeInsets.only(top:10.0),
                  child: new ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.length,
                      itemBuilder: (context,index){


                        return Container(
                          width: 300.0,
                          margin: EdgeInsets.only(left: 10.0),
                          color: Color(0xFF272B4A),
                          child: new Row(
                            children: <Widget>[

                              new Expanded(
                                flex: 1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: new Image.network(snapshot[index].data["image"],
                                    height: 130.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              new SizedBox(width: 10.0,),
                              new Expanded(
                                flex: 2,
                                child: new Container(
                                  color: Color(0xFF272B4A),
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text(snapshot[index].data["title"],
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 21.0,
                                            color: Colors.white
                                        ),
                                      ),
                                      new SizedBox(height: 10.0,),
                                      new Text(snapshot[index].data["des"],
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.white
                                        ),
                                      ),
                                      new SizedBox(height: 5.0,),

                                      new Container(
                                        child: new Row(
                                          children: <Widget>[

                                            new Icon(Icons.remove_red_eye,
                                              color: Colors.orange,
                                            ),
                                            new SizedBox(width: 5.0,),
                                            new Text("View",
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.white
                                              ),
                                            )

                                          ],
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),

                        );
                      }
                  ),

                )

              ],
            ),
          ),

          //First Container end..

          //second container start...

          new Container(
            margin: EdgeInsets.all(10.0),
            height: 150.0,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Center(
              child: Container(
                height: 350.0,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 7.0,
                  dotIncreasedColor: Colors.red,
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomCenter,
                  dotVerticalPadding: 7.0,
                  showIndicator: true,
                  borderRadius: true,
                  indicatorBgPadding: 10.0,
                  overlayShadow: true,
                  overlayShadowColors: Colors.black.withOpacity(0.4),
                  overlayShadowSize: 10.0,

                  images: [
                    NetworkImage('https://images.pexels.com/photos/344029/pexels-photo-344029.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                    NetworkImage('https://images.pexels.com/photos/1618269/pexels-photo-1618269.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                    NetworkImage('https://images.pexels.com/photos/2081007/pexels-photo-2081007.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                    NetworkImage('https://images.pexels.com/photos/1332237/pexels-photo-1332237.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940')

                  ],
                ),
              ),
            ),
          ),
          //second container end..
          //Third Container start...
          new Container(
            height: 300.0,
            margin: EdgeInsets.all(10.0),
            child: new ListView(
              children: <Widget>[

                new Container(
                  child: new Row(
                    children: <Widget>[

                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>InternationalNews()));
                              },
                              child: new Text("International News",
                              style: TextStyle(
                                fontSize: 19.0,
                                color: Colors.white
                              ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      new SizedBox(width: 10.0,),
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),

                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Sports()));
                              },
                              child: new Text("Sports News",
                                style: TextStyle(
                                    fontSize: 19.0,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),//first container end..

                new SizedBox(height: 10.0,),

                new Container(
                  child: new Row(
                    children: <Widget>[

                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),

                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>LocalNews()));
                              },
                              child: new Text("Local News",
                                style: TextStyle(
                                    fontSize: 19.0,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      new SizedBox(width: 10.0,),

                      new Expanded(
                        flex: 1,
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xFF272B4A),
                          ),

                          child: Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>Politcs()));
                              },
                              child: new Text("Politics News",
                                style: TextStyle(
                                    fontSize: 19.0,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),


              ],
            ),
          )


          //Third Container End....



        ],
      ),

    );
  }
}


