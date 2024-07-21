import 'package:flutter/material.dart';
import 'package:math_puzzles/list.dart';
import 'package:math_puzzles/win.dart';

class Continue extends StatefulWidget {
  const Continue({Key? key}) : super(key: key);

  @override
  State<Continue> createState() => _ContinueState();
}

class _ContinueState extends State<Continue> {
  String f1 = "ff";
  int level_idx = 1;
  TextEditingController t1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/gameplaybackground.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/skip.png"))),
                  ),
                ),
                Container(
                    height: 60,
                    width: 200,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/level_board.png"),
                          fit: BoxFit.fill),
                    ),
                    child: Center(
                      child: Text(
                        "Puzzle ${level_idx+1}",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: f1,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    )),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(right: 10, top: 10),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/hint.png"))),
                  ),
                )
              ]),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 230,
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 110),
                      child: Image(
                        image: AssetImage("images/${demo.level_img}"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      width: 350,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 300,
                                height: 35,
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                color: Colors.white,
                                child: TextField(
                                  controller: t1,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (t1.text != "") {
                                    t1.text = t1.text
                                        .substring(0, t1.text.length - 1);
                                  }
                                },
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                          AssetImage("images/delete.png"))),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return win();
                                    },
                                  ));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(0),
                                  child: Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     InkWell(
                          //       onTap: () {
                          //         t1.text += "1";
                          //       },
                          //       child: Container(
                          //         width: 30,
                          //         height: 35,
                          //         decoration: BoxDecoration(
                          //             border: Border.all(color: Colors.white),
                          //             borderRadius: BorderRadius.circular(5)),
                          //         child: Center(
                          //             child: Text(
                          //           "1",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20),
                          //         )),
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         t1.text += "2";
                          //       },
                          //       child: Container(
                          //         width: 30,
                          //         height: 35,
                          //         //margin: EdgeInsets.only(right: 2, bottom: 2),
                          //         decoration: BoxDecoration(
                          //             border: Border.all(color: Colors.white),
                          //             borderRadius: BorderRadius.circular(5)),
                          //         child: Center(
                          //             child: Text(
                          //           "2",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20),
                          //         )),
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         t1.text += "3";
                          //       },
                          //       child: Container(
                          //         width: 30,
                          //         height: 35,
                          //         // margin: EdgeInsets.only(right: 2, bottom: 2),
                          //         decoration: BoxDecoration(
                          //             border: Border.all(color: Colors.white),
                          //             borderRadius: BorderRadius.circular(5)),
                          //         child: Center(
                          //             child: Text(
                          //           "3",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20),
                          //         )),
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         t1.text += "4";
                          //       },
                          //       child: Container(
                          //         width: 30,
                          //         height: 35,
                          //         //margin: EdgeInsets.only(right: 2, bottom: 2),
                          //         decoration: BoxDecoration(
                          //             border: Border.all(color: Colors.white),
                          //             borderRadius: BorderRadius.circular(5)),
                          //         child: Center(
                          //             child: Text(
                          //           "4",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20),
                          //         )),
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         t1.text += "5";
                          //       },
                          //       child: Container(
                          //         width: 30,
                          //         height: 35,
                          //         // margin: EdgeInsets.only(right: 2, bottom: 2),
                          //         decoration: BoxDecoration(
                          //             border: Border.all(color: Colors.white),
                          //             borderRadius: BorderRadius.circular(5)),
                          //         child: Center(
                          //             child: Text(
                          //           "5",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20),
                          //         )),
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         t1.text += "6";
                          //       },
                          //       child: Container(
                          //         width: 30,
                          //         height: 35,
                          //         //  margin: EdgeInsets.only(right: 2, bottom: 2),
                          //         decoration: BoxDecoration(
                          //             border: Border.all(color: Colors.white),
                          //             borderRadius: BorderRadius.circular(5)),
                          //         child: Center(
                          //             child: Text(
                          //           "6",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20),
                          //         )),
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         t1.text += "7";
                          //       },
                          //       child: Container(
                          //         width: 30,
                          //         height: 35,
                          //         // margin: EdgeInsets.only(right: 2, bottom: 2),
                          //         decoration: BoxDecoration(
                          //             border: Border.all(color: Colors.white),
                          //             borderRadius: BorderRadius.circular(5)),
                          //         child: Center(
                          //             child: Text(
                          //           "7",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20),
                          //         )),
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         t1.text += "8";
                          //       },
                          //       child: Container(
                          //         width: 30,
                          //         height: 35,
                          //         // margin: EdgeInsets.only(right: 2, bottom: 2),
                          //         decoration: BoxDecoration(
                          //             border: Border.all(color: Colors.white),
                          //             borderRadius: BorderRadius.circular(5)),
                          //         child: Center(
                          //             child: Text(
                          //           "8",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20),
                          //         )),
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         t1.text += "9";
                          //       },
                          //       child: Container(
                          //         width: 30,
                          //         height: 35,
                          //         //  margin: EdgeInsets.only(right: 2, bottom: 2),
                          //         decoration: BoxDecoration(
                          //             border: Border.all(color: Colors.white),
                          //             borderRadius: BorderRadius.circular(5)),
                          //         child: Center(
                          //             child: Text(
                          //           "9",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20),
                          //         )),
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         t1.text += "0";
                          //       },
                          //       child: Container(
                          //         width: 30,
                          //         height: 35,
                          //         // margin: EdgeInsets.only(right: 5, bottom: 5),
                          //         decoration: BoxDecoration(
                          //             border: Border.all(color: Colors.white),
                          //             borderRadius: BorderRadius.circular(5)),
                          //         child: Center(
                          //             child: Text(
                          //           "0",
                          //           style: TextStyle(
                          //               color: Colors.white, fontSize: 20),
                          //         )),
                          //       ),
                          //     )
                          //   ],
                          // )
                          Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    my_btn(1),
                                    my_btn(2),
                                    my_btn(3),
                                    my_btn(4),
                                    my_btn(5),
                                    my_btn(6),
                                    my_btn(7),
                                    my_btn(8),
                                    my_btn(9),
                                    my_btn(10),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget my_btn(int a) {
    return Expanded(
        child: Container(
          child: InkWell(
            onTap: () {
              t1.text += "$a";
            },
            child: Container(
              width: 30,
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                    "$a",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ),
        ));
  }
}
