import 'package:flutter/material.dart';

class CampusService {
  final String name;
  final String description;
  final String location;
  final String openingHours;
  final String contact;
  final String status;
  final IconData icon;
  final Color color;

  const CampusService({
    required this.name,
    required this.description,
    required this.location,
    required this.openingHours,
    required this.contact,
    required this.status,
    required this.icon,
    required this.color,
  });
}

const campusServices = <CampusService>[
  CampusService(
    name: 'Student Affairs',
    description:
        'Support for student activities, welfare enquiries, campus matters and general student assistance.',
    location: 'Student Centre, Level 1',
    openingHours: '8:30 AM - 5:00 PM',
    contact: 'studentaffairs@campus.edu',
    status: 'Open today',
    icon: Icons.people_alt_outlined,
    color: Color(0xFF155EEF),
  ),
  CampusService(
    name: 'IT Help Desk',
    description:
        'Technical assistance for student accounts, Wi-Fi, computer labs and common campus systems.',
    location: 'ICT Building, Level 2',
    openingHours: '9:00 AM - 5:30 PM',
    contact: 'helpdesk@campus.edu',
    status: 'Open today',
    icon: Icons.computer_outlined,
    color: Color(0xFF7F56D9),
  ),
  CampusService(
    name: 'Library',
    description:
        'Access books, study areas, digital resources and quiet learning spaces.',
    location: 'Learning Resource Centre',
    openingHours: '8:00 AM - 8:00 PM',
    contact: 'library@campus.edu',
    status: 'Open today',
    icon: Icons.local_library_outlined,
    color: Color(0xFF039855),
  ),
  CampusService(
    name: 'Accommodation Office',
    description:
        'Housing information, room enquiries, accommodation support and residential matters.',
    location: 'Student Residence Office',
    openingHours: '8:30 AM - 5:00 PM',
    contact: 'housing@campus.edu',
    status: 'Open today',
    icon: Icons.home_work_outlined,
    color: Color(0xFFDC6803),
  ),
];
