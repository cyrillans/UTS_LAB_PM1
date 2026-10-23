import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  final List<Map<String, dynamic>> players = const [
    {
      'rank': 1,
      'name': 'Alya Putri',
      'score': 98,
    },
    {
      'rank': 2,
      'name': 'Rizky Pratama',
      'score': 95,
    },
    {
      'rank': 3,
      'name': 'Nadia Salsabila',
      'score': 92,
    },
    {
      'rank': 4,
      'name': 'Fajar Ramadhan',
      'score': 89,
    },
    {
      'rank': 5,
      'name': 'Citra Amelia',
      'score': 87,
    },
    {
      'rank': 6,
      'name': 'Dimas Saputra',
      'score': 84,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Peringkat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06,
          vertical: size.height * 0.02,
        ),
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];

          return Container(
            margin: const EdgeInsets.only(
              bottom: 12,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(18),
              border: Border.all(
                color: Colors.grey.shade200,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: index == 0
                        ? const Color(0xFFFFF1C7)
                        : const Color(0xFFF1F0FF),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${player['rank']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: index == 0
                          ? const Color(0xFFD99A00)
                          : const Color(0xFF6C63FF),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Text(
                    player['name'],
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
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${player['score']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}