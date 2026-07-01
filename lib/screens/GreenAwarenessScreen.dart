import 'package:flutter/material.dart';

class GreenAwarenessScreen extends StatelessWidget {
  const GreenAwarenessScreen({super.key});

  static const Color primaryGreen = Color.fromARGB(255, 66, 192, 70);
  static const Color lightGreenBg = Color.fromARGB(255, 232, 248, 236);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreenBg,
      appBar: AppBar(
        title: const Text(
          'Green Awareness',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIntroBanner(),
            const SizedBox(height: 24),

            _buildSectionTitle('Green Campus Tips'),
            _buildInfoCard(
              icon: Icons.park_outlined,
              items: const [
                'Bring a reusable bottle and food container.',
                'Switch off equipment fully instead of leaving it on standby.',
                'Support faculty green events and clean-up days.',
              ],
            ),

            _buildSectionTitle('Recycling Information'),
            _buildInfoCard(
              icon: Icons.recycling,
              items: const [
                'Recycling corners are available on each block\'s ground floor.',
                'Separate waste into paper, plastic, and general bins.',
                'Rinse containers before placing them in the recycling bin.',
                'E-waste (batteries, cables) should go to the designated e-waste bin.',
              ],
            ),

            _buildSectionTitle('Save Electricity Reminders'),
            _buildInfoCard(
              icon: Icons.bolt_outlined,
              items: const [
                'Turn off lights and air-conditioning when leaving a room.',
                'Use natural daylight near windows when possible.',
                'Unplug chargers and devices that are not in use.',
                'Report faulty switches or lights that stay on unnecessarily.',
              ],
            ),

            _buildSectionTitle('Save Water Reminders'),
            _buildInfoCard(
              icon: Icons.water_drop_outlined,
              items: const [
                'Turn off taps fully after washing hands.',
                'Report any leaking pipes or dripping taps immediately.',
                'Use water dispensers responsibly, avoid overfilling.',
                'Every drop counts, use only what you need.',
              ],
            ),

            _buildSectionTitle('Paperless Navigation Concept'),
            _buildParagraphCard(
              icon: Icons.smartphone_outlined,
              text:
                  'This app replaces printed floor directories, signboards, and '
                  'facility notices with a digital navigation system. By checking '
                  'room, lab, and facility information directly in the app instead '
                  'of printed material, students and staff help reduce paper usage '
                  'across FSKTM, supporting a cleaner and more sustainable campus.',
            ),

            const SizedBox(height: 16),
            _buildFooterQuote(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: const Text(
              'Together We Build\na Sustainable Campus',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.eco, color: Colors.white, size: 40),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// Card showing an icon header + a bulleted list of tips.
  Widget _buildInfoCard({required IconData icon, required List<String> items}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: lightGreenBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: primaryGreen, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.circle, size: 6, color: primaryGreen),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: Colors.grey[800],
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Card showing an icon header + a single explanatory paragraph
  /// (used for the Paperless Navigation Concept section).
  Widget _buildParagraphCard({required IconData icon, required String text}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: lightGreenBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: primaryGreen, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13.5,
                color: Colors.grey[800],
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterQuote() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: primaryGreen.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryGreen.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              '"Small steps today, big impact tomorrow."',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.eco, color: primaryGreen, size: 18),
        ],
      ),
    );
  }
}
