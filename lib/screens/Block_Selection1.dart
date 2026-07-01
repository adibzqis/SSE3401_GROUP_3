import 'package:flutter/material.dart';
import 'floor_selection_screen.dart';

class BlockSelection extends StatefulWidget {
  const BlockSelection({super.key});

  @override
  State<BlockSelection> createState() => _BlockSelectionState();
}

class _BlockSelectionState extends State<BlockSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        leading: Icon(Icons.arrow_back),
        title: Container(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            "Select Block",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight(900)),
          ),
        ),
      ),
      body: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: AlignmentGeometry.xy(-0.76, 1),
                    child: Text(
                      "Choose a block to explore",
                      style: TextStyle(fontWeight: FontWeight(600)),
                    ),
                  ),

                  Stack(
                    //Block A
                    alignment: AlignmentGeometry.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FloorSelectionScreen(
                                blockName: 'Block A',
                                floors: ['Ground Floor', 'Level 1', 'Level 2'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 500,
                          height: 200,
                          child: Card.outlined(
                            margin: EdgeInsets.all(15),
                            elevation: 3,
                            shadowColor: Color.fromARGB(255, 0, 0, 0),
                            color: Color.fromARGB(255, 255, 224, 224),
                            child: Column(
                              children: [
                                SizedBox(height: 48),
                                Align(
                                  alignment: AlignmentGeometry.xy(-0.9, 1),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentGeometry.xy(-0.9, 1),
                                        child: Text(
                                          "Block A",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight(650),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentGeometry.xy(-0.87, 1),
                                        child: Text(
                                          "View Rooms, Floors, and \n Facilities",
                                          textScaler: TextScaler.linear(1.2),
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight(500),
                                          ),
                                          textWidthBasis:
                                              TextWidthBasis.parent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 30,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FloorSelectionScreen(
                                  blockName: 'Block A',
                                  floors: [
                                    'Ground Floor',
                                    'Level 1',
                                    'Level 2'
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.next_plan, size: 30),
                        ),
                      ),
                      Positioned(
                        top: 105,
                        right: 50,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FloorSelectionScreen(
                                  blockName: 'Block A',
                                  floors: [
                                    'Ground Floor',
                                    'Level 1',
                                    'Level 2'
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.business_rounded,
                            size: 70,
                            color: Color.fromARGB(255, 237, 99, 99),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    //Block B
                    alignment: AlignmentGeometry.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FloorSelectionScreen(
                                blockName: 'Block B',
                                floors: ['Level 1', 'Level 2', 'Level 3'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 500,
                          height: 200,
                          child: Card.outlined(
                            margin: EdgeInsets.all(15),
                            elevation: 3,
                            shadowColor: Color.fromARGB(255, 0, 0, 0),
                            color: Color.fromARGB(255, 223, 232, 255),
                            child: Column(
                              children: [
                                SizedBox(height: 48),
                                Align(
                                  alignment: AlignmentGeometry.xy(-0.9, 1),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentGeometry.xy(-0.9, 1),
                                        child: Text(
                                          "Block B",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight(650),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentGeometry.xy(-0.87, 1),
                                        child: Text(
                                          "View Rooms, Floors, and \n Facilities",
                                          textScaler: TextScaler.linear(1.2),
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight(500),
                                          ),
                                          textWidthBasis:
                                              TextWidthBasis.parent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 30,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FloorSelectionScreen(
                                  blockName: 'Block B',
                                  floors: ['Level 1', 'Level 2', 'Level 3'],
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.next_plan, size: 30),
                        ),
                      ),
                      Positioned(
                        top: 105,
                        right: 50,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FloorSelectionScreen(
                                  blockName: 'Block B',
                                  floors: ['Level 1', 'Level 2', 'Level 3'],
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.business_rounded,
                            size: 70,
                            color: Color.fromARGB(255, 100, 139, 238),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    //Block C
                    alignment: AlignmentGeometry.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FloorSelectionScreen(
                                blockName: 'Block C',
                                floors: ['Level 1', 'Level 2'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 500,
                          height: 200,
                          child: Card.outlined(
                            margin: EdgeInsets.all(15),
                            elevation: 3,
                            shadowColor: Color.fromARGB(255, 0, 0, 0),
                            color: Color.fromARGB(224, 236, 255, 216),
                            child: Column(
                              children: [
                                SizedBox(height: 48),
                                Align(
                                  alignment: AlignmentGeometry.xy(-0.9, 1),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentGeometry.xy(-0.9, 1),
                                        child: Text(
                                          "Block C",
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight(650),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentGeometry.xy(-0.87, 1),
                                        child: Text(
                                          "View Rooms, Floors, and \n Facilities",
                                          textScaler: TextScaler.linear(1.2),
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight(500),
                                          ),
                                          textWidthBasis:
                                              TextWidthBasis.parent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 30,
                        right: 30,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FloorSelectionScreen(
                                  blockName: 'Block C',
                                  floors: ['Level 1', 'Level 2'],
                                ),
                              ),
                            );
                          },
                          child: Icon(Icons.next_plan, size: 30),
                        ),
                      ),
                      Positioned(
                        top: 105,
                        right: 50,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FloorSelectionScreen(
                                  blockName: 'Block C',
                                  floors: ['Level 1', 'Level 2'],
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.business_rounded,
                            size: 70,
                            color: Color.fromARGB(255, 174, 238, 105),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}