import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/home_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/leaderboard_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/result_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String quiz = '/quiz';
  static const String leaderboard = '/leaderboard';
  static const String profile = '/profile';
  static const String result = '/result';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    signup: (context) => const SignUpScreen(),
    home: (context) => const HomeScreen(),
    quiz: (context) => const QuizScreen(),
    leaderboard: (context) => const LeaderboardScreen(),
    profile: (context) => const ProfileScreen(),
    result: (context) => const ResultScreen(),
  };
}