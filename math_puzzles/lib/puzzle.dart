import 'package:flutter/material.dart';

class lock extends StatefulWidget {
  const lock({Key? key}) : super(key: key);

  @override
  State<lock> createState() => _lockState();
}

class _lockState extends State<lock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.jpg"), fit: BoxFit.fill)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Container(
                        height: 99,
                        child: Center(
                          child: Text(
                            "Select Puzzle",
                            style: TextStyle(
                              fontSize: 35,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        )))
              ],
            ),
            Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.2),
                  itemCount: 28,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/lock.png"))),
                      ),
                    );
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Expanded(
                    child: Container(
                      height: 70,
                      width: 100,
                      margin: EdgeInsets.fromLTRB(300, 0, 0, 0),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/next.png"))),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
