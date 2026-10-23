
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/quiz_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/user_session.dart';
import 'routes/routes_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => QuizProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserSession(),
        ),
      ],
      child: const QuizzyApp(),
    ),
  );
}

class QuizzyApp extends StatelessWidget {
  const QuizzyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'Quizzy',
      debugShowCheckedModeBanner: false,

      // Navigasi aplikasi
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,

      // Pengaturan tema global
      themeMode: themeProvider.themeMode,
      theme: themeProvider.lightTheme,
      darkTheme: themeProvider.darkTheme,
    );
  }
}
