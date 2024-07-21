import 'package:flutter/material.dart';
import 'package:math_puzzles/main.dart';

class win extends StatefulWidget {
  const win({Key? key}) : super(key: key);

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "PUZZLE 1 COMPLETED",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.indigo),
              ),
            ),
            Center(
              child: Container(
                height: 250,
                width: 200,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/trophy.png"),
                        fit: BoxFit.fill)),
              ),
            ),
            Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 150,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black12, Colors.white, Colors.black12]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(),
                    ),
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                )),
            Center(
                child: Container(
                  height: 40,
                  width: 150,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.black12, Colors.white, Colors.black12]),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(),
                  ),
                  child: Text(
                    "MAIN MENU",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                )),
            Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return dashboard();
                      },
                    ));
                  },
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 150,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black12, Colors.white, Colors.black12]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(),
                      ),
                      child: Text(
                        "BUY PRO",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                )),
            Center(
              child: Text(
                "SHARE THIS PUZZLE",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.indigo),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return dashboard();
                    },
                  ));
                },
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient:
                      LinearGradient(colors: [Colors.grey, Colors.white]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(),
                    ),
                    child: Image(
                      image: AssetImage("images/shareus.png"),
                      width: 40,
                      height: 45,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
