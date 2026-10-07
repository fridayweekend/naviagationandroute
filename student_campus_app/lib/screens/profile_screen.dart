import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDark;

  const ProfileScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  child: Text(
                    'AL',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Alex Lim',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                const SizedBox(height: 4),
                const Text('Mobile Computing'),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Card(
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.badge_outlined),
                  title: Text('Student ID'),
                  subtitle: Text('MC20260123'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.school_outlined),
                  title: Text('Programme'),
                  subtitle: Text('Bachelor of Computer Science'),
                ),
                Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text('Email'),
                  subtitle: Text('alex.lim@student.campus.edu'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Card(
            child: SwitchListTile(
              value: isDark,
              onChanged: (_) => onToggleTheme(),
              title: const Text(
                'Dark mode',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: const Text('Keep the same theme across routes'),
              secondary: Icon(
                isDark
                    ? Icons.dark_mode_outlined
                    : Icons.light_mode_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
