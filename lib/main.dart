import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const StockEaseApp());
}

class StockEaseApp extends StatelessWidget {
  const StockEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StockEase',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF5F7F8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF16A085),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}