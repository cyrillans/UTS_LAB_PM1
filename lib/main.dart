
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/routes_app.dart';
import 'providers/quiz_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: const QuizzyApp(),
    ),
  );
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
        scaffoldBackgroundColor: const Color(0xFFF8F7FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
        ),
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
