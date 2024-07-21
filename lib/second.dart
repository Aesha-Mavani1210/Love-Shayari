import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loveshayri/categery.dart';
import 'package:loveshayri/pageview.dart';
import 'package:loveshayri/setting.dart';
import 'package:share_plus/share_plus.dart';

class second extends StatefulWidget {
  int l;
  second(this.l,);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List my = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.l == 0) {
      my = data.wish;
    } else if (widget.l == 1) {
      my=data.friend;
    } else if (widget.l == 2) {
      my=data.majedar;
    } else if (widget.l == 3) {
      my=data.god;
    } else if (widget.l == 4) {
      my=data.pre;
    } else if (widget.l == 5) {
      my=data.jivan;
    } else if (widget.l == 6) {
      my=data.mahobat;
    } else if (widget.l == 7) {
      my=data.yade;
    } else if (widget.l == 8) {
      my=data.other;
    } else if (widget.l == 9) {
      my=data.politic;
    } else if (widget.l == 10) {
      my=data.love;
    } else if (widget.l == 11) {
      my=data.sad;
    } else if (widget.l == 12) {
      my=data.sharab;
    } else if (widget.l == 13) {
      my=data.bevafa;
    } else if (widget.l == 14) {
      my=data.brithday;
    } else if (widget.l==15){
      my=data.holi;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOVE SHAYRI"),
        backgroundColor: Colors.green,actions: [
          IconButton(
          onPressed: () {
    Share.share("https://play.google.com/store/search?q=love+shayari&c=apps");
    },
        icon: Icon(
          Icons.share,
          size: 25,
        ),
        color: Colors.white),PopupMenuButton(
          onSelected: (s) {
            if (s == 0) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Setting_page(),
                  ));
            }
          },
          itemBuilder: (context) {
          return[PopupMenuItem(value: 0,child: Text("setting"),
          ),
            PopupMenuItem(value: 1,child: Text("rate us"),
            ),
            PopupMenuItem(value: 2,child: Text("share"),
            ),
            PopupMenuItem(value: 3,child: Text("More Apps 1"),
            ),
            PopupMenuItem(value: 3,child: Text("More Apps 2"),
            ),
            PopupMenuItem(value: 3,child: Text("Free Apps 1"),
            ),
            PopupMenuItem(value: 3,child: Text("Free Apps 2"),
            ),
          ];
        },)
      ],
      ),
      body: Container(
        color: Colors.grey[300],
        child: ListView.separated(
          itemCount: my.length,
          itemBuilder: (context, index) {
            return Card(
              child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return pageview(my, index);
                      },
                    ));
                  },
                  child: Container(
                     // padding: EdgeInsets.only(right: 10, bottom: 5, top: 5),
                      color: Colors.purpleAccent,
                     /// margin: EdgeInsets.all(5),
                      child: ListTile(
                        leading: (Image(
                          image: AssetImage(
                            ("images/${data.img[widget.l]}"),
                          ),
                        )),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${my[index]}",
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("${my[index].toString().substring(0, 20)}")
                          ],
                        ),
                        trailing: (Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )),
                      ))),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
