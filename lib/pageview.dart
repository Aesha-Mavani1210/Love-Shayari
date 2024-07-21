import 'dart:math';
import 'package:share_plus/share_plus.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:loveshayri/categery.dart';
import 'package:flutter/material.dart';
import 'package:loveshayri/pencil_page.dart';
import 'package:loveshayri/setting.dart';

class pageview extends StatefulWidget {
  List shayri = [];
  int cindex;
  pageview(this.shayri,this.cindex);

  @override
  State<pageview> createState() => _pageviewState();
}

class _pageviewState extends State<pageview> {
  PageController? Controller;
  List myclr = [];
  bool clrtemp = false;
  int clrind = 0;
  Color mclr = Colors.pinkAccent;
  int z = 0;
  int clring=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PageController(initialPage: widget.cindex);
  }

  @override

  Widget build(BuildContext context) {
    double statusbarheight = MediaQuery.of(context).viewPadding.top;
    double appbarheight = kToolbarHeight;
    double total = statusbarheight+appbarheight;
    double height = MediaQuery.of(context).size.height - total;

    return Scaffold(
      appBar: AppBar(
        title: Text("LOVE SHAYARI"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                Share.share("https://play.google.com/store/search?q=love+shayari&c=apps");
              },
              icon: Icon(
                Icons.share,
                size: 25,
              ),
              color: Colors.white),
          PopupMenuButton(
            onSelected: (s) {
              if (s == 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Setting_page()));
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 0,
                  child: Text("Setting"),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text("Rate US"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text("Share"),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("More Apps 1"),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("More Apps 2"),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("Free Apps 1"),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text("Free Apps 2"),
                ),
              ];
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /*Container(child: ListTile(leading: Image(image: AssetImage("images/${data.aa[widget.cindex]}")),),)*/
          Container(
            child: Column(children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                                height: height,
                                color: Colors.white60,
                                child: GridView.builder(
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10),
                                  itemCount: widget.shayri.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        clrtemp = true;
                                        clrind = index;
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                              data.mycolor[index],
                                              data.mycolor[index + 1]
                                            ])),
                                        child: Center(
                                          child: Text(
                                            "  ☺😊😇🌻🌴🌹😍\n  🥰😘😊\n  प्यार मोहब्बत शायरी\n  ☺🌴🌹🙂😍🥀🌻\n 🌴🌹🌹",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ));
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/expand.png"))),

                      ),
                    ),
                    Text("${widget.cindex + 1}/${widget.shayri.length}"),
                    InkWell(
                        onTap: () {
                          // z = Random().nextInt(data.bg_txt_color.length);
                          // Color  myclr= data.bg_txt_color[z];
                          setState(() {

                            // mclr=myclr;
                            var r = Random().nextInt(data.mycolor.length-1);
                            clrind= r ;
                            clrtemp = true;


                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/reload.png"))),
                        ))
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height:350,
                  decoration: BoxDecoration(
                      color: (clrtemp == false) ? mclr : null,
                      gradient: (clrtemp == true)
                          ? LinearGradient(colors: [
                        data.mycolor[clrind],
                        data.mycolor[clrind + 1]
                      ])
                          : null),
                  child: PageView.builder(
                    controller: Controller,
                    onPageChanged: (value) {
                      widget.cindex = value;
                      setState(() {});
                    },
                    itemCount: widget.shayri.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(child: Column(
                        children: [
                          Text("${data.emoji[widget.cindex]}"),
                          Text(
                            "${widget.shayri[widget.cindex]}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                          Text("${data.emoji[widget.cindex]}")
                        ],
                      ),);
                    },
                  ))
            ]),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    FlutterClipboard.copy("${widget.shayri[widget.cindex]}")
                        .then((value) => print('copied'));
                  },
                  child: Icon(
                    Icons.copy_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (widget.cindex != 0) {
                      widget.cindex--;
                      Controller?.jumpToPage(widget.cindex);
                    }
                    setState(
                          () {},
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Edit(widget.cindex,widget.shayri) ;
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/pencil2.png"))),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (widget.cindex < widget.shayri.length - 1) {
                      widget.cindex++;
                      Controller?.jumpToPage(widget.cindex);
                    }
                    setState(() {});
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Share.share("${widget.shayri[widget.cindex]}");
                    setState(() {});
                  },
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
