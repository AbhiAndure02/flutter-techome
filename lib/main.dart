import 'package:techhome/Screen/device.dart';
import 'package:techhome/Screen/flash.dart';
import 'package:techhome/Screen/insight.dart';
import 'package:techhome/Screen/profile.dart';
import 'package:techhome/Screen/schedule.dart';
import 'package:flutter/material.dart';
import 'package:techhome/Screen/home.dart';
import 'package:techhome/Screen/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'techhome',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(elevation: 0, centerTitle: true),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: Colors.grey[900],
        ),
      ),
      themeMode: ThemeMode.system, // Follows system theme
      initialRoute: '/flash',
      routes: {
        '/': (context) => const BeautifulHome(),
        '/flash': (context) => const FlashScreen(),
        '/timer': (context) => const BulbTimerApp(),
        '/schedule': (context) => const Schedule(),
        '/profile': (context) => const ProfileScreen(),
        '/insight': (context) => const InsightScreen(),
        '/device': (context) => const DeviceScreen(),
      },
      onGenerateRoute: (settings) {
        // Handle any undefined routes
        if (settings.name == '/schedule') {
          return MaterialPageRoute(builder: (context) => const Schedule());
        }
        if (settings.name == '/timer') {
          return MaterialPageRoute(builder: (context) => const BulbTimerApp());
        }
        if (settings.name == '/profile') {
          return MaterialPageRoute(builder: (context) => const ProfileScreen());
        }
        if (settings.name == '/insight') {
          return MaterialPageRoute(builder: (context) => const InsightScreen());
        }
        if (settings.name == '/device') {
          return MaterialPageRoute(builder: (context) => const DeviceScreen());
        }
        if (settings.name == '/flash') {
          return MaterialPageRoute(builder: (context) => const FlashScreen());
        }
        return null;
      },
    );
  }
}
