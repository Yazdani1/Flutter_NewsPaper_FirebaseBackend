import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
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
                accountName: null
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



    );
  }
}


