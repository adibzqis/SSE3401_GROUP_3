import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          //margin: EdgeInsetsDirectional.only(bottom: 450.0),
          color: Color.fromARGB(169, 211, 255, 204),
          child: Center(
            child: Column(
              children: [
                Container(
                  //Top Container
                  height: 150,
                  color: Color.fromARGB(169, 203, 242, 255),
                  child: Row(
                    children: [
                      Stack(
                        children: [


                          Align(
                            alignment: AlignmentGeometry.bottomEnd,
                            child: Text("Background")
                            ),


                          Align(
                            alignment: AlignmentGeometry.center,
                            child: Container(
                              margin: EdgeInsets.only(top: 70),
                              child: Text(
                                "Title Text",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight(670),
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  backgroundColor: Color.fromARGB(255,251,0,255,),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_active),
              //color: Color.fromARGB(0, 0, 0, 0),
            ),
          ],
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
          centerTitle: true,
          title: Text("FSKTM NAVIGATOR"),
          actionsPadding: EdgeInsets.all(4),
          titleTextStyle: TextStyle(
            foreground: Paint()..color = Colors.green,
            fontSize: 18.0,
            fontWeight: FontWeight(670),
          ),
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.list)),
        ),
      ),
    );
  }
}
