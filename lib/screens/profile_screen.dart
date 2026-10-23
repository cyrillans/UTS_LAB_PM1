import 'package:flutter/material.dart';
import '../routes/routes_app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.025,
          ),
          child: Column(
            children: [
              // =========================
              // PROFILE PHOTO
              // =========================
              Container(
                width: size.width * 0.28,
                height: size.width * 0.28,
                decoration: const BoxDecoration(
                  color: Color(0xFFE8E5FF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person_rounded,
                  size: size.width * 0.15,
                  color: const Color(0xFF6C63FF),
                ),
              ),

              const SizedBox(height: 16),

              // =========================
              // NAME
              // =========================
              Text(
                'Quizzer',
                style: TextStyle(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              // =========================
              // EMAIL
              // =========================
              Text(
                'quizzer@email.com',
                style: TextStyle(
                  fontSize: size.width * 0.035,
                  color: Colors.grey.shade600,
                ),
              ),

              SizedBox(
                height: size.height * 0.035,
              ),

              // =========================
              // PROFILE STATISTICS
              // =========================
              Row(
                children: [
                  Expanded(
                    child: _ProfileStat(
                      value: '0',
                      label: 'Quiz',
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _ProfileStat(
                      value: '0',
                      label: 'Score',
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _ProfileStat(
                      value: '0',
                      label: 'Rank',
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: size.height * 0.035,
              ),

              // =========================
              // PROFILE MENU
              // =========================
              _ProfileMenu(
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () {},
              ),

              _ProfileMenu(
                icon: Icons.history_rounded,
                title: 'Quiz History',
                onTap: () {},
              ),

              _ProfileMenu(
                icon: Icons.settings_outlined,
                title: 'Settings',
                onTap: () {},
              ),

              _ProfileMenu(
                icon: Icons.info_outline,
                title: 'About Quizzy',
                onTap: () {},
              ),

              const SizedBox(height: 10),

              // =========================
              // LOGOUT
              // =========================
              _ProfileMenu(
                icon: Icons.logout_rounded,
                title: 'Logout',
                color: Colors.red,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutes.login,
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// PROFILE STAT
// =====================================================

class _ProfileStat extends StatelessWidget {
  final String value;
  final String label;

  const _ProfileStat({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// PROFILE MENU
// =====================================================

class _ProfileMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? color;

  const _ProfileMenu({
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final itemColor = color ?? Colors.black87;

    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        onTap: onTap,

        leading: Icon(
          icon,
          color: color ?? const Color(0xFF6C63FF),
        ),

        title: Text(
          title,
          style: TextStyle(
            color: itemColor,
            fontWeight: FontWeight.w600,
          ),
        ),

        trailing: Icon(
          Icons.chevron_right_rounded,
          color: Colors.grey.shade400,
        ),
      ),
    );
  }
}