import 'package:flutter/material.dart';

import '../models/campus_service.dart';
import '../routes/app_routes.dart';
import '../widgets/section_title.dart';
import '../widgets/service_tile.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Services'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SectionTitle(
            title: 'Student support',
            subtitle: 'Select a service to view its details.',
          ),
          for (final service in campusServices)
            ServiceTile(
              service: service,
              onTap: () async {
                // Required argument passing: the selected service is sent
                // to the details route instead of using hard-coded data.
                final result = await Navigator.pushNamed(
                  context,
                  AppRoutes.serviceDetail,
                  arguments: service,
                );

                if (!context.mounted) return;

                if (result == 'requested') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${service.name} appointment request recorded.',
                      ),
                    ),
                  );
                }
              },
            ),
        ],
      ),
    );
  }
}
