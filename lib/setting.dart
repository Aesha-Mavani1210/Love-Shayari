import 'dart:math';

import 'package:flutter/material.dart';

class Setting_page extends StatefulWidget {
  const Setting_page({Key? key}) : super(key: key);

  @override
  State<Setting_page> createState() => _Setting_pageState();
}

class _Setting_pageState extends State<Setting_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.green,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Text("Emoji Settings",style: TextStyle(fontSize: 23),),
          ),
          Container(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: 150,
                  height:40,
                  color: Colors.pink,
                  child: Text("Emoji",style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width: 150,
                  height:40,
                  color: Colors.green,
                  child: Text("No Emoji",style: TextStyle(fontSize: 20,color: Colors.white),textAlign: TextAlign.center,),
                ),
              ],
            ),
          ),
          Divider(height: 5,thickness: 2,),
          Container(
            margin: EdgeInsets.all(10),
            child: Text("Rate Us",style: TextStyle(fontSize: 23),),
          ),
          Divider(height: 5,thickness: 2,),
          Container(
            margin: EdgeInsets.all(10),
            child: Text("Share",style: TextStyle(fontSize: 23),),
          ),
          Divider(height: 5,thickness: 2,),
          Container(
            margin: EdgeInsets.all(10),
            child: Text("More Apps",style: TextStyle(fontSize: 23),),
          ),
        ],
      ),
    );
  }
}
