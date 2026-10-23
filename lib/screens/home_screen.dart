import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../providers/user_session.dart';
import '../routes/routes_app.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color purple = Color(0xFF6C63FF);
  static const Color darkPurple = Color(0xFF27234A);
  static const Color background = Color(0xFFF7F7FC);

  void startQuiz(BuildContext context) {
    context.read<QuizProvider>().resetQuiz();
    Navigator.pushNamed(context, AppRoutes.quiz);
  }

  @override
  Widget build(BuildContext context) {
    final userName = context.watch<UserSession>().userName;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final pageBackground = theme.scaffoldBackgroundColor;
    final cardBackground = theme.colorScheme.surface;
    final primaryText = theme.colorScheme.onSurface;
    final secondaryText = isDark
        ? Colors.grey.shade400
        : Colors.grey.shade600;
    final borderColor = theme.dividerColor.withOpacity(0.2);

    return Scaffold(
      backgroundColor: pageBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: cardBackground,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/logo_quizzy.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat datang 👋',
                          style: TextStyle(
                            fontSize: 12,
                            color: secondaryText,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '$userName!',
                          style: TextStyle(
                            fontSize: 21,
                            color: primaryText,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: cardBackground,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Belum ada notifikasi baru.'),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.notifications_none_rounded,
                        color: primaryText,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // HERO CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF8378FF),
                      Color(0xFF6255E8),
                      Color(0xFF4536B5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: purple.withOpacity(0.22),
                      blurRadius: 22,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -8,
                      top: 4,
                      child: Icon(
                        Icons.auto_awesome_rounded,
                        size: 88,
                        color: Colors.white.withOpacity(0.12),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 11,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.bolt_rounded,
                                color: Color(0xFFFFD76A),
                                size: 16,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'CHALLENGE YOURSELF',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Asah Otakmu,\nRaih Skor Terbaik!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            height: 1.2,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Uji pengetahuanmu dan jadilah juara di Quizzy.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 12,
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 22),
                        ElevatedButton(
                          onPressed: () => startQuiz(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFD76A),
                            foregroundColor: darkPurple,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 19,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Mulai Sekarang',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // STATISTIK
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ringkasan Kamu',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: primaryText,
                    ),
                  ),
                  const Icon(
                    Icons.insights_rounded,
                    color: purple,
                    size: 23,
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.quiz_rounded,
                      title: 'Total Soal',
                      value: '10',
                      color: purple,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.emoji_events_rounded,
                      title: 'Skor Maks.',
                      value: '100',
                      color: const Color(0xFFFFA94D),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.local_fire_department_rounded,
                      title: 'Semangat',
                      value: 'Go!',
                      color: const Color(0xFF18B89A),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 29),

              // AKTIVITAS
              Text(
                'Pilih Aktivitas',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w900,
                  color: primaryText,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                'Mulai tantanganmu hari ini',
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 15),

              // MULAI KUIS
              _ActivityCard(
                icon: Icons.psychology_rounded,
                title: 'Mulai Kuis',
                subtitle: 'Uji pengetahuanmu dan kumpulkan poin',
                color: purple,
                onTap: () => startQuiz(context),
              ),

              const SizedBox(height: 12),

              // PAPAN PERINGKAT
              _ActivityCard(
                icon: Icons.emoji_events_rounded,
                title: 'Papan Peringkat',
                subtitle: 'Lihat posisi pemain teratas',
                color: const Color(0xFFFFA94D),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.leaderboard,
                  );
                },
              ),

              const SizedBox(height: 24),

              // MOTIVASI
              Container(
                padding: const EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF29263F)
                      : const Color(0xFFEDEBFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.lightbulb_rounded,
                      color: purple,
                      size: 29,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tahukah Kamu?',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              color: primaryText,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Konsistensi berlatih adalah kunci untuk mendapatkan hasil yang lebih baik.',
                            style: TextStyle(
                              fontSize: 11,
                              height: 1.5,
                              color: isDark
                                  ? const Color(0xFFD0CAFF)
                                  : const Color(0xFF625B86),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: const BottomNav(currentIndex: 0),
    );
  }
}

// STATISTIC CARD
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 39,
            height: 39,
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(
              icon,
              color: color,
              size: 22,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w900,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: isDark
                  ? Colors.grey.shade400
                  : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

// ACTIVITY CARD
class _ActivityCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _ActivityCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: theme.colorScheme.surface,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: theme.dividerColor.withOpacity(0.2),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 49,
                height: 49,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 26,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 11,
                        height: 1.4,
                        color: isDark
                            ? Colors.grey.shade400
                            : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: isDark
                    ? Colors.grey.shade500
                    : Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}