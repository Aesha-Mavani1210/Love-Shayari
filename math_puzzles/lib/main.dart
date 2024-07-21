import 'package:flutter/material.dart';
import 'package:math_puzzles/puzzle.dart';

import 'continue.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: dashboard(),
  ));
}

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  String f1 = "ff";
  bool s_btn = false;
  bool ss=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("images/background.jpg"))),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Math Puzzles",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: GestureDetector(
                  onTapUp: (details) {
                    s_btn = false;
                    ss=false;
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Continue();
                      },
                    ));
                    setState(() {});
                  },
                  onTapDown: (details) {
                    s_btn = true;
                    ss=true;
                    setState(() {});
                  },
                  onTapCancel: () {
                    s_btn = false;
                    ss=false;
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                            AssetImage("images/blackboard_main_menu.png"))),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                border: (s_btn)
                                    ? Border.all(color: Colors.grey, width: 3)
                                    : null),
                            child: Text(
                              "CONTINUE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: f1,
                                  fontStyle: FontStyle.italic),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return lock();
                                },
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              //decoration: BoxDecoration(
                              //   borderRadius:
                              //   BorderRadius.all(Radius.circular(10)),
                              //   border: (ss)
                              //       ? Border.all(color: Colors.grey, width: 3)
                              //       : null),
                              child: Text(
                                "PUZZLES",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: f1,
                                    fontStyle: FontStyle.italic),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(10),
                              // decoration: BoxDecoration(
                              //     borderRadius:
                              //     BorderRadius.all(Radius.circular(10)),
                              //     border: (s_btn)
                              //         ? Border.all(color: Colors.grey, width: 3)
                              //         : null),
                              child: Text(
                                "BUY PRO",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontFamily: f1,
                                    fontStyle: FontStyle.italic),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 5, 5, 10),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.white]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),),
                          border: Border.all(),
                        ),
                        child: Image(
                          image: AssetImage("images/shareus.png"),
                          width: 35,
                          height: 35,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.grey, Colors.white]),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(),
                        ),
                        child: Image(
                          image: AssetImage(
                            "images/emailus.png",),
                          width: 35,
                          height: 35,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
