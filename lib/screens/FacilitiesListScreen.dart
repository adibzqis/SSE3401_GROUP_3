import 'package:flutter/material.dart';
import '../widgets/RoomDetailsScreen.dart';

class FacilitiesListScreen extends StatefulWidget {
  const FacilitiesListScreen({super.key});

  @override
  State<FacilitiesListScreen> createState() => _FacilitiesListScreenState();
}

class _FacilitiesListScreenState extends State<FacilitiesListScreen> with TickerProviderStateMixin {
  late TabController _blockTabController;
  late TabController _floorTabController;

  // Fully compiled mapping of all facilities using official staff names and pristine English descriptions
  final Map<String, Map<String, List<Map<String, String>>>> fscitData = {
    'Block A': {
      'Ground Floor': [
        {'room': 'DAA', 'name': 'Dewan Abdul Azim (DAA)', 'type': 'Hall / Auditorium', 'desc': 'Main examination hall and large faculty event assembly venue.'},
        {'room': 'Foyer', 'name': 'Block A Main Foyer', 'type': 'Public Area', 'desc': 'Central reception assembly space at the main entrance of Block A.'},
        {'room': 'PSC', 'name': 'Putra Smart Classroom (PSC)', 'type': 'Classroom', 'desc': 'High-tech interactive multimedia smart classroom environment.'},
        {'room': 'Admin 1', 'name': 'Chief Administration\'s Office', 'type': 'Office', 'desc': 'Primary administrative operations and management center for the faculty.'},
        {'room': 'Admin 2', 'name': 'Assistant Administrative Officer Room', 'type': 'Office', 'desc': 'Desk office housing the assistant administrative officer.'},
        {'room': 'Admin 3', 'name': 'Administrative Officer Room', 'type': 'Office', 'desc': 'Desk office housing the faculty administrative officer.'},
      ],
      'First Floor': [
        {'room': 'Surau M', 'name': 'Male Prayer Room (Surau)', 'type': 'Prayer Room', 'desc': 'Dedicated Islamic prayer sanctuary provided for male staff and students.'},
        {'room': 'Surau F', 'name': 'Female Prayer Room (Surau)', 'type': 'Prayer Room', 'desc': 'Dedicated Islamic prayer sanctuary provided for female staff and students.'},
        {'room': 'Postgrad', 'name': 'Postgraduate Study Room', 'type': 'Study Room', 'desc': 'Shared workspace and research computing lab for postgraduate students.'},
        {'room': 'ComCil', 'name': 'ComCil (Student Council) Room', 'type': 'Meeting Room', 'desc': 'Operational board room for the student representative council.'},
        {'room': 'Seminar A', 'name': 'Seminar Room A', 'type': 'Seminar Room', 'desc': 'Academic presentation venue and secondary lecture seminar hall.'},
        {'room': 'Pej. Dekan', 'name': 'Dean\'s General Office Counter', 'type': 'Office', 'desc': 'Main public reception counter handling general administration for the Dean\'s office.'},
        {'room': 'Bilik Dekan', 'name': 'Dean\'s Executive Room', 'type': 'Office', 'desc': 'Private executive office chamber belonging to the Faculty Dean.'},
        {'room': 'T. Dekan 1', 'name': 'Deputy Dean (Graduate Studies) Room', 'type': 'Office', 'desc': 'Private office for the Deputy Dean of the Graduate Studies unit.'},
        {'room': 'T. Dekan 2', 'name': 'Deputy Dean (Research & Innovation) Room', 'type': 'Office', 'desc': 'Private office for the Deputy Dean of the Research & Innovation unit.'},
        {'room': 'T. Dekan 3', 'name': 'Deputy Dean (Academic & Student Affairs) Room', 'type': 'Office', 'desc': 'Private office for the Deputy Dean of Student Affairs and Alumni.'},
        {'room': 'Ketua Unit', 'name': 'Head of Graduate Studies Unit Room', 'type': 'Office', 'desc': 'Administrative desk office for the Head of the Graduate Studies Unit.'},
        {'room': 'Unit R&I', 'name': 'Research, Innovation & Industrial Training Unit', 'type': 'Office / Hub', 'desc': 'Operational hub handling corporate industrial linkages, internships, and career placements.'},
        {'room': 'Mesy. A', 'name': 'Meeting Room A (Academic Unit)', 'type': 'Meeting Room', 'desc': 'Official consultation room for academic board members and graduate reviews.'},
        {'room': 'Pelawat', 'name': 'Visitors Room / Guest Lounge', 'type': 'Lounge', 'desc': 'Dedicated workspace and waiting lounge for visiting external delegates.'},
        {'room': 'Bilik Fail', 'name': 'Faculty Secure Records Room', 'type': 'Storage', 'desc': 'Secure archiving center for strict faculty administrative documents.'},
        {'room': 'Stor Fail', 'name': 'General Document Storage', 'type': 'Storage', 'desc': 'Secondary asset store room for filing administrative paperwork.'},
        {'room': 'Stor Aset', 'name': 'Faculty Asset Store Room', 'type': 'Storage', 'desc': 'Inventory holding room for general faculty equipment and physical items.'},
        {'room': 'Lounge', 'name': 'Staff Lounge', 'type': 'Social Area', 'desc': 'Relaxation and interaction lounge reserved strictly for faculty staff and lecturers.'},
      ],
      'Second Floor': [
        {'room': 'BK1', 'name': 'Lecture Room 1 (Bilik Kuliah 1)', 'type': 'Lecture Room', 'desc': 'Tiered assembly classroom environment for undergraduate lectures.'},
        {'room': 'BK2', 'name': 'Lecture Room 2 (Bilik Kuliah 2)', 'type': 'Lecture Room', 'desc': 'Tiered assembly classroom environment for undergraduate lectures.'},
        {'room': 'BK3', 'name': 'Lecture Room 3 (Bilik Kuliah 3)', 'type': 'Lecture Room', 'desc': 'Tiered assembly classroom environment for undergraduate lectures.'},
        {'room': 'SE Unit', 'name': 'Software Engineering Research Unit', 'type': 'Special Room', 'desc': 'Specialized group research workspace for software systems engineering.'},
        {'room': 'IC Unit', 'name': 'Intelligent Computing Research Unit', 'type': 'Special Room', 'desc': 'Advanced computational analytics lab for artificial intelligence and smart designs.'},
        {'room': 'DB Unit', 'name': 'Database Technologies & Application Unit', 'type': 'Special Room', 'desc': 'Research laboratory space dealing with data systems architecture designs.'},
        {'room': 'App Info', 'name': 'Applied Informatics Laboratory', 'type': 'Special Room', 'desc': 'Research workspace focused on applied computing implementations.'},
        {'room': 'HCI Room', 'name': 'Human-Computer Interaction (HCI) Lab', 'type': 'Special Room', 'desc': 'Prototyping and testing suite for user interface and user experience engineering.'},
        {'room': 'CG Vision', 'name': 'Computer Graphics, Vision & Visualisation Lab', 'type': 'Special Room', 'desc': 'Research lab space dedicated to visual computing models and computer vision.'},
        {'room': 'DICR Room', 'name': 'Digital Information Computation & Retrieval Room', 'type': 'Special Room', 'desc': 'Research workspace focused on web search engines and digital data processing.'},
        {'room': 'WMQC Room', 'name': 'Wireless, Mobile & Quantum Computing Room', 'type': 'Special Room', 'desc': 'Advanced research zone exploring mobile frameworks and quantum cryptography.'},
        {'room': 'NPDC Room', 'name': 'Network, Parallel & Distributed Computing Room', 'type': 'Special Room', 'desc': 'Systems lab handling high-availability clustering and advanced routing networks.'},
      ]
    },
    'Block B': {
      'Ground Floor': [
        {'room': 'Net Lab 1', 'name': 'Network Laboratory 1', 'type': 'Laboratory', 'desc': 'Primary institutional computer lab for networking and telecommunication practicals.'},
        {'room': 'Net Lab 2', 'name': 'Network Laboratory 2 (FYP)', 'type': 'Laboratory', 'desc': 'Dedicated workspace computer lab assigned for Final Year Project students.'},
        {'room': 'HPC Lab', 'name': 'High Performance Computing (HPC) Lab', 'type': 'Laboratory', 'desc': 'Supercomputing node cluster room handling parallel processing analytics.'},
        {'room': 'SE Lab 1', 'name': 'Software Engineering Laboratory 1', 'type': 'Laboratory', 'desc': 'Primary educational computer laboratory for core programming courses.'},
        {'room': 'Forensic', 'name': 'Forensic Laboratory', 'type': 'Laboratory', 'desc': 'Cybersecurity simulation lab for tracking digital signatures and structural footprints.'},
        {'room': 'Robotic', 'name': 'Embedded and Robotic Laboratory', 'type': 'Laboratory', 'desc': 'Hardware integration workshop handling microprocessing units and robotics.'},
        {'room': 'PG Lab 1', 'name': 'Postgraduate Laboratory 1', 'type': 'Laboratory', 'desc': 'Dedicated computer laboratory for research masters and PhD student workstations.'},
        {'room': 'PG Lab 2', 'name': 'Postgraduate Laboratory 2', 'type': 'Laboratory', 'desc': 'Secondary computer laboratory for research postgraduate research tasks.'},
        {'room': 'Master Lab', 'name': 'Master Laboratory (Coursework Focus)', 'type': 'Laboratory', 'desc': 'Allocated workstation lab assigned for taught master postgraduate programs.'},
        {'room': 'Chief ICT', 'name': 'Chief ICT Section\'s Room', 'type': 'Office', 'desc': 'Private operational office space for the head of faculty IT infrastructure.'},
        {'room': 'Seksyen IT', 'name': 'ICT Section Administration Office', 'type': 'Office', 'desc': 'Central workspace housing general IT technical systems support agents.'},
        {'room': 'Server', 'name': 'Central Faculty Server Room', 'type': 'Storage', 'desc': 'Strict access high-security framework node data hub.'},
        {'room': 'Kafeteria', 'name': 'Faculty Cafeteria (Café)', 'type': 'Dining', 'desc': 'Open student food court located near the transition corridor to Block B.'},
        {'room': 'Utiliti B', 'name': 'Pump Room, PABX & Generator Room', 'type': 'Utility', 'desc': 'Essential mechanical and infrastructure facility plant.'},
        {'room': 'Stor B', 'name': 'Logistics Equipment Store Room', 'type': 'Storage', 'desc': 'General operational storage locker for infrastructure replacement hardware.'},
      ],
      'First Floor': [
        {'room': 'Sys Lab', 'name': 'Software System Laboratory', 'type': 'Laboratory', 'desc': 'Instructional system modeling environment and code testing lab.'},
        {'room': 'Perdana Lab', 'name': 'Perdana Laboratory', 'type': 'Laboratory', 'desc': 'Specialized high-performance computer workspace for custom projects.'},
        {'room': 'DB Lab', 'name': 'Database Laboratory', 'type': 'Laboratory', 'desc': 'Computer laboratory for active structural relational database practicals.'},
        {'room': 'SE Lab 2', 'name': 'Software Engineering Laboratory 2', 'type': 'Laboratory', 'desc': 'Secondary computer lab for advanced system framework implementation modules.'},
        {'room': 'Info Sec', 'name': 'Information Security Office Room', 'type': 'Office', 'desc': 'Administrative office managing faculty-wide data defense and secure policies.'},
        {'room': 'QA Office', 'name': 'FCSIT Quality Assurance Office Room', 'type': 'Office', 'desc': 'Quality control operations office monitoring course audits and certifications.'},
        {'room': 'Kuasa B1', 'name': 'Power Distribution Closet', 'type': 'Utility', 'desc': 'Electrical breaker board and distribution routing node panel.'},
      ],
      'Second Floor': [
        {'room': 'Khawarizmi', 'name': 'Al-Khawarizmi Laboratory', 'type': 'Laboratory', 'desc': 'Core computational computing lab for algorithmic learning structures.'},
        {'room': 'MM Lab 1', 'name': 'Multimedia Laboratory 1', 'type': 'Laboratory', 'desc': 'Computer lab focused on digital graphics design, animations, and UI/UX prototyping.'},
        {'room': 'MM Lab 2', 'name': 'Multimedia Laboratory 2', 'type': 'Laboratory', 'desc': 'Computer lab focused on video synthesis, rendering, and media formatting.'},
        {'room': 'OS Lab', 'name': 'Operation System Laboratory (OS)', 'type': 'Laboratory', 'desc': 'Linux operating system configuration and bash terminal shell laboratory.'},
        {'room': 'MM Studio', 'name': 'Multimedia Recording Studio', 'type': 'Multimedia Studio', 'desc': 'Isolated acoustic audio-video capture studio suite for instructional media production.'},
        {'room': 'Kuasa B2', 'name': 'Electrical Switch Room Aras 2', 'type': 'Utility', 'desc': 'Upper framework electricity distribution dashboard asset for Block B.'},
      ]
    },
    'Block C': {
      'Ground Floor': [
        {'room': 'C0.01', 'name': 'Main Central Lobby', 'type': 'Public Area', 'desc': 'The central entrance drop-off reception lobby area.'},
        {'room': 'C0.10', 'name': 'Office: Administration Desk 1', 'type': 'Office', 'desc': 'Administration & Facility Maintenance Section executive seat.'},
        {'room': 'C0.11', 'name': 'Office: Administration Desk 2', 'type': 'Office', 'desc': 'Administration & Facility Maintenance Section support desk.'},
        {'room': 'C0.12', 'name': 'Office: Administration Desk 3', 'type': 'Office', 'desc': 'Administration & Maintenance operations specialist workspace.'},
        {'room': 'C0.13', 'name': 'Office: Administration Desk 4', 'type': 'Office', 'desc': 'Administration & Maintenance logistical coordinator desk.'},
        {'room': 'C0.14', 'name': 'Office: Professor Cabin 1A', 'type': 'Office', 'desc': 'Private executive professor workspace located within Professor Suite 1.'},
        {'room': 'C0.15', 'name': 'Office: Professor Cabin 1B', 'type': 'Office', 'desc': 'Private executive professor consultation workspace within Professor Suite 1.'},
        {'room': 'C0.16', 'name': 'Office: Professor Cabin 2A', 'type': 'Office', 'desc': 'Private executive professor consultation workspace within Professor Suite 2.'},
        {'room': 'C0.17', 'name': 'Office: Professor Cabin 2B', 'type': 'Office', 'desc': 'Private executive professor research workspace within Professor Suite 2.'},
        {'room': 'C0.18', 'name': 'Office: Professor Cabin 3A', 'type': 'Office', 'desc': 'Private executive professor research workspace within Professor Suite 3.'},
        {'room': 'C0.19', 'name': 'Office: Professor Cabin 3B', 'type': 'Office', 'desc': 'Private executive professor consultation workspace within Professor Suite 3.'},
        {'room': 'Pelantar', 'name': 'Exterior Connection Platform', 'type': 'Public Area', 'desc': 'Rear outdoor transitional structural walkway deck connection.'},
        {'room': 'Surau M', 'name': 'Surau Block C (Men)', 'type': 'Prayer Room', 'desc': 'Designated male Islamic prayer sanctuary located inside the left wing corridor.'},
        {'room': 'Surau F', 'name': 'Surau Block C (Women)', 'type': 'Prayer Room', 'desc': 'Designated female Islamic prayer sanctuary located inside the right wing corridor.'},
        {'room': 'Bilik LV', 'name': 'Low Voltage Electrical Room', 'type': 'Utility', 'desc': 'Main low voltage distribution panel matrix center for Block C.'},
      ],
      'First Floor': [
        {'room': 'C1.01', 'name': 'Office: Encik Ahmad Alauddin Ariffin', 'type': 'Office', 'desc': 'Academic cabin for Computer Networks & Distributed Computing.'},
        {'room': 'C1.02', 'name': 'Office: Dr. Amir Rizaan Abdul Rahiman', 'type': 'Office', 'desc': 'Senior Lecturer in Real-Time Software Engineering & Flash Storage Systems.'},
        {'room': 'C1.03', 'name': 'Office: Prof. Dr. Nurfadhlina Mohd Sharef', 'type': 'Office', 'desc': 'Professor of Intelligent Computing, Text Mining, and Semantic Web.'},
        {'room': 'C1.04', 'name': 'Office: Prof. Madya Dr. Nor Fazlida Mohd Sani', 'type': 'Office', 'desc': 'Associate Professor of Information Security, Secure Coding & Authentication.'},
        {'room': 'C1.05', 'name': 'Office: Dr. Hazlina Hamdan', 'type': 'Office', 'desc': 'Senior Lecturer specializing in Neural Networks, Fuzzy Systems & Survival Analysis.'},
        {'room': 'C1.06', 'name': 'Office: Dr. Mohd Izuan Hafez Hj Ninggal', 'type': 'Office', 'desc': 'Senior Lecturer focused on Software Engineering & Intelligent Computing.'},
        {'room': 'C1.07', 'name': 'Office: Prof. Madya Dr. Nur Izura Udzir', 'type': 'Office', 'desc': 'Associate Professor of Computer Security, Intrusion Detection & Distributed Systems.'},
        {'room': 'C1.08', 'name': 'Office: Dr. Lilly Suriani', 'type': 'Office', 'desc': 'Academic workspace for undergraduate guidance, student counseling and advice.'},
        {'room': 'C1.09', 'name': 'Office: Prof. Ts. Dr. Zuriati Ahmad Zukarnain', 'type': 'Office', 'desc': 'Professor of Quantum Communication, Quantum Cryptography & Network Security.'},
        {'room': 'C1.11', 'name': 'Office: Prof. Madya Dr. Teh Noranis Mohd Aris', 'type': 'Office', 'desc': 'Associate Professor of Artificial Intelligence, Programming Science & Bio-nanorobotics.'},
        {'room': 'C1.12', 'name': 'Office: Dr. Hamidah Ibrahim', 'type': 'Office', 'desc': 'Senior Lecturer cabin handling decentralized databases and distributed system models.'},
        {'room': 'C1.13', 'name': 'Office: Dr. Noraziah', 'type': 'Office', 'desc': 'Senior Lecturer workstation for student consultations and module tutorials.'},
        {'room': 'C1.14', 'name': 'Office: Lecturer Suite C1.14', 'type': 'Office', 'desc': 'Academic research preparation booth and structural student consultation room.'},
        {'room': 'C1.15', 'name': 'Office: Prof. Madya Dr. Wan Nurhayati Wan Ab. Rahman', 'type': 'Office', 'desc': 'Associate Professor of E-Commerce & Software Project Management.'},
        {'room': 'C1.16', 'name': 'Office: Dr. E. Maslina Zolkepli', 'type': 'Office', 'desc': 'Senior Lecturer specializing in Computational Intelligence, Big Data & Fuzzy Systems.'},
        {'room': 'C1.17', 'name': 'Office: Ts. Dr. Siti Khadijah binti Ali', 'type': 'Office', 'desc': 'Senior Lecturer in Computer Graphics, Physics-based Animation & Assistive Robotics.'},
        {'room': 'C1.19', 'name': 'Office: Dr. Hazlina Hamdan', 'type': 'Office', 'desc': 'Secondary research desk focused on neural network data models.'},
        {'room': 'C1.20', 'name': 'Office: Ts. Dr. Mohd Hafeez Osman', 'type': 'Office', 'desc': 'Senior Lecturer specializing in Reverse Engineering and Software Design patterns.'},
        {'room': 'C1.22', 'name': 'Office: PM Dr. Taufik Abdullah', 'type': 'Office', 'desc': 'Visiting researcher workstation and associate group lecture workspace.'},
        {'room': 'C1.23', 'name': 'Office: Ts. Dr. Raihani Mohamed', 'type': 'Office', 'desc': 'Senior Lecturer in Artificial Intelligence, Big Data Analytics, and AIoT.'},
        {'room': 'C1.24', 'name': 'Office: Network Unit Professor Suite', 'type': 'Office', 'desc': 'Private workspace for senior academic professors in the network architecture domain.'},
        {'room': 'C1.26', 'name': 'Office: Prof. Madya Dr. Azizol Abdullah', 'type': 'Office', 'desc': 'Associate Professor of Grid Computing, Network Security & Distributed Systems.'},
        {'room': 'C1.27', 'name': 'Office: Dr. Salfarina Abdullah', 'type': 'Office', 'desc': 'Senior Lecturer in Management Information Systems & Knowledge Management.'},
        {'room': 'C1.28', 'name': 'Office: Dr. Abdullah', 'type': 'Office', 'desc': 'Senior Lecturer cabin handling computing hardware scheduling models.'},
        {'room': 'C1.29', 'name': 'Office: Dr. Syaiful', 'type': 'Office', 'desc': 'Academic research workspace for data mining and database architectures.'},
        {'room': 'C1.30', 'name': 'Office: Dr. Luqman Zakaria', 'type': 'Office', 'desc': 'Senior Lecturer room for advanced coding structures and consultation logs.'},
        {'room': 'C1.31', 'name': 'Office: Dr. Khaironi Yatim', 'type': 'Office', 'desc': 'Academic guidance suite for weekly student review checkups.'},
        {'room': 'C1.32', 'name': 'Office: Outer Corridor Unit C1.32', 'type': 'Office', 'desc': 'Modular lecturer workstation cabin located by the left wing staircase junction.'},
        {'room': 'C1.49', 'name': 'Office: Dr. Marziah Samian', 'type': 'Office', 'desc': 'Academic research preparation room for data retrieval systems study.'},
        {'room': 'C1.50', 'name': 'Office: Dr. Nuur Alifah binti Roslan', 'type': 'Office', 'desc': 'Senior Lecturer in Multimedia Security and Information Steganography.'},
        {'room': 'C1.51', 'name': 'Office: Dr. Aziah Asmawi', 'type': 'Office', 'desc': 'Senior Lecturer in Computing Security, Intrusion Detection, and Digital Forensics.'},
        {'room': 'C1.52', 'name': 'Office: Dr. Muhammad Daniel Hafiz Abdullah', 'type': 'Office', 'desc': 'Senior Lecturer in Computer Security, Wireless Networks, and Graphical Passwords.'},
        {'room': 'Seminar', 'name': 'Main Faculty Seminar Room', 'type': 'Seminar Room', 'desc': 'Centralized large conference room for board evaluations and defense presentations.'},
        {'room': 'Legar', 'name': 'Aras 1 Central Gathering Lounge', 'type': 'Public Area', 'desc': 'Spacious multi-way structural study platform and student conversation lounge.'},
      ],
      'Second Floor': [
        {'room': 'C2.19', 'name': 'Main Faculty Boardroom (Zone A)', 'type': 'Meeting Room', 'desc': 'Corporate executive conference room used for faculty board meetings.'},
        {'room': 'C2.20', 'name': 'Main Faculty Boardroom (Zone B)', 'type': 'Meeting Room', 'desc': 'Corporate boardroom layout extension wing for large academic summits.'},
        {'room': 'Am KJ', 'name': 'Pejabat Am K.J. (General Office Hub)', 'type': 'Office', 'desc': 'The central administrative coordination center for the Head of Department.'},
        {'room': 'Cetak', 'name': 'Central Duplication & Printing Room', 'type': 'Utility', 'desc': 'High-volume printing workspace for course packets, notes, and exam scripts.'},
        {'room': 'C2.34', 'name': 'Departmental Document Vault', 'type': 'Storage', 'desc': 'Secure archiving workspace for institutional program and course files.'},
        {'room': 'C2.36', 'name': 'Exam Scripts & Student File Repository', 'type': 'Storage', 'desc': 'Central secure repository housing student score metrics and final exam logs.'},
        {'room': 'C2.01', 'name': 'Office: Encik Mohd. Noor Derahman', 'type': 'Office', 'desc': 'Academic cabin for Computer Networks & Distributed Systems.'},
        {'room': 'C2.02', 'name': 'Office: Prof. Madya Dr. Rohaya Latip', 'type': 'Office', 'desc': 'Associate Professor of Distributed Computing, Cloud/Fog/Edge & Distributed Databases.'},
        {'room': 'C2.03', 'name': 'Office: Prof. Madya Dr. Fatimah binti Khalid', 'type': 'Office', 'desc': 'Associate Professor of Multimedia Computing & Image Processing.'},
        {'room': 'C2.04', 'name': 'Office: Dr. Mar Yah Said', 'type': 'Office', 'desc': 'Senior Lecturer in Software Engineering Requirements & Formal Specifications.'},
        {'room': 'C2.05', 'name': 'Office: Dr. Fatin Izzati binti Ramli', 'type': 'Office', 'desc': 'Senior Lecturer in Data Science, Big Data Analytics, and Simulation Modelling.'},
        {'room': 'C2.06', 'name': 'Office: Prof. Madya Dr. Zurina Mohd. Hanapi', 'type': 'Office', 'desc': 'Associate Professor of Computer Networks, Wireless/Mobile Networks & Network Security.'},
        {'room': 'C2.07', 'name': 'Office: Dr. Muhamad Sufri Bin Muhammad', 'type': 'Office', 'desc': 'Senior Lecturer in Service-Oriented Architecture and Context-Aware Mobile Learning.'},
        {'room': 'C2.08', 'name': 'Office: Dr. Siti Nurulain Mohd Rum', 'type': 'Office', 'desc': 'Senior Lecturer in Data Sciences, Database Systems, and Computational Intelligence.'},
        {'room': 'C2.09', 'name': 'Office: Prof. Madya Dr. Mas Rina binti Mustaffa', 'type': 'Office', 'desc': 'Associate Professor of Multimedia Information Retrieval, Image Processing & Pattern Recognition.'},
        {'room': 'C2.11', 'name': 'Office: Dr. Erzam Marlisah', 'type': 'Office', 'desc': 'Senior Lecturer specializing in advanced Bioinformatics algorithms.'},
        {'room': 'C2.12', 'name': 'Office: Dr. Rosli Bin Ismail', 'type': 'Office', 'desc': 'Senior Lecturer in Information Systems, Blockchain Technology, and Data Science.'},
        {'room': 'C2.13', 'name': 'Office: Support Researcher Desk C2.13', 'type': 'Office', 'desc': 'Academic consultation assistant booth for software engineering tracks.'},
        {'room': 'C2.14', 'name': 'Office: Support Researcher Desk C2.14', 'type': 'Office', 'desc': 'Academic consultation assistant booth for database systems tracks.'},
        {'room': 'C2.15', 'name': 'Office: Postgrad Assistant Cabin C2.15', 'type': 'Office', 'desc': 'Workspace allocated for department graduate teaching assistants.'},
        {'room': 'C2.16', 'name': 'Office: Postgrad Assistant Cabin C2.16', 'type': 'Office', 'desc': 'Workspace allocated for department graduate teaching assistants.'},
        {'room': 'C2.44', 'name': 'Office: Dr. Nor Azura Husin', 'type': 'Office', 'desc': 'Senior Lecturer in Neural Networks and Intelligent Computing applications.'},
        {'room': 'C2.46', 'name': 'Office: Prof. Madya Dr. Noris binti Mohd Norowi', 'type': 'Office', 'desc': 'Associate Professor focused on advanced Multimedia Information Systems layout designs.'},
        {'room': 'C2.48', 'name': 'Office: Ts. Dr. Nurul Amelina binti Nasharuddin', 'type': 'Office', 'desc': 'Senior Lecturer in Natural Language Processing and Cross-language Information Retrieval.'},
      ],
      'Third Floor': [
        {'room': 'C3.01', 'name': 'Office: Upper Corridor Suite C3.01', 'type': 'Office', 'desc': 'Upper framework presentation setup booth and lecturer consultation deck.'},
        {'room': 'C3.02', 'name': 'Office: Prof. Dato\' Dr. Shamala K. Subramaniam', 'type': 'Office', 'desc': 'Professor of Real-Time Scheduling, Computer Networks, and Simulation Modelling.'},
        {'room': 'C3.03', 'name': 'Office: Dr. Amir Rizaan', 'type': 'Office', 'desc': 'Secondary upper floor administration desk for flash storage systems analysis.'},
        {'room': 'C3.04', 'name': 'Office: Prof. Madya Dr. Razali Yaakob', 'type': 'Office', 'desc': 'Associate Professor of Neural Networks, Artificial Intelligence, Games, and Evolutionary Computation.'},
        {'room': 'C3.05', 'name': 'Office: Prof. Madya Ts. Dr. Iskandar Ishak', 'type': 'Office', 'desc': 'Associate Professor specializing in advanced Database Systems management.'},
        {'room': 'C3.06', 'name': 'Office: Dr. Ng Seng Beng', 'type': 'Office', 'desc': 'Senior Lecturer cabin specializing in layout models for Computer Graphics.'},
        {'room': 'C3.07', 'name': 'Office: Dr. Mohd Yunus Sharum', 'type': 'Office', 'desc': 'Senior Lecturer in Information Security, Machine Learning, and Computational Linguistics.'},
        {'room': 'C3.08', 'name': 'Office: Dr. Khairul Azhar Kasmiran', 'type': 'Office', 'desc': 'Senior Lecturer focused on Software Engineering and Programming Languages.'},
        {'room': 'C3.09', 'name': 'Office: Prof. Madya Dr. Hizmawati binti Madzin', 'type': 'Office', 'desc': 'Associate Professor of Multimedia Computing, IR, Pattern Recognition, and Medical Imaging.'},
        {'room': 'C3.10', 'name': 'Office: Dr. Fahrul Hakim bin Huyop @ Ayob', 'type': 'Office', 'desc': 'Lecturer in Computer Networks, Wireless Networks, and Artificial Intelligence.'},
        {'room': 'C3.11', 'name': 'Office: Ts. Dr. Ng Keng Yap', 'type': 'Office', 'desc': 'Senior Lecturer in Software Architecture, Component-based Connectors, and Data Science.'},
        {'room': 'C3.12', 'name': 'Office: Dr. Azrina Kamaruddin', 'type': 'Office', 'desc': 'Senior Lecturer focused on Human-Computer Interaction & Personal Information Management.'},
        {'room': 'C3.13', 'name': 'Office: Dr. Mar Yah Said', 'type': 'Office', 'desc': 'Upper floor postgraduate review room for formal software specification checks.'},
        {'room': 'C3.14', 'name': 'Office: Prof. Madya Dr. Norhayati Mohd. Ali', 'type': 'Office', 'desc': 'Associate Professor of Software Engineering, Object-oriented Design, and Visual Languages.'},
        {'room': 'C3.15', 'name': 'Office: Ts. Dr. Rozi Nor Haizan Nor', 'type': 'Office', 'desc': 'Senior Lecturer in Management Information Systems and Corporate ICT Services.'},
        {'room': 'C3.16', 'name': 'Office: Puan Ainita Ban', 'type': 'Office', 'desc': 'Lecturer specializing in core Software Engineering and Formal Specification rules.'},
        {'room': 'C3.17', 'name': 'Office: Dr. Shymala Doraisamy', 'type': 'Office', 'desc': 'Senior Lecturer workspace handling multimedia information retrieval and audio analytics.'},
        {'room': 'C3.18', 'name': 'Office: Prof. Madya Ts. Dr. Novia Indriaty Admodisastro', 'type': 'Office', 'desc': 'Associate Professor of Software Engineering, Service Engineering, and Inclusive Technology.'},
        {'room': 'C3.19', 'name': 'Office: Dr. Pathiah Abdul Samat', 'type': 'Office', 'desc': 'Senior Lecturer cabin specializing in Formal Software Verification and Model Checking.'},
        {'room': 'C3.20', 'name': 'Office: Dr. Sharifah Md Yasin', 'type': 'Office', 'desc': 'Senior Lecturer in Computer Security, Elliptic Curve Cryptography, and e-Learning platforms.'},
        {'room': 'C3.21', 'name': 'Office: Prof. Madya Dr. Noraini Che Pa', 'type': 'Office', 'desc': 'Associate Professor of MIS, Software Project Management, and Requirements Engineering.'},
        {'room': 'C3.22', 'name': 'Office: Dr. Noridayu Manshor', 'type': 'Office', 'desc': 'Senior Lecturer in Pattern Recognition, Image Processing, and Computer Vision.'},
        {'room': 'C3.23', 'name': 'Office: Prof. Madya Ts. Dr. Yusmadi Yah Jusoh', 'type': 'Office', 'desc': 'Associate Professor of MIS, Strategic Information System Planning, and Software Metrics.'},
        {'room': 'C3.24', 'name': 'Office: Prof. Madya Dr. Sa\'adah Hassan', 'type': 'Office', 'desc': 'Associate Professor specializing in Requirements Engineering and Software Architectures.'},
        {'room': 'C3.25', 'name': 'Office: Dr. Salmi Baharom', 'type': 'Office', 'desc': 'Senior Lecturer workstation managing course evaluations for software quality criteria.'},
        {'room': 'C3.26', 'name': 'Office: Prof. Madya Dr. Azreen bin Azman', 'type': 'Office', 'desc': 'Associate Professor of Intelligent Systems, Information Retrieval, and Text Mining.'},
        {'room': 'C3.27', 'name': 'Office: Dr. Azree Shahrel Ahmad Nazri', 'type': 'Office', 'desc': 'Senior Lecturer in Artificial Intelligence, Artificial General Intelligence (AGI), and Bioinformatics.'},
        {'room': 'C3.28', 'name': 'Office: Prof. Madya Dr. Puteri Suhaiza binti Sulaiman', 'type': 'Office', 'desc': 'Associate Professor of Computer Graphics and Geographical Information Systems (GIS).'},
        {'room': 'C3.32', 'name': 'Office: YM Raja Azlina Raja Mahmood', 'type': 'Office', 'desc': 'Lecturer in Network Security, Wireless & Mobile Networks, and Machine Learning applications.'},
      ]
    }
  };

  @override
  void initState() {
    super.initState();
    _blockTabController = TabController(length: 3, vsync: this);
    _floorTabController = TabController(length: 4, vsync: this);

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
                              // Room badge tag for enhanced reading hierarchy
                              Container(
                                width: 85,
                                height: 52,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8F8EC),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Text(
                                  facility['room'] ?? 'ROOM',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xFF22C55E),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
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
                                    const SizedBox(height: 5),
                                    Text(
                                      facility['desc']!,
                                      style: const TextStyle(
                                        fontSize: 12.5,
                                        color: Color(0xFF64748B),
                                        height: 1.35,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFF94A3B8), size: 14),
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
}