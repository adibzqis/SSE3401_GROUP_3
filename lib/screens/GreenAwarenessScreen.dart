import 'package:flutter/material.dart';

class GreenAwarenessScreen extends StatelessWidget {
  const GreenAwarenessScreen({super.key});

  static const Color primaryGreen = Color.fromARGB(255, 66, 192, 70);
  static const Color darkGreen = Color.fromARGB(255, 46, 139, 49);
  static const Color lightGreenBg = Color.fromARGB(255, 232, 248, 236);
  static const Color cardShadowColor = Color.fromARGB(15, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreenBg,
      appBar: AppBar(
        title: const Text(
          'EcoHub Campus',
          style: TextStyle(
            color: Colors.black87, 
            fontWeight: FontWeight.w800,
            fontSize: 24, // Made larger for premium readability
            letterSpacing: -0.5,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroBanner(),
            const SizedBox(height: 32),

            _buildSectionHeader('Core Campus Tips', 'Simple steps for daily life'),
            _buildActionListCard(
              icon: Icons.park_rounded,
              accentColor: primaryGreen,
              items: const [
                'Bring a reusable bottle and food container.',
                'Switch off equipment fully instead of leaving it on standby.',
                'Support faculty green events and clean-up days.',
              ],
            ),
            const SizedBox(height: 28),

            _buildSectionHeader('Resource Conservation', 'Track your daily environmental footprint'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildResourceGridCard(
                    title: 'Save Electricity',
                    icon: Icons.bolt_rounded,
                    color: Colors.amber[700]!,
                    items: const [
                      'Lights off when leaving.',
                      'Use natural daylight.',
                      'Unplug unused devices.',
                      'Report faulty switches.',
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildResourceGridCard(
                    title: 'Save Water',
                    icon: Icons.water_drop_rounded,
                    color: Colors.blue[600]!,
                    items: const [
                      'Turn off taps fully.',
                      'Report leaking pipes.',
                      'Use dispensers responsibly.',
                      'Every drop counts.',
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            _buildSectionHeader('Smart Recycling Guide', 'How to separate waste correctly'),
            _buildRecyclingCard(),
            const SizedBox(height: 32),

            _buildSectionHeader('Digital Campus Initiative', 'Our vision for paperless operations'),
            _buildPaperlessFeatureCard(),
            
            const SizedBox(height: 40),
            _buildFooterQuote(),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  /// 1. Premium Hero Banner
  Widget _buildHeroBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryGreen, darkGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(40, 66, 192, 70),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'GO GREEN 2026',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Together We Build\na Sustainable Campus',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24, // Increased font size
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                )
              ],
            ),
            child: const Icon(Icons.spa_rounded, color: primaryGreen, size: 38),
          ),
        ],
      ),
    );
  }

  /// Section Title Builder
  Widget _buildSectionHeader(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20, // Increased size
            fontWeight: FontWeight.w800, 
            color: Colors.black87,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14, // Increased size
            fontWeight: FontWeight.w500, 
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  /// 2. Action List Card
  Widget _buildActionListCard({required IconData icon, required Color accentColor, required List<String> items}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: cardShadowColor, blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Column(
        children: items.map((item) {
          final isLast = items.indexOf(item) == items.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : 18.0), // More breathing room
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 2), // FIX applied here!
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: accentColor.withValues(alpha: 0.12),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 18, color: accentColor),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 15.5, // Increased size & weight for better contrast
                      color: Colors.grey[850],
                      fontWeight: FontWeight.w600,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  /// 3. Twin Resource Grids (Electricity & Water)
  Widget _buildResourceGridCard({
    required String title, 
    required IconData icon, 
    required Color color, 
    required List<String> items
  }) {
    return Container(
      height: 270, // Height slightly adjusted upward to account for larger text spacing
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: cardShadowColor, blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: Colors.black87),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(color: Colors.grey[200], height: 1),
          const SizedBox(height: 14),
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: items.map((item) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• ', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 13.5, // Increased size
                          color: Colors.grey[800], 
                          height: 1.4, 
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// 4. Structured Recycling Card
  Widget _buildRecyclingCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: cardShadowColor, blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Column(
        children: [
          _buildRecycleRow('1', 'Ground Floor Corners', 'Recycling bins are placed systematically on every block\'s ground floor level.'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(color: Color.fromARGB(15, 0, 0, 0), indent: 40), // FIX applied here!
          ),
          _buildRecycleRow('2', 'Waste Separation', 'Categorize properly: Blue for Paper, Brown for Plastic, and Grey for General Waste.'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(color: Color.fromARGB(15, 0, 0, 0), indent: 40), // FIX applied here!
          ),
          _buildRecycleRow('3', 'Rinse & Dry First', 'Ensure containers are clean and completely dry before tossing them in.'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(color: Color.fromARGB(15, 0, 0, 0), indent: 40), // FIX applied here!
          ),
          _buildRecycleRow('4', 'Special E-Waste Bins', 'Batteries, burned bulbs, and old tech cables must be directed to designated electronic waste pods.'),
        ],
      ),
    );
  }

  Widget _buildRecycleRow(String step, String heading, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: primaryGreen.withValues(alpha: 0.15),
          child: Text(step, style: const TextStyle(color: darkGreen, fontWeight: FontWeight.bold, fontSize: 14)),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(heading, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Colors.black87)),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14, // Increased size
                  color: Colors.grey[700], 
                  height: 1.45, 
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 5. Promotional Card for Paperless Concept
  Widget _buildPaperlessFeatureCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [BoxShadow(color: cardShadowColor, blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blueAccent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.phonelink_ring_rounded, color: Colors.blueAccent, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '100% Digital Directories',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Text(
                  'This application aggressively eliminates physical prints, layout plans, and signboards. '
                  'By transitioning maps, labs, and info directories to live digital feeds, FSKTM saves trees, '
                  'cuts printing carbon costs, and maintains a cleanly automated, eco-friendly campus.',
                  style: TextStyle(
                    fontSize: 14.5, // Made larger and more readable
                    color: Colors.grey[800],
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 6. Premium Footer Quote Block
  Widget _buildFooterQuote() {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.spa_outlined, color: Colors.grey[500], size: 18),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  '"Small steps today, big impact tomorrow."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.5, // Increased text scale
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[700],
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.spa_outlined, color: Colors.grey[500], size: 18),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'FSKTM Green Protocol © 2026',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey[500], letterSpacing: 0.5),
          )
        ],
      ),
    );
  }
}