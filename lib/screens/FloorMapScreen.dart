import 'package:flutter/material.dart';
import 'FacilitiesListScreen.dart';

class FloorMapScreen extends StatelessWidget {
  final String blockName;
  final String floorName;

  const FloorMapScreen({
    super.key,
    required this.blockName,
    required this.floorName,
  });

  String get _floorMapAsset {
    final key = '${blockName.toLowerCase().replaceAll(' ', '_')}_${floorName.toLowerCase().replaceAll(' ', '_')}';

    switch (key) {
      case 'block_a_ground_floor':
        return 'Assets/Gfloor-BlockA.png';
      case 'block_a_level_1':
        return 'Assets/1floor-BlockA.png';
      case 'block_a_level_2':
        return 'Assets/2floor-BlockA.png';
      case 'block_b_ground_floor':
        return 'Assets/Gfloor-BlockB.png';
      case 'block_b_level_1':
        return 'Assets/1floor-BlockB.png';
      case 'block_b_level_2':
        return 'Assets/2floor-BlockB.png';
      case 'block_c_level_1':
        return 'Assets/FSTKM.png';
      case 'block_c_level_2':
        return 'Assets/FSTKM.jpg';
      default:
        return 'Assets/FSTKM.jpg';
    }
  }

  String get _guidanceAsset {
    final key = '${blockName.toLowerCase().replaceAll(' ', '_')}_${floorName.toLowerCase().replaceAll(' ', '_')}';

    switch (key) {
      case 'block_a_ground_floor':
        return 'Assets/Gfloor-BlockAGuide.png';
      case 'block_a_level_1':
        return 'Assets/1floor-BlockAGuide.png';
      case 'block_a_level_2':
        return 'Assets/2floor-BlockAGuide.png';
      case 'block_b_ground_floor':
        return 'Assets/Gfloor-BlockAGuide.png';
      case 'block_b_level_1':
        return 'Assets/1floor-BlockAGuide.png';
      case 'block_b_level_2':
        return 'Assets/2floor-BlockAGuide.png';
      case 'block_c_level_1':
        return 'Assets/FSTKM.png';
      case 'block_c_level_2':
        return 'Assets/FSTKM.jpg';
      default:
        return 'Assets/FSTKM.jpg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 248, 236),
      appBar: AppBar(
        title: Text(
          '$blockName - $floorName',
          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Floor Map',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Image.asset(
                      _floorMapAsset,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                width: double.infinity,
                height: 160,
                color: Colors.white,
                child: Image.asset(
                  _guidanceAsset,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FacilitiesListScreen(),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: const [
                    Icon(Icons.location_on, color: Color.fromARGB(255, 66, 192, 70), size: 28),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Tap here to view facilities for this floor',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
