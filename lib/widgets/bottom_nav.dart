
import 'package:flutter/material.dart';
import '../routes/routes_app.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({
    super.key,
    required this.currentIndex,
  });

  static const Color purple = Color(0xFF6C63FF);

  void _onTap(BuildContext context, int index) {
    if (index == currentIndex) return;

    final routes = [
      AppRoutes.home,
      AppRoutes.quiz,
      AppRoutes.leaderboard,
      AppRoutes.profile,
    ];

    Navigator.pushNamedAndRemoveUntil(
      context,
      routes[index],
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final backgroundColor = theme.colorScheme.surface;
    final inactiveColor = isDark
        ? Colors.grey.shade400
        : Colors.grey.shade600;

    const items = [
      (icon: Icons.home_rounded, label: 'Home'),
      (icon: Icons.quiz_rounded, label: 'Quiz'),
      (icon: Icons.leaderboard_rounded, label: 'Peringkat'),
      (icon: Icons.person_rounded, label: 'Profil'),
    ];

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border(
          top: BorderSide(
            color: theme.dividerColor.withOpacity(0.2),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.15 : 0.06),
            blurRadius: 15,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          child: Row(
            children: List.generate(items.length, (index) {
              final item = items[index];
              final selected = index == currentIndex;

              return Expanded(
                child: InkWell(
                  onTap: () => _onTap(context, index),
                  borderRadius: BorderRadius.circular(16),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      vertical: 9,
                      horizontal: 2,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? purple.withOpacity(isDark ? 0.20 : 0.10)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item.icon,
                          size: 24,
                          color: selected ? purple : inactiveColor,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: selected
                                ? FontWeight.w800
                                : FontWeight.w500,
                            color: selected ? purple : inactiveColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
