import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() =>
      _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  String selectedFilter = 'Minggu ini';

  final List<Map<String, dynamic>> players = [
    {
      'rank': 1,
      'name': 'Alya Putri',
      'score': 98,
      'played': 12,
      'accuracy': 98,
    },
    {
      'rank': 2,
      'name': 'Rizky Pratama',
      'score': 95,
      'played': 10,
      'accuracy': 95,
    },
    {
      'rank': 3,
      'name': 'Nadia Salsabila',
      'score': 92,
      'played': 11,
      'accuracy': 92,
    },
    {
      'rank': 4,
      'name': 'Fajar Ramadhan',
      'score': 89,
      'played': 8,
      'accuracy': 89,
    },
    {
      'rank': 5,
      'name': 'Citra Amelia',
      'score': 87,
      'played': 9,
      'accuracy': 87,
    },
    {
      'rank': 6,
      'name': 'Dimas Saputra',
      'score': 84,
      'played': 7,
      'accuracy': 84,
    },
  ];

  static const Color purple = Color(0xFF6C63FF);
  static const Color darkPurple = Color(0xFF28204F);
  static const Color background = Color(0xFFF7F6FF);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isWide = size.width >= 600;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pageBackground = isDark ? const Color(0xFF121212) : background;
    final cardBackground = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final primaryText = isDark ? Colors.white : darkPurple;
    final secondaryText = isDark ? Colors.white70 : Colors.grey;

    return Scaffold(
      backgroundColor: pageBackground,
      appBar: AppBar(
        backgroundColor: pageBackground,
        elevation: 0,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Leaderboard 🏆',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 23,
                color: primaryText,
              ),
            ),
            Text(
              'Buktikan kemampuan kuismu!',
              style: TextStyle(
                fontSize: 12,
                color: secondaryText,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: isWide ? size.width * 0.12 : 20,
          vertical: 12,
        ),
        children: [
          _buildHeroCard(context),
          const SizedBox(height: 22),
          _buildStatistics(context),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Champions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: primaryText,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: cardBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade200,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedFilter,
                    isDense: true,
                    items: const [
                      DropdownMenuItem(
                        value: 'Minggu ini',
                        child: Text(
                          'Minggu ini',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Semua waktu',
                        child: Text(
                          'Semua waktu',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedFilter = value;
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          _buildPodium(context),
          const SizedBox(height: 28),
          Text(
            'Semua Peringkat',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: primaryText,
            ),
          ),
          const SizedBox(height: 14),
          ...players.map(
            (player) => _buildPlayerTile(context, player),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF302B4A) : const Color(0xFFECE9FF),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.lightbulb_rounded,
                  color: purple,
                  size: 30,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Terus latihan dan jawab kuis untuk meningkatkan skormu!',
                    style: TextStyle(
                      color: primaryText,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // KARTU UTAMA
  Widget _buildHeroCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF8378FF),
            Color(0xFF5548D9),
            Color(0xFF30265F),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: purple.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          const Positioned(
            right: 0,
            top: 0,
            child: Icon(
              Icons.auto_awesome,
              color: Color(0x66FFFFFF),
              size: 42,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.bolt,
                      color: Color(0xFFFFD76A),
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'QUIZZY CHAMPIONS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Siapa yang paling jago?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Kumpulkan skor tertinggi dan jadilah juara Quizzy!',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  _heroInfo(
                    Icons.people_alt_rounded,
                    '${players.length}',
                    'Pemain',
                  ),
                  const SizedBox(width: 12),
                  _heroInfo(
                    Icons.quiz_rounded,
                    '${players.fold<int>(
                      0,
                      (sum, p) => sum + (p['played'] as int),
                    )}',
                    'Kuis dimainkan',
                  ),
                  const SizedBox(width: 12),
                  _heroInfo(
                    Icons.stars_rounded,
                    '${players.first['score']}',
                    'Skor tertinggi',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _heroInfo(
    IconData icon,
    String value,
    String label,
  ) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFFFFD76A),
            size: 22,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // KARTU STATISTIK
  Widget _buildStatistics(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBackground = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final primaryText = isDark ? Colors.white : darkPurple;
    final secondaryText = isDark ? Colors.white70 : Colors.grey;
    final borderColor = isDark ? Colors.white12 : Colors.grey.shade100;

    final averageScore =
        players.fold<int>(
          0,
          (sum, p) => sum + (p['score'] as int),
        ) /
        players.length;

    final totalPlayed = players.fold<int>(
      0,
      (sum, p) => sum + (p['played'] as int),
    );

    final averageAccuracy =
        players.fold<int>(
          0,
          (sum, p) => sum + (p['accuracy'] as int),
        ) /
        players.length;

    final stats = [
      {
        'title': 'Rata-rata skor',
        'value': averageScore.toStringAsFixed(1),
        'icon': Icons.analytics_rounded,
        'color': const Color(0xFF6C63FF),
      },
      {
        'title': 'Total pemain',
        'value': '${players.length}',
        'icon': Icons.groups_rounded,
        'color': const Color(0xFF16BFA1),
      },
      {
        'title': 'Total kuis',
        'value': '$totalPlayed',
        'icon': Icons.extension_rounded,
        'color': const Color(0xFFFFA94D),
      },
      {
        'title': 'Akurasi rata-rata',
        'value': '${averageAccuracy.toStringAsFixed(0)}%',
        'icon': Icons.track_changes_rounded,
        'color': const Color(0xFFEF6C9B),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.65,
      ),
      itemBuilder: (context, index) {
        final stat = stats[index];
        final color = stat['color'] as Color;

        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: cardBackground,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: borderColor,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.025),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                stat['icon'] as IconData,
                color: color,
                size: 25,
              ),
              Text(
                stat['value'] as String,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: primaryText,
                ),
              ),
              Text(
                stat['title'] as String,
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // PODIUM JUARA - DIPERBAIKI AGAR TIDAK OVERFLOW
  Widget _buildPodium(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryText = isDark ? Colors.white : darkPurple;
    final topThree = players.take(3).toList();
    final ordered = [
      topThree[1],
      topThree[0],
      topThree[2],
    ];

    final heights = [100.0, 135.0, 85.0];

    return SizedBox(
      height: 310,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(3, (index) {
          final player = ordered[index];
          final rank = player['rank'] as int;
          final isFirst = rank == 1;

          final color = rank == 1
              ? const Color(0xFFFFD76A)
              : rank == 2
                  ? const Color(0xFFCFD4E4)
                  : const Color(0xFFE9AD83);

          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  isFirst
                      ? Icons.workspace_premium_rounded
                      : Icons.military_tech_rounded,
                  color: color,
                  size: isFirst ? 32 : 27,
                ),
                const SizedBox(height: 5),

                // Avatar pemain
                Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isFirst
                        ? const Color(0xFFFFE8A3)
                        : const Color(0xFFEAE7FF),
                    border: Border.all(
                      color: color,
                      width: 3,
                    ),
                  ),
                  child: Text(
                    (player['name'] as String)
                        .split(' ')
                        .map((part) => part[0])
                        .take(2)
                        .join(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: primaryText,
                    ),
                  ),
                ),
                const SizedBox(height: 6),

                // Nama pemain
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  child: Text(
                    player['name'].toString().split(' ').first,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: primaryText,
                    ),
                  ),
                ),
                const SizedBox(height: 3),

                // Skor pemain
                Text(
                  '${player['score']} poin',
                  style: TextStyle(
                    fontSize: 11,
                    color: isDark ? Colors.white70 : Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

                // Balok podium
                Container(
                  width: double.infinity,
                  height: heights[index],
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color,
                        color.withValues(alpha: 0.65),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                  ),
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '$rank',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      color: primaryText,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // KARTU PEMAIN DI DAFTAR PERINGKAT
  Widget _buildPlayerTile(
    BuildContext context,
    Map<String, dynamic> player,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardBackground = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final primaryText = isDark ? Colors.white : darkPurple;
    final secondaryText = isDark ? Colors.white70 : Colors.grey;
    final borderColor = isDark ? Colors.white12 : Colors.grey.shade100;
    final rank = player['rank'] as int;
    final score = player['score'] as int;
    final isTopThree = rank <= 3;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isTopThree
              ? const Color(0xFFE5E0FF)
              : borderColor,
        ),
        boxShadow: [
          BoxShadow(
            color: purple.withValues(alpha: 0.035),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: rank == 1
                  ? const Color(0xFFFFF0C2)
                  : rank == 2
                      ? const Color(0xFFE9ECF5)
                      : rank == 3
                          ? const Color(0xFFFFE6D7)
                          : const Color(0xFFF1EFFF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              '$rank',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: rank <= 3 ? primaryText : purple,
              ),
            ),
          ),
          const SizedBox(width: 13),

          // Avatar
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  purple.withValues(alpha: 0.8),
                  const Color(0xFFB7AEFF),
                ],
              ),
            ),
            child: Text(
              (player['name'] as String)
                  .split(' ')
                  .map((part) => part[0])
                  .take(2)
                  .join(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Nama, progress skor, dan jumlah kuis
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  player['name'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: primaryText,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 7),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: (score / 100).clamp(0.0, 1.0),
                    minHeight: 6,
                    backgroundColor: isDark ? const Color(0xFF39354A) : const Color(0xFFEDEBFA),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      rank == 1
                          ? const Color(0xFFFFBD4A)
                          : purple,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${player['played']} kuis dimainkan',
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Skor
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.stars_rounded,
                    color: Color(0xFFFFB800),
                    size: 19,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '$score',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: primaryText,
                    ),
                  ),
                ],
              ),
              Text(
                'POIN',
                style: TextStyle(
                  fontSize: 9,
                  letterSpacing: 1,
                  color: secondaryText,
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