import 'package:flutter/material.dart';

import '../models/campus_event.dart';
import '../routes/app_routes.dart';
import '../widgets/section_title.dart';

class EventsScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const EventsScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Events'),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            onPressed: onToggleTheme,
            icon: Icon(
              isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionTitle(
            title: 'Upcoming events',
            subtitle: 'Discover activities happening around campus.',
          ),
          for (final event in campusEvents)
            Card(
              margin: const EdgeInsets.only(bottom: 14),
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  // Direct Navigator.push() + MaterialPageRoute requirement.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => _DirectEventPreview(event: event),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 62,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primaryContainer,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          event.date,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text('${event.time} • ${event.venue}'),
                            const SizedBox(height: 7),
                            const Text(
                              'Tap to view event details',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// This direct MaterialPageRoute demonstrates push() separately from
// the named-route event detail flow used elsewhere in the app.
class _DirectEventPreview extends StatelessWidget {
  final CampusEvent event;

  const _DirectEventPreview({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Preview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 12),
            Text(event.description),
            const SizedBox(height: 18),
            Text('${event.date} • ${event.time}'),
            Text(event.venue),
            const Spacer(),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.eventDetail,
                  arguments: event,
                );
              },
              child: const Text('Open full event details'),
            ),
          ],
        ),
      ),
    );
  }
}
