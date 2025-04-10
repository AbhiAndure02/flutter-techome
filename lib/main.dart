import 'package:flutter/material.dart';
import 'package:my_app/Screen/home.dart';
import 'package:my_app/Screen/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bulb Timer App',
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
      initialRoute: '/',
      routes: {
        '/': (context) => const BeautifulHome(),
        '/timer': (context) => const BulbTimerApp(),
      },
      onGenerateRoute: (settings) {
        // Handle any undefined routes
        if (settings.name == '/timer') {
          return MaterialPageRoute(builder: (context) => const BulbTimerApp());
        }
        return null;
      },
    );
  }
}
