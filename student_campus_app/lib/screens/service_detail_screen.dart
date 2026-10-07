import 'package:flutter/material.dart';

import '../models/campus_service.dart';

class ServiceDetailScreen extends StatelessWidget {
  final CampusService service;

  const ServiceDetailScreen({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: service.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Icon(
              service.icon,
              size: 64,
              color: service.color,
            ),
          ),
          const SizedBox(height: 22),
          Text(
            service.name,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            service.description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          _InfoRow(
            icon: Icons.location_on_outlined,
            label: 'Location',
            value: service.location,
          ),
          _InfoRow(
            icon: Icons.access_time_outlined,
            label: 'Opening hours',
            value: service.openingHours,
          ),
          _InfoRow(
            icon: Icons.email_outlined,
            label: 'Contact',
            value: service.contact,
          ),
          _InfoRow(
            icon: Icons.check_circle_outline,
            label: 'Status',
            value: service.status,
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () {
              // Required returned result.
              Navigator.pop(context, 'requested');
            },
            icon: const Icon(Icons.event_available_outlined),
            label: const Text('Request an appointment'),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Return to services'),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 3),
                Text(value),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
