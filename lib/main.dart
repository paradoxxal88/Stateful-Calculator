import 'package:flutter/material.dart';

import 'screen/calculator_screen.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7A42F4),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF121214),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2A2A2E),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}
