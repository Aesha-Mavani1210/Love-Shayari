import 'package:flutter/material.dart';
import 'package:loveshayri/second.dart';
import 'package:loveshayri/setting.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(MaterialApp(
    home: dashboard(),debugShowCheckedModeBanner: false,
  ));
}

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  void initState() {

    super.initState();
    get_permission();
  }
  get_permission()
  async{
    var status = await Permission.storage.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
      print(statuses[Permission.storage]);
    }
  }

  List l = [
    "शुभकामनाएं शायरी",
    "दोस्ती शायरी",
    "मजेदार शायरी",
    "भगवान शायरी",
    "प्रेरणा स्त्रोत शायरी",
    "जीवन शायरी",
    "मोहब्बत शायरी",
    "यादे शायरी",
    "अन्य शायरी",
    "राजनीति शायरी",
    "प्रेम शायरी",
    "दर्द शायरी",
    "शराब शायरी",
    "बेवफा शायरी",
    "जन्मदिन शायरी",
    "होली शायरी",
  ];
  List img = [
    "bestwishesh.jpg",
    "b.jpg",
    "child.png",
    "god.png",
    "l.jpg",
    "e.jpg",
    "married.png",
    "d.jpg",
    "g.jpg",
    "f.jpg",
    "c.jpg",
    "j.jpg",
    "bearbar.png",
    "k.jpg",
    "h.jpg",
    "i.jpg",
  ];

  @override
  Widget build(BuildContext context) {
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
            PopupMenuButton(onSelected:(s) {
            if (s == 0) {
            Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => Setting_page(),
            ));
            }
            },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 0,
                    child: Text("setting"),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text("rate us"),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text("share"),
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
        body: Container(
          color: Colors.black12,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return second(index);
                        },
                      ));
                    },
                    child: Container(
                        //padding: EdgeInsets.only(top: 5,right: 10,bottom: 5),
                      color: Colors.white60,
                      //margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          "${l[index]}",
                        ),
                        shape: CircleBorder(),
                        leading: CircleAvatar(
                            foregroundImage: AssetImage("images/${img[index]}")),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: l.length),
        ));
  }
}
