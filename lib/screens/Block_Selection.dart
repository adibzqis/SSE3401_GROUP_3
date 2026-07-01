import 'package:flutter/material.dart';
import 'package:section_8_plus/screens/FacilitiesListScreen.dart';

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
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "Select Block",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Choose a block to explore",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 20),
              _buildThemedBlockCard("Block A"),
              _buildThemedBlockCard("Block B"),
              _buildThemedBlockCard("Block C"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemedBlockCard(String blockName) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FacilitiesListScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 232, 248, 236), // Light green tint
          borderRadius: BorderRadius.circular(15),
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
            Positioned(
              left: 20,
              top: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blockName,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "View Rooms, Floors, and \nFacilities",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 20,
              right: 20,
              child: Icon(Icons.next_plan, size: 28, color: Colors.black54),
            ),
            const Positioned(
              bottom: -10,
              right: 30,
              child: Icon(
                Icons.business_rounded,
                size: 90,
                color: Color.fromARGB(
                  50,
                  66,
                  192,
                  70,
                ), // Faded green background icon
              ),
            ),
          ],
        ),
      ),
    );
  }
}
