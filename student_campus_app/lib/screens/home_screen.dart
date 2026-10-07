import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../widgets/campus_card.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CampusGo',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            tooltip: 'Student profile',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.profile);
            },
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    'Good morning, Alex 👋',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Your campus, one tap away.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 22),

                  // Dashboard summary / next-class card.
                  Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.schedule,
                            color: Colors.white,
                            size: 34,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Next class',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Mobile Apps Development',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '10:00 AM • Lab 2',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 26),
                  const SectionTitle(
                    title: 'Campus areas',
                    subtitle: 'Quick access to your everyday campus information.',
                  ),
                  const SizedBox(height: 4),

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final wide = constraints.maxWidth >= 620;
                      final cards = [
                        CampusCard(
                          icon: Icons.calendar_month_outlined,
                          title: 'Timetable',
                          subtitle: 'View your classes',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.timetable,
                            );
                          },
                        ),
                        CampusCard(
                          icon: Icons.room_service_outlined,
                          title: 'Services',
                          subtitle: 'Campus support',
                          onTap: () async {
                            final result = await Navigator.pushNamed(
                              context,
                              AppRoutes.services,
                            );

                            if (!context.mounted) return;
                            if (result == 'requested') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Appointment request recorded.',
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        CampusCard(
                          icon: Icons.event_outlined,
                          title: 'Events',
                          subtitle: 'What is happening',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.events,
                            );
                          },
                        ),
                        CampusCard(
                          icon: Icons.person_outline,
                          title: 'Profile',
                          subtitle: 'Student information',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.profile,
                            );
                          },
                        ),
                      ];

                      if (wide) {
                        return GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 2.7,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: cards,
                        );
                      }

                      return Column(
                        children: [
                          for (final card in cards) ...[
                            card,
                            const SizedBox(height: 12),
                          ],
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 14),
                  const SectionTitle(title: 'Reminder'),
                  Card(
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      leading: const CircleAvatar(
                        child: Icon(Icons.notifications_none),
                      ),
                      title: const Text(
                        'Check your timetable before tomorrow.',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: const Text(
                        'Keep your classes and campus activities organized.',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
