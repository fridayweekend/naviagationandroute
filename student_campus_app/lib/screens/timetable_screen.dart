import 'package:flutter/material.dart';

import '../widgets/section_title.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final classes = [
      ('MON', '9:00 AM', 'Cloud Computing & Virtualization', 'Lab 3'),
      ('TUE', '10:00 AM', 'Mobile Apps Development', 'Lab 2'),
      ('WED', '2:00 PM', 'Web Application Development', 'Room B204'),
      ('THU', '11:00 AM', 'Network Security', 'Room C105'),
      ('FRI', '3:00 PM', 'Project / FYP Session', 'Project Lab'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionTitle(
            title: 'This week',
            subtitle: 'Your current class schedule.',
          ),
          Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  Icon(Icons.star_outline, size: 30),
                  SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      'Next class: Mobile Apps Development at 10:00 AM in Lab 2.',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          for (final item in classes)
            Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(14),
                leading: CircleAvatar(
                  child: Text(item.$1),
                ),
                title: Text(
                  item.$3,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text('${item.$2} • ${item.$4}'),
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
        ],
      ),
    );
  }
}
