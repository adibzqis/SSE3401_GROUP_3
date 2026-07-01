import 'package:flutter/material.dart';
import 'floor_selection_screen.dart';

class BlockSelection extends StatefulWidget {
  final VoidCallback? onBack;

  const BlockSelection({super.key, this.onBack});

  @override
  State<BlockSelection> createState() => _BlockSelectionState();
}

class _BlockSelectionState extends State<BlockSelection> {
  // Ultra-clean high class color codes locked down
  final List<Map<String, dynamic>> blocks = [
    {
      'title': 'Block A',
      'subtitle': 'Explore premium suites, main halls, and ground facilities.',
      'floors': ['Ground Floor', 'Level 1', 'Level 2'],
      'gradient': <Color>[Color(0xFFFFF0F0), Color(0xFFFFE4E4)],
      'accentColor': Color(0xFFE57373),
      'icon': Icons.corporate_fare_rounded,
    },
    {
      'title': 'Block B',
      'subtitle': 'Access executive workspaces, tech hubs, and server units.',
      'floors': ['Ground Floor', 'Level 1', 'Level 2'],
      'gradient': <Color>[Color(0xFFF0F4FF), Color(0xFFE2ECFF)],
      'accentColor': Color(0xFF64B5F6),
      'icon': Icons.domain_rounded,
    },
    {
      'title': 'Block C',
      'subtitle': 'Discover structural research zones and innovation labs.',
      'floors': ['Ground Floor', 'Level 1', 'Level 2', 'Level 3'],
      'gradient': <Color>[Color(0xFFF5FDF0), Color(0xFFE8F8DE)],
      'accentColor': Color(0xFF81C784),
      'icon': Icons.business_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), 
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.black12, height: 1.0),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87, size: 20),
          onPressed: () {
            if (widget.onBack != null) {
              widget.onBack!();
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          "Select Block",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w800,
            fontSize: 22,
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600), 
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CAMPUS EXPLORER",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black38,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Choose a block to explore",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                      letterSpacing: -0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Select one of the structural wings below to inspect available floors, rooms, and localized facility management metrics.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 30),

                  Column(
                    children: blocks.map((block) {
                      final List<Color> cardGradient = block['gradient'] as List<Color>;
                      final Color accent = block['accentColor'] as Color;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: cardGradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: accent.withOpacity(0.06),
                                blurRadius: 24,
                                offset: const Offset(0, 12),
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(24),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FloorSelectionScreen(
                                      blockName: block['title'] as String,
                                      floors: List<String>.from(block['floors'] as List),
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            block['title'] as String,
                                            style: const TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black87,
                                              letterSpacing: -0.5,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            block['subtitle'] as String,
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54,
                                              height: 1.4,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.7),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.arrow_forward_rounded,
                                              size: 18,
                                              color: accent,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Icon(
                                            block['icon'] as IconData,
                                            size: 75,
                                            color: accent.withOpacity(0.45),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}