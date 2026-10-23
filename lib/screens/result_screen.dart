
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../routes/routes_app.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final size = MediaQuery.sizeOf(context);

    final percentage =
        (quiz.score / quiz.totalQuestions * 100).round();

    final message = percentage >= 80
        ? 'Excellent work!'
        : percentage >= 60
            ? 'Good job!'
            : 'Keep practicing!';

    final emoji = percentage >= 80
        ? '🏆'
        : percentage >= 60
            ? '🎉'
            : '💪';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(size.width * 0.07),
            child: Column(
              children: [
                Text(
                  emoji,
                  style: TextStyle(
                    fontSize: size.width * 0.22,
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'Quiz Completed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.065,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  message,
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: const Color(0xFF6C63FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 28),

                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(size.width * 0.07),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF6C63FF),
                        Color(0xFF8A7FFF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Your Score',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Text(
                        '${quiz.score}/${quiz.totalQuestions}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        '$percentage%',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: size.width * 0.055,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 18),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          value: percentage / 100,
                          minHeight: 10,
                          backgroundColor: Colors.white30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: _ResultStat(
                        icon: Icons.check_circle_outline,
                        value: '${quiz.score}',
                        label: 'Correct',
                        color: Colors.green,
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _ResultStat(
                        icon: Icons.cancel_outlined,
                        value: '${quiz.totalQuestions - quiz.score}',
                        label: 'Incorrect',
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<QuizProvider>().resetQuiz();

                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.quiz,
                      );
                    },
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Try Again'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C63FF),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.read<QuizProvider>().resetQuiz();

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.home_outlined),
                    label: const Text('Back to Home'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF6C63FF),
                      side: const BorderSide(
                        color: Color(0xFF6C63FF),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
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

class _ResultStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _ResultStat({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
