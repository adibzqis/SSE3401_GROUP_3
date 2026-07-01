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
    },
    'Block C': {
      'Ground Floor': [
        {'name': 'Lobi Utama / Central Foyer', 'type': 'Public Area', 'desc': 'Main central drop-off reception lobby area.'},
        {'name': 'Seksyen Pentadbiran & Penyelenggaraan (C0-10 to C0-13)', 'type': 'Office', 'desc': 'Administration and Facility Maintenance Section office.'},
        {'name': 'Bilik Profesor 1 (C0-14 & C0-15)', 'type': 'Office', 'desc': 'Dedicated senior academic workspace wing.'},
        {'name': 'Bilik Profesor 2 (C0-16 & C0-17)', 'type': 'Office', 'desc': 'Professor consultations and project operations room.'},
        {'name': 'Bilik Profesor 3 (C0-18 & C0-19)', 'type': 'Office', 'desc': 'Faculty professor guidance and administrative desk.'},
        {'name': 'Pelantar Outpost', 'type': 'Public Area', 'desc': 'Rear exterior connection platform structure.'},
        {'name': 'Surau Lelaki (Block C Wing)', 'type': 'Prayer Room', 'desc': 'Male designated Islamic prayer sanctuary.'},
        {'name': 'Surau Wanita (Block C Wing)', 'type': 'Prayer Room', 'desc': 'Female designated Islamic prayer sanctuary.'},
        {'name': 'Bilik Elektrik LV', 'type': 'Utility', 'desc': 'Low Voltage power board distribution grid room.'},
      ],
      'First Floor': [
        {'name': 'Bilik Seminar Utama', 'type': 'Seminar Room', 'desc': 'Large centralized faculty presentation and seminar venue.'},
        {'name': 'Ruang Legar / Gathering Lounge', 'type': 'Public Area', 'desc': 'Spacious academic discussion corridor.'},
        {'name': 'C1-01 to C1-03: Senior Faculty Rooms', 'type': 'Office', 'desc': 'Academic staff offices including Prof. Mohd, Dr. Amir, Ahmad Alauddin.'},
        {'name': 'C1-04 to C1-06: Faculty Offices', 'type': 'Office', 'desc': 'Lecturer research cabins including Dr. Norasila, Dr. Hazlina, Dr. Alif.'},
        {'name': 'C1-07 to C1-09: Consultation Offices', 'type': 'Office', 'desc': 'Academic rooms including Dr. Zuriati, Dr. Lilly, Dr. Nur Izura.'},
        {'name': 'C1-11 to C1-13: Academic Desks', 'type': 'Office', 'desc': 'Lecturer offices including Dr. Hamidah, Dr. Ten, Dr. Noraziah.'},
        {'name': 'C1-14 to C1-16: Staff Offices', 'type': 'Office', 'desc': 'Faculty consultation rooms including Dr. Maslina, Dr. Wan Nurhayati.'},
        {'name': 'C1-17 to C1-19: Research Rooms', 'type': 'Office', 'desc': 'Lecturer chambers including Dr. Siti Khatijah, Dr. Hazlina.'},
        {'name': 'C1-20 to C1-22: Study Units', 'type': 'Office', 'desc': 'Academic desks including Dr. Hafeez, PM Dr. Taufik.'},
        {'name': 'C1-23 to C1-25: Faculty Offices', 'type': 'Office', 'desc': 'Lecturer chambers including Dr. Raihani, Prof. Abu Bakar.'},
        {'name': 'C1-26 to C1-28: Senior Lecturer Desks', 'type': 'Office', 'desc': 'Academic cabins including Dr. Azizol, Dr. Salfarina, Dr. Abdullah.'},
        {'name': 'C1-29 to C1-32: Department Staff Offices', 'type': 'Office', 'desc': 'Lecturer workspaces including Dr. Syaiful, Dr. Luqman, Dr. Khaironi.'},
        {'name': 'C1-49 to C1-53: Upper Academic Row', 'type': 'Office', 'desc': 'Faculty wing including Dr. M. Daniel, Dr. Aziah, Dr. Nur Alifa, Dr. Marziah.'},
      ],
      'Second Floor': [
        {'name': 'Bilik Mesyuarat Utama (C2-19 & C2-20)', 'type': 'Meeting Room', 'desc': 'Main corporate operations board room.'},
        {'name': 'Pejabat Am K.J. (General Office)', 'type': 'Office', 'desc': 'Head of Department general administration hub.'},
        {'name': 'Bilik Cetak (Printing Room)', 'type': 'Utility', 'desc': 'Central high-volume academic duplication unit.'},
        {'name': 'Bilik Dokumen & Bilik Fail (C2-34 to C2-36)', 'type': 'Storage', 'desc': 'Secure faculty archives and student record system vault.'},
        {'name': 'C2-01 to C2-04: Academic Offices', 'type': 'Office', 'desc': 'Lecturer suites including Mohd Nor, Dr. Rohaya, Dr. Fatimah, Dr. N. Farida.'},
        {'name': 'C2-05 to C2-09: Department Cabins', 'type': 'Office', 'desc': 'Faculty rooms including Dr. Azlina, Dr. Manzanah, Dr. Fatimah, Dr. Nur Fadilina.'},
        {'name': 'C2-11 to C2-16: Research Consultation Desks', 'type': 'Office', 'desc': 'Lecturer suites including Dr. Masrina, Dr. Siti Nurul Ain, Dr. Sufri.'},
        {'name': 'C2-44 to C2-48: Specialized Academic Suites', 'type': 'Office', 'desc': 'Faculty wing including Dr. N. Amelina, Dr. Noris, Dr. N. Azura.'},
      ],
      'Third Floor': [
        {'name': 'C3-01 to C3-05: Department Workspaces', 'type': 'Office', 'desc': 'Lecturer suites including Ahmad Alauddin, Dato Prof. Dr. Shamala, Dr. Amir.'},
        {'name': 'C3-06 to C3-09: Senior Staff Offices', 'type': 'Office', 'desc': 'Academic offices including Dr. Azreen Azman, Dr. Azree, Dr. Puteri, Dr. Yunus.'},
        {'name': 'C3-11 to C3-16: Academic Wings', 'type': 'Office', 'desc': 'Lecturer suites including Dr. Hizmawati, Dr. Khairul Azhar, Dr. Ng Keng Yap.'},
        {'name': 'C3-17 to C3-21: Research Workspaces', 'type': 'Office', 'desc': 'Faculty suites including Dr. Shymala, Dr. Novia, Dr. Pathiah, Dr. Sharifah.'},
        {'name': 'C3-22 to C3-25: Consult Cabin Row', 'type': 'Office', 'desc': 'Lecturer offices including Dr. Salmi Baharom, Dr. Saadah, Dr. Yusmadi.'},
        {'name': 'C3-26 to C3-31: Left Wing Row Desks', 'type': 'Office', 'desc': 'Academic staff rooms including Anita Ban, Dilrozi, Dr. Nor Hayati.'},
        {'name': 'C3-10 & C3-32: Corner Academic Units', 'type': 'Office', 'desc': 'Private executive researcher suites.'},
      ]
    }
  };

  @override
  void initState() {
    super.initState();
    _blockTabController = TabController(length: 3, vsync: this); // Extended length to 3 for Block C
    _floorTabController = TabController(length: 4, vsync: this); // Extended length to 4 for Third Floor

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
    String selectedBlock = 'Block A';
    if (_blockTabController.index == 1) selectedBlock = 'Block B';
    if (_blockTabController.index == 2) selectedBlock = 'Block C';

    String selectedFloor = 'Ground Floor';
    if (_floorTabController.index == 1) selectedFloor = 'First Floor';
    if (_floorTabController.index == 2) selectedFloor = 'Second Floor';
    if (_floorTabController.index == 3) selectedFloor = 'Third Floor';

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
                    Tab(text: 'BLOCK C'),
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
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                tabs: const [
                  Tab(text: 'Ground'),
                  Tab(text: '1st Floor'),
                  Tab(text: '2nd Floor'),
                  Tab(text: '3rd Floor'),
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
                                        fontSize: 15,
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
      case 'Public Area':
        return Icons.roofing_rounded;
      default:
        return Icons.room_preferences_rounded;
    }
  }
}