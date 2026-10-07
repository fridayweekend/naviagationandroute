import 'package:flutter/material.dart';

import 'models/campus_event.dart';
import 'models/campus_service.dart';
import 'routes/app_routes.dart';
import 'screens/event_detail_screen.dart';
import 'screens/events_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/service_detail_screen.dart';
import 'screens/services_screen.dart';
import 'screens/timetable_screen.dart';
import 'screens/unknown_route_screen.dart';

void main() {
  runApp(const CampusGoApp());
}

class CampusGoApp extends StatefulWidget {
  const CampusGoApp({super.key});

  @override
  State<CampusGoApp> createState() => _CampusGoAppState();
}

class _CampusGoAppState extends State<CampusGoApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF155EEF),
        brightness: brightness,
      ),
      scaffoldBackgroundColor:
          isDark ? const Color(0xFF101828) : const Color(0xFFF8FAFC),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusGo',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: _themeMode,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => const HomeScreen(),
        AppRoutes.timetable: (_) => const TimetableScreen(),
        AppRoutes.services: (_) => const ServicesScreen(),
        AppRoutes.events: (_) => EventsScreen(
              onToggleTheme: _toggleTheme,
              isDark: _themeMode == ThemeMode.dark,
            ),
        AppRoutes.profile: (_) => ProfileScreen(
              onToggleTheme: _toggleTheme,
              isDark: _themeMode == ThemeMode.dark,
            ),
      },

      // Dynamic route for a selected service.
      onGenerateRoute: (settings) {
        if (settings.name == AppRoutes.serviceDetail) {
          final arguments = settings.arguments;

          if (arguments is CampusService) {
            return MaterialPageRoute(
              settings: settings,
              builder: (_) => ServiceDetailScreen(service: arguments),
            );
          }
        }

        if (settings.name == AppRoutes.eventDetail) {
          final arguments = settings.arguments;

          if (arguments is CampusEvent) {
            // Extension 1: custom transition with PageRouteBuilder.
            return PageRouteBuilder(
              settings: settings,
              pageBuilder: (_, animation, secondaryAnimation) =>
                  EventDetailScreen(event: arguments),
              transitionsBuilder:
                  (_, animation, secondaryAnimation, child) {
                final curved = CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                );

                return FadeTransition(
                  opacity: curved,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.08),
                      end: Offset.zero,
                    ).animate(curved),
                    child: child,
                  ),
                );
              },
            );
          }
        }

        return null;
      },

      // Required fallback for unregistered routes.
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => UnknownRouteScreen(
            routeName: settings.name ?? 'Unknown',
          ),
        );
      },
    );
  }
}
