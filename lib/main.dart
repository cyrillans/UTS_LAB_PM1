import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const QuizzyApp());
}

class QuizzyApp extends StatelessWidget {
  const QuizzyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzy',

      theme: ThemeData(
        useMaterial3: true,

        fontFamily: 'DejaVuSans',

        scaffoldBackgroundColor:
            const Color(0xFFF8F7FF),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
        ),
      ),

      home: const SplashScreen(),
    );
  }
}