import 'package:flutter/material.dart';

import '../routes/routes_app.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(
        context,
        AppRoutes.leaderboard,
      );
    }

    if (index == 2) {
      Navigator.pushNamed(
        context,
        AppRoutes.profile,
      );
    }
  }

  void startQuiz() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Quiz screen akan dibuat selanjutnya 🚀',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.025,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // =========================
              // HEADER
              // =========================
              Row(
                children: [
                  Container(
                    width: size.width * 0.12,
                    height: size.width * 0.12,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/logo_quizzy.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(
                    width: size.width * 0.035,
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning! 👋',
                          style: TextStyle(
                            fontSize: size.width * 0.033,
                            color: Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 3),

                        Text(
                          'Quizzer',
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              // =========================
              // WELCOME CARD
              // =========================
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  size.width * 0.055,
                ),
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
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF6C63FF)
                          .withValues(alpha: 0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ready to challenge yourself?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.bold,
                        height: 1.25,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Test your knowledge and get the highest score!',
                      style: TextStyle(
                        color: Colors.white.withValues(
                          alpha: 0.85,
                        ),
                        fontSize: size.width * 0.035,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: size.width * 0.38,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: startQuiz,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor:
                              const Color(0xFF6C63FF),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(14),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start Quiz',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 6),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              // =========================
              // STATISTICS
              // =========================
              Text(
                'Your Statistics',
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.quiz_outlined,
                      value: '0',
                      label: 'Quiz Taken',
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _StatCard(
                      icon: Icons.star_outline_rounded,
                      value: '0',
                      label: 'Best Score',
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _StatCard(
                      icon: Icons
                          .local_fire_department_outlined,
                      value: '0',
                      label: 'Streak',
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.03,
              ),

              // =========================
              // TOP RANKING HEADER
              // =========================
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Ranking',
                    style: TextStyle(
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.leaderboard,
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xFF6C63FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // =========================
              // RANKING LIST
              // =========================
              const _RankingItem(
                rank: 1,
                name: 'Alya Putri',
                score: 98,
                isFirst: true,
              ),

              const _RankingItem(
                rank: 2,
                name: 'Rizky Pratama',
                score: 95,
              ),

              const _RankingItem(
                rank: 3,
                name: 'Nadia Salsabila',
                score: 92,
              ),

              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),

      // =========================
      // BOTTOM NAVIGATION
      // =========================
      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTap: changePage,
      ),
    );
  }
}

// =====================================================
// STAT CARD
// =====================================================

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.018,
        horizontal: size.width * 0.025,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF6C63FF),
            size: size.width * 0.07,
          ),

          const SizedBox(height: 8),

          Text(
            value,
            style: TextStyle(
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 3),

          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.width * 0.027,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// RANKING ITEM
// =====================================================

class _RankingItem extends StatelessWidget {
  final int rank;
  final String name;
  final int score;
  final bool isFirst;

  const _RankingItem({
    required this.rank,
    required this.name,
    required this.score,
    this.isFirst = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isFirst
              ? const Color(0xFFFFD66B)
              : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isFirst
                  ? const Color(0xFFFFF1C7)
                  : const Color(0xFFF1F0FF),
              shape: BoxShape.circle,
            ),
            child: Text(
              '$rank',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isFirst
                    ? const Color(0xFFD99A00)
                    : const Color(0xFF6C63FF),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: Color(0xFFFFC107),
                size: 20,
              ),

              const SizedBox(width: 4),

              Text(
                '$score',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}