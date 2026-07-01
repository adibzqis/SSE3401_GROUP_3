import 'package:flutter/material.dart';
import 'RoomDetailsScreen.dart';

class FacilitiesListScreen extends StatefulWidget {
  const FacilitiesListScreen({super.key});

  @override
  State<FacilitiesListScreen> createState() => _FacilitiesListScreenState();
}

class _FacilitiesListScreenState extends State<FacilitiesListScreen> with TickerProviderStateMixin {
  late TabController _blockTabController;
  late TabController _floorTabController;

  final Map<String, Map<String, List<Map<String, String>>>> fscitData = {
    'Block A': {
      'Ground Floor': [
        {'name': 'Dewan Abdul Azim (DAA)', 'type': 'Hall / Auditorium', 'desc': 'Main examination and event hall.'},
        {'name': 'Foyer', 'type': 'Public Area', 'desc': 'Central entrance assembly space.'},
        {'name': 'Putra Smart Classroom (PSC)', 'type': 'Classroom', 'desc': 'Smart multimedia learning room.'},
        {'name': 'Chief Administration\'s Office', 'type': 'Office', 'desc': 'Administrative management department.'},
        {'name': 'Assistant Administrative Officer Room', 'type': 'Office', 'desc': 'Administrative staff room.'},
        {'name': 'Administrative Officer Room', 'type': 'Office', 'desc': 'Administrative staff room.'},
      ],
      'First Floor': [
        {'name': 'Male Prayer Room', 'type': 'Prayer Room', 'desc': 'Surau area for men.'},
        {'name': 'Female Prayer Room', 'type': 'Prayer Room', 'desc': 'Surau area for women.'},
        {'name': 'Postgraduate Room', 'type': 'Study Room', 'desc': 'Dedicated space for postgraduate research students.'},
        {'name': 'ComCil Room', 'type': 'Meeting Room', 'desc': 'Committee/Council meeting chambers.'},
        {'name': 'Seminar Room A', 'type': 'Seminar Room', 'desc': 'Lecture presentation venue.'},
        {'name': 'Dean\'s Office', 'type': 'Office', 'desc': 'Head office of the Faculty Dean.'},
        {'name': 'Dean Room', 'type': 'Office', 'desc': 'Private executive room for the Dean.'},
        {'name': 'Deputy Dean (Graduate Studies) Room', 'type': 'Office', 'desc': 'Office room for Graduate Studies executive.'},
        {'name': 'Deputy Dean (Research and Innovation) Room', 'type': 'Office', 'desc': 'Office room for Research executive.'},
        {'name': 'Deputy Dean (Academic, Student Affairs and Alumni) Room', 'type': 'Office', 'desc': 'Office room for Student Affairs executive.'},
        {'name': 'Head of Graduate Studies Unit Room', 'type': 'Office', 'desc': 'Office room for Unit Head.'},
        {'name': 'Administrative Officer Rooms', 'type': 'Office', 'desc': 'Upper level admin desks.'},
        {'name': 'Research and Innovation Unit, Industrial Training and Career Unit', 'type': 'Office / Hub', 'desc': 'Industrial linkage and training center.'},
        {'name': 'Meeting Room A, Academic Unit, Graduate Studies Unit', 'type': 'Meeting Room', 'desc': 'Combined operations and defense room.'},
        {'name': 'Visitors Room', 'type': 'Lounge', 'desc': 'Waiting workspace for visiting delegates.'},
        {'name': 'File Room', 'type': 'Storage', 'desc': 'Secure academic record repository.'},
        {'name': 'File Store', 'type': 'Storage', 'desc': 'General filing room.'},
        {'name': 'Store Room', 'type': 'Storage', 'desc': 'Asset inventory holding storage.'},
        {'name': 'Lounge', 'type': 'Social Area', 'desc': 'Staff relaxation lounge.'},
      ],
      'Second Floor': [
        {'name': 'Lecture Room 1 (BK1)', 'type': 'Lecture Room', 'desc': 'Tiered or standard assembly instructional room.'},
        {'name': 'Lecture Room 2 (BK2)', 'type': 'Lecture Room', 'desc': 'Tiered or standard assembly instructional room.'},
        {'name': 'Lecture Room 3 (BK3)', 'type': 'Lecture Room', 'desc': 'Tiered or standard assembly instructional room.'},
        {'name': 'Software Engineering Unit Room', 'type': 'Special Room', 'desc': 'Research laboratory space.'},
        {'name': 'Intelligent Computing Unit Room', 'type': 'Special Room', 'desc': 'Research laboratory space.'},
        {'name': 'Database Technologies and Application Unit Room', 'type': 'Special Room', 'desc': 'Research laboratory space.'},
        {'name': 'Applied Informatics Laboratory', 'type': 'Special Room', 'desc': 'Research laboratory space.'},
        {'name': 'Human Computer Interaction Room', 'type': 'Special Room', 'desc': 'Research laboratory space.'},
        {'name': 'Computer Graphics, Vision and Visualisation Room', 'type': 'Special Room', 'desc': 'Research laboratory space.'},
        {'name': 'Digital Information Computation and Retrieval Room', 'type': 'Special Room', 'desc': 'Research laboratory space.'},
        {'name': 'Wireless, Mobile and Quantum Computing Room', 'type': 'Special Room', 'desc': 'Research laboratory space.'},
        {'name': 'Network, Parallel and Distributed Computing Room', 'type': 'Special Room', 'desc': 'Research laboratory space.'},
      ]
    },
    'Block B': {
      'Ground Floor': [
        {'name': 'Network Laboratory 1', 'type': 'Laboratory', 'desc': 'Main networking operations workspace.'},
        {'name': 'Network Laboratory 2 (FYP)', 'type': 'Laboratory', 'desc': 'Dedicated final year project network lab.'},
        {'name': 'High Performance Computing (HPC) Laboratory', 'type': 'Laboratory', 'desc': 'Advanced processing unit computing cluster.'},
        {'name': 'Software Engineering Laboratory 1', 'type': 'Laboratory', 'desc': 'Primary programming lab instruction environment.'},
        {'name': 'Forensic Laboratory', 'type': 'Laboratory', 'desc': 'Cybersecurity investigation simulation lab.'},
        {'name': 'Embedded and Robotic Laboratory', 'type': 'Laboratory', 'desc': 'Hardware-software microprocessing and robotics workspace.'},
        {'name': 'Postgraduate Laboratory 1', 'type': 'Laboratory', 'desc': 'Research workstation lab for master/PhD students.'},
        {'name': 'Postgraduate Laboratory 2', 'type': 'Laboratory', 'desc': 'Secondary research workstation computer laboratory.'},
        {'name': 'Master Laboratory (Coursework)', 'type': 'Laboratory', 'desc': 'Assigned computer lab for taught master modules.'},
        {'name': 'Chief ICT Section\'s Room', 'type': 'Office', 'desc': 'IT operational head quarters.'},
        {'name': 'ICT Section', 'type': 'Office', 'desc': 'General administrative IT systems department desks.'},
        {'name': 'Server Room', 'type': 'Storage', 'desc': 'Central high-security framework node center.'},
        {'name': 'Kafeteria', 'type': 'Dining', 'desc': 'Faculty dining area located at Block B transition.'},
        {'name': 'Power Room / Pump Room / PABX Room', 'type': 'Utility', 'desc': 'Essential facility utility plant.'},
        {'name': 'Store', 'type': 'Storage', 'desc': 'Equipment store.'},
      ],
      'First Floor': [
        {'name': 'Software System Laboratory', 'type': 'Laboratory', 'desc': 'System design validation computer lab.'},
        {'name': 'Perdana Laboratory', 'type': 'Laboratory', 'desc': 'Specialized workstation room.'},
        {'name': 'Database Laboratory', 'type': 'Laboratory', 'desc': 'SQL modeling and big data structuring engine.'},
        {'name': 'Software Engineering Laboratory', 'type': 'Laboratory', 'desc': 'Secondary systems engineering lab block.'},
        {'name': 'Information Security Room', 'type': 'Office', 'desc': 'Data protection operations division.'},
        {'name': 'FCSIT Quality Assurance Room', 'type': 'Office', 'desc': 'Academic control and certification registry room.'},
        {'name': 'Power Room', 'type': 'Utility', 'desc': 'Power grid distributions closet.'},
      ],
      'Second Floor': [
        {'name': 'Al-Khawarizmi Laboratory', 'type': 'Laboratory', 'desc': 'Core computational systems environment.'},
        {'name': 'Multimedia Laboratory 1', 'type': 'Laboratory', 'desc': 'Graphic processing, UI/UX prototyping lab.'},
        {'name': 'Multimedia Laboratory 2', 'type': 'Laboratory', 'desc': 'A/V production assets and rendering workspace.'},
        {'name': 'Operation System Laboratory (OS)', 'type': 'Laboratory', 'desc': 'Linux kernel hacking and environment testing suite.'},
        {'name': 'Multimedia Studio', 'type': 'Multimedia Studio', 'desc': 'Isolated acoustics capture studio and design room.'},
        {'name': 'Power Room', 'type': 'Utility', 'desc': 'Electrical switchboard room.'},
      ]
    }
  };

  @override
  void initState() {
    super.initState();
    _blockTabController = TabController(length: 2, vsync: this);
    _floorTabController = TabController(length: 3, vsync: this);

    _blockTabController.addListener(() => setState(() {}));
    _floorTabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _blockTabController.dispose();
    _floorTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String selectedBlock = _blockTabController.index == 0 ? 'Block A' : 'Block B';
    String selectedFloor = 'Ground Floor';
    if (_floorTabController.index == 1) selectedFloor = 'First Floor';
    if (_floorTabController.index == 2) selectedFloor = 'Second Floor';

    List<Map<String, String>> currentFacilities = fscitData[selectedBlock]?[selectedFloor] ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFFE8F8EC),
      appBar: AppBar(
        title: const Text(
          'FCSIT Facilities',
          style: TextStyle(color: Color(0xFF1E293B), fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1E293B)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(110.0),
          child: Column(
            children: [
              // Segmented Block Selector Control Block
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: TabBar(
                  controller: _blockTabController,
                  indicator: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color(0xFF64748B),
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [
                    Tab(text: 'BLOCK A'),
                    Tab(text: 'BLOCK B'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              // Floor Navigation Pills Tab Bar Layout
              TabBar(
                controller: _floorTabController,
                isScrollable: false,
                indicatorColor: const Color(0xFF22C55E),
                indicatorWeight: 3,
                labelColor: const Color(0xFF22C55E),
                unselectedLabelColor: const Color(0xFF64748B),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                tabs: const [
                  Tab(text: 'Ground'),
                  Tab(text: '1st Floor'),
                  Tab(text: '2nd Floor'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: currentFacilities.isEmpty
            ? const Center(
                child: Text(
                  'No facilities recorded under this wing section.',
                  style: TextStyle(color: Color(0xFF64748B), fontSize: 15),
                ),
              )
            : ListView.builder(
                key: ValueKey('$selectedBlock-$selectedFloor'),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                itemCount: currentFacilities.length,
                itemBuilder: (context, index) {
                  final facility = currentFacilities[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 14,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomDetailsScreen(
                                roomName: facility['name']!,
                                blockName: selectedBlock,
                                floorName: selectedFloor,
                                roomType: facility['type']!,
                                roomDesc: facility['desc']!,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8F8EC),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  _getIconForType(facility['type']!),
                                  color: const Color(0xFF22C55E),
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      facility['name']!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0F172A),
                                        height: 1.2,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      facility['desc']!,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF64748B),
                                        height: 1.4,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF94A3B8), size: 16),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  IconData _getIconForType(String type) {
    switch (type) {
      case 'Laboratory':
        return Icons.computer_rounded;
      case 'Office':
      case 'Office / Hub':
        return Icons.corporate_fare_rounded;
      case 'Prayer Room':
        return Icons.dark_mode_rounded;
      case 'Hall / Auditorium':
        return Icons.theater_comedy_rounded;
      case 'Meeting Room':
      case 'Seminar Room':
        return Icons.forum_rounded;
      case 'Storage':
        return Icons.inventory_2_rounded;
      case 'Utility':
        return Icons.electrical_services_rounded;
      case 'Dining':
        return Icons.restaurant_rounded;
      default:
        return Icons.room_preferences_rounded;
    }
  }
}