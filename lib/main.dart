import 'package:flutter/material.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTH Todo',
      debugShowCheckedModeBanner: false,
      home: const StartScreen(), // Chạy màn hình Start đầu tiên
    );
  }
}
