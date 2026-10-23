import 'dart:async';

import 'package:flutter/material.dart';

import '../routes/routes_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;

        Navigator.pushReplacementNamed(
          context,
          AppRoutes.login,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.42,
                  height: size.width * 0.42,
                  padding: EdgeInsets.all(
                    size.width * 0.06,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/logo_quizzy.png',
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(
                  height: size.height * 0.035,
                ),

                Text(
                  'Quizzy',
                  style: TextStyle(
                    fontSize: size.width * 0.09,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF6C63FF),
                  ),
                ),

                SizedBox(
                  height: size.height * 0.01,
                ),

                Text(
                  'Test your knowledge!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.04,
                    color: Colors.grey.shade600,
                  ),
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),

                SizedBox(
                  width: size.width * 0.12,
                  height: size.width * 0.12,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}