import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import 'Block_Selection1.dart';
import 'FacilitiesListScreen.dart';
import 'floor_selection_screen.dart';
import 'GreenAwarenessScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed the MaterialApp wrapper
      body: _buildBody(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BlockSelection()),
            ).then((_) {
              setState(() => _currentIndex = 0);
            });
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GreenAwarenessScreen(),
              ),
            ).then((_) {
              setState(() => _currentIndex = 0);
            });
          }
          print("Navigation item $index tapped");
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeScreen();
      case 1:
        return _buildBlockSelectionView();
      case 2:
        return _buildMapView();
      case 3:
        return _buildGreenView();
      case 4:
        return _buildAboutView();
      default:
        return _buildHomeScreen();
    }
  }

  Widget _buildHomeScreen() {
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
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
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search rooms, facilities or blocks',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            bottom: 12.0,
                          ),
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
                          const SizedBox(height: 12),
                          Text(
                            "Navigate FSKTM with Ease",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromARGB(255, 66, 192, 70),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Explore our interactive campus maps, locate facilities, and find your way around FSKTM. Use the Quick Access section above to explore different blocks and floors.",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[700],
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(height: 30),
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

  Widget _buildSearchView() {
    return Container(
      color: const Color.fromARGB(255, 232, 248, 236),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search rooms, blocks, or facilities',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Quick search tips',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _buildSearchTip('Search by room number or facility name.'),
            _buildSearchTip('Use block names like Block A, B, or C.'),
            _buildSearchTip('Tap the floor selection cards on the home page to open the floor map.'),
          ],
        ),
      ),
    );
  }

  Widget _buildBlockSelectionView() {
    return BlockSelection(
      onBack: () {
        setState(() {
          _currentIndex = 0;
        });
      },
    );
  }

  Widget _buildSearchTip(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(Icons.check_circle, size: 20, color: Color.fromARGB(255, 66, 192, 70)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floor Map'),
        backgroundColor: const Color.fromARGB(255, 66, 192, 70),
      ),
      body: const Center(child: Text('Map View')),
    );
  }

  Widget _buildGreenView() {
    return const FacilitiesListScreen();
  }

  Widget _buildAboutView() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: const Color.fromARGB(255, 66, 192, 70),
      ),
      body: const Center(child: Text('About View')),
    );
  }

  void _openFloorSelection(
    BuildContext context,
    String blockName,
    List<String> floors,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            FloorSelectionScreen(blockName: blockName, floors: floors),
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
                  color: const Color.fromARGB(
                    255,
                    134,
                    203,
                    65,
                  ).withValues(alpha: 0.3),
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
