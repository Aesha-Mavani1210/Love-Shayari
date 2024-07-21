import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:loveshayri/categery.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class Edit extends StatefulWidget {
  int cindex;
  List shayri = [];

  Edit(this.cindex, this.shayri);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  Color clr = Colors.red;
  Color tcolor = Colors.white;
  bool clrtmp = false, bclr = false, tclr = false;
  bool ebool=false;
  int eind=0;
  int clrind = 0, bind = 0, tind = 0;
  String ff = "f1";
  double fontsize = 15;
  double l = 10;
  int z = 0;
  Color mclr = Colors.red;
  List fontdata = [
    "f1",
    "f2",
    "f3",
    "f4",
    "f5",
    "f6",
    "f7",
    "f8",
    "f9",
    "f10",
  ];
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    // double statusbarheight = MediaQuery.of(context).viewPadding.top;
    // double appbarheight = kToolbarHeight;
    // double total = statusbarheight + appbarheight;
    // double height = MediaQuery.of(context).size.height - total;

    return Scaffold(
      appBar: AppBar(
        title: Text("फोटो पे शायरी लिखे"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  //color: Colors.purpleAccent,
                  decoration: BoxDecoration(
                    color: (clrtmp == false) ? clr : null,
                    gradient: (clrtmp == true)
                        ? LinearGradient(colors: [
                            data.mycolor[clrind],
                            data.mycolor[clrind + 1]
                          ])
                        : null,
                  ),
                  child: Column(children: [
                    Text(
                      "${data.emoji[widget.cindex]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "${widget.shayri[widget.cindex]}",
                      style: TextStyle(
                        fontSize: fontsize,
                        color: Colors.white,
                        fontFamily: ff,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${data.emoji[widget.cindex]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ]),
                );
              },
            ),
          ),
          Container(
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // z = Random().nextInt(data.bg_txt_color.length);
                        // Color  myclr= data.bg_txt_color[z];
                        setState(() {
                          //
                          //   mclr=myclr;
                          var r = Random().nextInt(data.mycolor.length - 1);
                          clrind = r;
                          clrtmp = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 15, left: 15, top: 5, bottom: 5),
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/reload.png"))),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          barrierColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              child: GridView.builder(
                                itemCount: widget.shayri.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5,
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      clrtmp = true;
                                      clrind = index;
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            data.mycolor[index],
                                            data.mycolor[index + 1]

                                            //Colors.yellow,
                                          ],
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${data.emoji[widget.cindex]}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            "प्यार मोहब्बत शायरी",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            "${data.emoji[widget.cindex]}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize:18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 15, left: 15, top: 5, bottom: 5),
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/expand.png"))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState1) {
                                return Container(
                                  height: 70,
                                  child: Slider(
                                    max: 30,
                                    min: 5,
                                    value: l,
                                    onChanged: (value) {
                                      l = value;
                                      fontsize = value;
                                      setState1(() {
                                        setState(() {});
                                      });
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                          height: 40,
                          width: 90,
                          color: Colors.redAccent,
                          margin: EdgeInsets.only(top: 5),
                          child: Center(
                            child: Text("Text size"),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                      showBottomSheet(context: context, builder: (context) {
                      return Container(
                        child:Row(
                          children: [
                           Expanded(child: Container(
                             height: 200,
                             child: ListView.separated(itemBuilder: (context, index) {
                                 return InkWell(
                                   onTap: () {
                                     ebool =true;
                                     eind =index;
                                     Navigator.pop(context);
                                     setState(() {
                                     });
                                   },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "${data.emoji[index]}",
                                  style: TextStyle(fontSize: 22),
                                  textAlign: TextAlign.center,
                                ),
                              )
                                 );
                             }, separatorBuilder: (context, index) {
                               return Container(
                                 margin: EdgeInsets.only(left: 10),
                                 child: Divider(
                                   thickness: 2,
                                   color: Color(0xF0EED1B6),
                                 ),
                               );
                             }, itemCount:data.emoji.length ),

                           ))
                          ],
                        )
                      );
                      },);
                      },
                      child: Container(
                          height: 40,
                          width: 90,
                          color: Colors.redAccent,
                          margin: EdgeInsets.only(top: 5),
                          child: Center(
                            child: Text("Emoji"),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 60,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: fontdata.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      ff = fontdata[index];
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 110,
                                      color: Colors.redAccent,
                                      margin: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "shayri",
                                        style: TextStyle(
                                            fontFamily: fontdata[index]),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                          height: 40,
                          width: 90,
                          color: Colors.redAccent,
                          margin: EdgeInsets.only(top: 5),
                          child: Center(
                            child: Text("Font"),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              margin: EdgeInsets.only(left: 5),
                              height: 100,
                              child: GridView.builder(
                                itemCount: data.bg_txt_color.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 10,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      //tclr = false;
                                      //tind = index;
                                      tcolor = data.bg_txt_color[index];
                                      //    mclr=data.bg_txt_color[index];
                                      setState(() {});
                                      print("textcolor");
                                    },
                                    child: Container(
                                      color: data.bg_txt_color[index],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                          height: 40,
                          width: 90,
                          color: Colors.redAccent,
                          margin: EdgeInsets.only(top: 5),
                          child: Center(
                            child: Text(
                              "Text color",
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                    InkWell(
                      onTap: () async {
                        bytes = await controller.capture();

                        var path = await ExternalPath
                            .getExternalStoragePublicDirectory(
                                ExternalPath.DIRECTORY_DOWNLOADS + "/Shayari");
                        Directory d = Directory(path);
                        if (!await d.exists()) {
                          d.create();
                        }
                        int r = Random().nextInt(1000);
                        String img_name = "img$r.jpg";
                        File f = File("${path}/${img_name}");
                        await f.writeAsBytes(bytes!);
                        Share.shareFiles(['${f.path}'], text: 'Great picture');
                        print(bytes);
                        setState(() {});
                      },
                      child: Container(
                          height: 40,
                          width: 90,
                          color: Colors.redAccent,
                          margin: EdgeInsets.only(top: 5),
                          child: Center(
                            child: Text("Share"),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 120,
                              child: GridView.builder(
                                itemCount: data.bg_txt_color.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 8,
                                        mainAxisSpacing: 15,
                                        crossAxisSpacing: 15),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        Navigator.pop(context);
                                        bclr = false;
                                        bind = index;
                                        clr = data.bg_txt_color[index];
                                      });
                                    },
                                    child: Container(
                                      color: data.bg_txt_color[index],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                          height: 40,
                          width: 90,
                          color: Colors.redAccent,
                          margin: EdgeInsets.only(top: 5),
                          child: Center(
                            child: Text(
                              "Background",
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
