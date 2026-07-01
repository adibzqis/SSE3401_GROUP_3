import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'mapping.dart';
import '../widgets/bottom_nav_bar.dart';
import 'Block_Selection1.dart';
import 'FacilitiesListScreen.dart';
import 'floor_selection_screen.dart';
import 'GreenAwarenessScreen.dart';
import 'notification_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> _searchItems = [
    {
      'title': 'Block A',
      'subtitle': 'Ground Floor, Level 1, Level 2',
      'type': 'block',
      'block': 'Block A',
      'floors': ['Ground Floor', 'Level 1', 'Level 2'],
    },
    {
      'title': 'Block B',
      'subtitle': 'Level 1, Level 2, Level 3',
      'type': 'block',
      'block': 'Block B',
      'floors': ['Level 1', 'Level 2', 'Level 3'],
    },
    {
      'title': 'Block C',
      'subtitle': 'Ground Floor, Level 1, Level 2, Level 3',
      'type': 'block',
      'block': 'Block C',
      'floors': ['Ground Floor', 'Level 1', 'Level 2', 'Level 3'],
    },
    {
      'title': 'Block A - Ground Floor',
      'subtitle': 'View the ground floor map for Block A',
      'type': 'floor',
      'block': 'Block A',
      'floor': 'Ground Floor',
    },
    {
      'title': 'Block A - Level 1',
      'subtitle': 'View the level 1 map for Block A',
      'type': 'floor',
      'block': 'Block A',
      'floor': 'Level 1',
    },
    {
      'title': 'Block A - Level 2',
      'subtitle': 'View the level 2 map for Block A',
      'type': 'floor',
      'block': 'Block A',
      'floor': 'Level 2',
    },
    {
      'title': 'Block B - Level 1',
      'subtitle': 'View the level 1 map for Block B',
      'type': 'floor',
      'block': 'Block B',
      'floor': 'Level 1',
    },
    {
      'title': 'Block B - Level 2',
      'subtitle': 'View the level 2 map for Block B',
      'type': 'floor',
      'block': 'Block B',
      'floor': 'Level 2',
    },
    {
      'title': 'Block B - Level 3',
      'subtitle': 'View the level 3 map for Block B',
      'type': 'floor',
      'block': 'Block B',
      'floor': 'Level 3',
    },
    {
      'title': 'Block C - Ground Floor',
      'subtitle': 'View the ground floor map for Block C',
      'type': 'floor',
      'block': 'Block C',
      'floor': 'Ground Floor',
    },
    {
      'title': 'Block C - Level 1',
      'subtitle': 'View the level 1 map for Block C',
      'type': 'floor',
      'block': 'Block C',
      'floor': 'Level 1',
    },
    {
      'title': 'Block C - Level 2',
      'subtitle': 'View the level 2 map for Block C',
      'type': 'floor',
      'block': 'Block C',
      'floor': 'Level 2',
    },
    {
      'title': 'Block C - Level 3',
      'subtitle': 'View the level 3 map for Block C',
      'type': 'floor',
      'block': 'Block C',
      'floor': 'Level 3',
    },
    {
      'title': 'Campus Map',
      'subtitle': 'Open the FSKTM campus guide page',
      'type': 'map',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.trim();
    });
  }

  List<Map<String, dynamic>> _getSearchResults() {
    if (_searchQuery.isEmpty) {
      return [];
    }

    final lowerQuery = _searchQuery.toLowerCase();
    return _searchItems.where((item) {
      final title = (item['title'] as String).toLowerCase();
      final subtitle = (item['subtitle'] as String).toLowerCase();
      return title.contains(lowerQuery) || subtitle.contains(lowerQuery);
    }).toList();
  }

  void _openSearchResult(BuildContext context, Map<String, dynamic> item) {
    final type = item['type'] as String;
    if (type == 'block') {
      _openFloorSelection(
        context,
        item['block'] as String,
        item['floors'] as List<String>,
      );
    } else if (type == 'floor') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FloorSelectionScreen(
            blockName: item['block'] as String,
            floors: [item['floor'] as String],
          ),
        ),
      );
    } else if (type == 'map') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Mapping()),
      );
    }
  }

  Widget _buildSearchResults() {
    final results = _getSearchResults();
    if (results.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          'No results found for "$_searchQuery"',
          style: TextStyle(
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: results.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, color: Color(0xFFF3F4F6)),
        itemBuilder: (context, index) {
          final item = results[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4,
            ),
            title: Text(
              item['title'] as String,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              item['subtitle'] as String,
              style: TextStyle(color: Colors.grey[500], fontSize: 13),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Color.fromARGB(255, 66, 192, 70),
            ),
            onTap: () => _openSearchResult(context, item),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9),
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
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeScreen();
      case 1:
        return BlockSelection(onBack: () => setState(() => _currentIndex = 0));
      case 2:
        return const Mapping();
      case 3:
        return const FacilitiesListScreen();
      case 4:
        return const AboutScreen();
      default:
        return _buildHomeScreen();
    }
  }

  Widget _buildHomeScreen() {
    const themeColor = Color.fromARGB(255, 66, 192, 70);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 240,
          pinned: true,
          elevation: 0,
          backgroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.only(bottom: 56),
            title: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "FSKTM NAVIGATOR",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            background: Image.asset(
              "Assets/backgroundhomepage.jpg",
              fit: BoxFit.cover,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.85),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        // Body Segment wrapped in a responsive design container safely centered
        SliverToBoxAdapter(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 650,
              ), // Standard layout alignment cap
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // High-Class Search Bar Design
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search, color: themeColor),
                        hintText: 'Search rooms, facilities or blocks',
                        hintStyle: TextStyle(
                          color: Colors.black38,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),

                  if (_searchQuery.isNotEmpty) _buildSearchResults(),

                  if (_searchQuery.isEmpty) ...[
                    const SizedBox(height: 28),
                    const Text(
                      "Quick Access",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Elegant structural layout instead of standard raw boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: _buildDashboardItem(
                            icon: Icons.corporate_fare_rounded,
                            title: "Block A",
                            onTap: () => _openFloorSelection(
                              context,
                              'Block A',
                              ['Ground Floor', 'Level 1', 'Level 2'],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDashboardItem(
                            icon: Icons.corporate_fare_rounded,
                            title: "Block B",
                            onTap: () => _openFloorSelection(
                              context,
                              'Block B',
                              ['Level 1', 'Level 2', 'Level 3'],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDashboardItem(
                            icon: Icons.corporate_fare_rounded,
                            title: "Block C",
                            onTap: () => _openFloorSelection(
                              context,
                              'Block C',
                              ['Ground Floor', 'Level 1', 'Level 2', 'Level 3'],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Main Showcase Navigation Info Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: themeColor.withOpacity(0.12),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: themeColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.explore_outlined,
                                  color: themeColor,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "Get Started",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            "Navigate FSKTM with Ease",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: themeColor,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Explore our interactive campus maps, locate facilities, and find your way around FSKTM. Use the Quick Access section above to explore different blocks and floors.",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                              height: 1.5,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Divider(color: Color(0xFFF3F4F6), height: 1),
                          ),

                          // Sensible replacement instead of "Bla Bla Bla"
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.lightbulb_outline_rounded,
                                color: Colors.orangeAccent,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Campus Info Tip",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      "Main lecture halls (DK1-DK4) are predominantly structured inside Block A, while labs and faculty support hubs populate Blocks B and C.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[500],
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
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

  // Modern block selector widget style
  Widget _buildDashboardItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    const themeColor = Color.fromARGB(255, 66, 192, 70);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withOpacity(0.03)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.015),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: themeColor.withOpacity(0.08),
              child: Icon(icon, size: 24, color: themeColor),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
