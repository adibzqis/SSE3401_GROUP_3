import 'package:flutter/material.dart';

class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F8EC),
      appBar: AppBar(
        title: const Text('Block A', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('A101 - Lab 1', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 16),
              
              // Room Picture Placeholder
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(Icons.image_outlined, size: 64, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 24),
              
              // Details Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Type', 'Computer Laboratory'),
                    _buildDetailRow('Floor', '1st Floor'),
                    _buildDetailRow('Block', 'Block A'),
                    _buildDetailRow('Desc', 'Main lab for software engineering courses.'),
                    _buildDetailRow('Fun Fact', 'This was the first lab built on campus!'),
                    const SizedBox(height: 16),
                    const Text('Facilities Available:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    
                    // Facilities Icons Row (from wireframe)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildFacilityIcon(Icons.wifi, 'Wi-Fi'),
                        _buildFacilityIcon(Icons.computer, 'PCs'),
                        _buildFacilityIcon(Icons.ac_unit, 'AC'),
                        _buildFacilityIcon(Icons.projector, 'Projector'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text('$label:', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
          ),
          Expanded(
            child: Text(value, style: TextStyle(fontSize: 16, color: Colors.grey[800])),
          ),
        ],
      ),
    );
  }

  Widget _buildFacilityIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFE8F8EC),
          radius: 24,
          child: Icon(icon, color: const Color(0xFF22C55E)),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}