import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'floor_selection_screen.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Removed the MaterialApp wrapper
      body: _buildBody(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          print("Navigation item $index tapped");
        },
      ),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.list, color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.group, color: Colors.black),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      "Assets/backgroundhomepage.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "FSKTM NAVIGATOR",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight(670),
                        fontSize: 28,
                        color: const Color.fromARGB(255, 66, 192, 70),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              color: const Color.fromARGB(169, 211, 255, 204),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 12.0),
                          child: Text(
                            "Quick Access:",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildDashboardItem(
                            icon: Icons.business,
                            title: "Block A",
                            onTap: () {
                              _openFloorSelection(context, 'Block A', [
                                'Ground Floor',
                                'Level 1',
                                'Level 2',
                              ]);
                            },
                          ),
                          _buildDashboardItem(
                            icon: Icons.business,
                            title: "Block B",
                            onTap: () {
                              _openFloorSelection(context, 'Block B', [
                                'Level 1',
                                'Level 2',
                                'Level 3',
                              ]);
                            },
                          ),
                          _buildDashboardItem(
                            icon: Icons.business,
                            title: "Block C",
                            onTap: () {
                              _openFloorSelection(context, 'Block C', [
                                'Level 1',
                                'Level 2',
                              ]);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "Bla Bla",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height:30),
                          Text(
                            "Bla Bla Bla",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 8,
                        right: 12,
                        child: Icon(
                          Icons.arrow_forward,
                          size: 24,
                          color: const Color.fromARGB(255, 66, 192, 70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }

  void _openFloorSelection(BuildContext context, String blockName, List<String> floors) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FloorSelectionScreen(
          blockName: blockName,
          floors: floors,
        ),
      ),
    );
  }

  Widget _buildDashboardItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              shadows: [
                Shadow(
                  color: const Color.fromARGB(255, 134, 203, 65).withValues(alpha: 0.3),
                  offset: Offset(2, 2),
                  blurRadius: 3,
                ),
              ],
              size: 40,
              color: const Color.fromARGB(255, 66, 192, 70),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
