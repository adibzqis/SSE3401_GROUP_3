import 'package:flutter/material.dart';

class BlockSelection extends StatefulWidget {
  const BlockSelection({super.key});

  @override
  State<BlockSelection> createState() => _BlockSelectionState();
}

class _BlockSelectionState extends State<BlockSelection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 1,
          shadowColor: Color.fromARGB(255, 0, 0, 0),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: Icon(Icons.arrow_back),
          title: Container(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Block Selection",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight(900)),
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                width: 500,
                height: 200,
                child: Card(
                  margin: EdgeInsets.all(15),
                  elevation: 3,
                  shadowColor: Color.fromARGB(255, 0, 0, 0),
                  color: Color.fromARGB(255, 255, 224, 224),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      color: Colors.black,
                      child: Text(
                        "Block A",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                width: 500,
                height: 200,
                child: Card(
                  margin: EdgeInsets.all(15),
                  elevation: 3,
                  shadowColor: Color.fromARGB(255, 0, 0, 0),
                  color: Color.fromARGB(255, 223, 232, 255),
                ),
              ),

              Container(
                width: 500,
                height: 200,
                child: Card(
                  margin: EdgeInsets.all(15),
                  elevation: 3,
                  shadowColor: Color.fromARGB(255, 0, 0, 0),
                  color: Color.fromARGB(224, 236, 255, 216),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
