import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  // Premium, technical metadata field rows
  Widget _buildMetaRow({
    required IconData icon,
    required String label,
    required String value,
    required Color themeColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: themeColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: themeColor),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                    color: Colors.black45,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Uniform, premium component layer for individual teammates
  Widget _buildTeammateItem(String name, String matric) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              matric,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontFamily: 'Courier',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const themeColor = Color.fromARGB(255, 66, 192, 70);

    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9),
      appBar: AppBar(
        title: const Text(
          'About App',
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        scrolledUnderElevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.black.withOpacity(0.04), height: 1),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600), // Ensures high-end display bounds
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Application Hero Block
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.black.withOpacity(0.02)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.015),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'FSKTM Navigator',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1A1A1A),
                              letterSpacing: 0.2,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: themeColor.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Group 3',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: themeColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        child: Divider(color: Color(0xFFF3F4F6), height: 1),
                      ),
                      Text(
                        'FSKTM Navigator helps students and visitors seamlessly locate blocks, specific floors, and interactive campus facilities at FSKTM UPM.',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Colors.grey[600],
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Core Infrastructure and Metadata Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.black.withOpacity(0.02)),
                  ),
                  child: Column(
                    children: [
                      _buildMetaRow(icon: Icons.info_outline_rounded, label: 'Version', value: '1.0.0', themeColor: themeColor),
                      const Divider(color: Color(0xFFF3F4F6), height: 1, indent: 46),
                      _buildMetaRow(icon: Icons.mail_outline_rounded, label: 'Support Contact', value: 'support@fsktm-navigator.app', themeColor: themeColor),
                      const Divider(color: Color(0xFFF3F4F6), height: 1, indent: 46),
                      _buildMetaRow(icon: Icons.school_outlined, label: 'Supervising Lecturer', value: 'TS. DR. MUHAMAD SUFRI BIN MUHAMMAD', themeColor: themeColor),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Premium Group Development Team Breakdown
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4FAF4),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: themeColor.withOpacity(0.15), width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.terminal_rounded, color: themeColor, size: 18),
                          const SizedBox(width: 8),
                          const Text(
                            'DEVELOPMENT TEAM',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      _buildTeammateItem('Adib Zaquan Iskandar bin Norzilam', '225300'),
                      const Divider(color: Colors.black12, height: 12),
                      _buildTeammateItem('Muhammad Nasrul Amin bin Mohd Napi', '225651'),
                      const Divider(color: Colors.black12, height: 12),
                      _buildTeammateItem('Muhammad Danial Haziq bin Ab Manah', '225031'),
                      const Divider(color: Colors.black12, height: 12),
                      _buildTeammateItem('Wan Ashman B. Mohd Ikhsan', '224648'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}