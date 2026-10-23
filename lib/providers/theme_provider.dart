
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  // Mendapatkan mode tema yang sedang aktif
  ThemeMode get themeMode => _themeMode;

  // Mengecek apakah Dark Mode sedang aktif
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  // =========================
  // LIGHT THEME
  // =========================
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF6C63FF),
        brightness: Brightness.light,
      ),

      scaffoldBackgroundColor: const Color(0xFFF8F7FF),
      cardColor: Colors.white,

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF8F7FF),
        foregroundColor: Color(0xFF25233A),
        elevation: 0,
        centerTitle: false,
      ),

      fontFamily: 'QuizSans',
    );
  }

  // =========================
  // DARK THEME
  // =========================
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF8B83FF),
        brightness: Brightness.dark,
      ),

      scaffoldBackgroundColor: const Color(0xFF121218),
      cardColor: const Color(0xFF22222D),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121218),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),

      fontFamily: 'QuizSans',
    );
  }

  // =========================
  // MENGUBAH TEMA
  // =========================
  void setTheme(ThemeMode mode) {
    if (_themeMode == mode) return;

    _themeMode = mode;
    notifyListeners();
  }

  // =========================
  // TOGGLE LIGHT / DARK MODE
  // =========================
  void toggleTheme() {
    setTheme(
      isDarkMode ? ThemeMode.light : ThemeMode.dark,
    );
  }
}
