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
      home: const BulbTimerApp(),
      routes: {'/timer': (context) => BeautifulHome()},
    );
  }
}
