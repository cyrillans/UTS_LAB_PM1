
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../providers/user_session.dart';
import '../screens/edit_profile_screen.dart';
import '../widgets/bottom_nav.dart';
import '../routes/routes_app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const Color purple = Color(0xFF6C63FF);

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showThemeSettings(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pengaturan Tema',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.light_mode_outlined),
                  title: const Text('Light Mode'),
                  onTap: () {
                    themeProvider.setTheme(ThemeMode.light);
                    Navigator.pop(sheetContext);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.dark_mode_outlined),
                  title: const Text('Dark Mode'),
                  onTap: () {
                    themeProvider.setTheme(ThemeMode.dark);
                    Navigator.pop(sheetContext);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings_brightness_outlined),
                  title: const Text('Ikuti Sistem'),
                  onTap: () {
                    themeProvider.setTheme(ThemeMode.system);
                    Navigator.pop(sheetContext);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // KARTU PROFIL
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: theme.dividerColor.withOpacity(0.15),
                  ),
                ),
                child: Consumer<UserSession>(
                  builder: (context, session, child) {
                    return Column(
                      children: [
                        Container(
                          width: 88,
                          height: 88,
                          decoration: BoxDecoration(
                            color: purple.withOpacity(0.12),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: purple.withOpacity(0.35),
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.person_rounded,
                            size: 48,
                            color: purple,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          session.userName,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          session.email,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface
                                .withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 18),
                        OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EditProfileScreen(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit_outlined, size: 18),
                          label: const Text('Edit Profil'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: purple,
                            side: const BorderSide(color: purple),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // PILIHAN TEMA LANGSUNG
              Text(
                'Tampilan Aplikasi',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  final selectedTheme = themeProvider.themeMode;

                  return Row(
                    children: [
                      Expanded(
                        child: _ThemeOption(
                          title: 'Light Mode',
                          icon: Icons.light_mode_rounded,
                          selected: selectedTheme == ThemeMode.light,
                          onTap: () {
                            themeProvider.setTheme(ThemeMode.light);
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _ThemeOption(
                          title: 'Dark Mode',
                          icon: Icons.dark_mode_rounded,
                          selected: selectedTheme == ThemeMode.dark,
                          onTap: () {
                            themeProvider.setTheme(ThemeMode.dark);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 24),

              // STATISTIK
              Text(
                'Statistik Kuis',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Expanded(
                    child: _ProfileStat(
                      icon: Icons.quiz_outlined,
                      value: '0',
                      label: 'Kuis',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _ProfileStat(
                      icon: Icons.stars_rounded,
                      value: '0',
                      label: 'Skor',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: _ProfileStat(
                      icon: Icons.emoji_events_outlined,
                      value: '-',
                      label: 'Peringkat',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // MOTIVASI
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF6C63FF),
                      Color(0xFF9A70FF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      color: Colors.white,
                      size: 34,
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Terus Belajar!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Setiap kuis adalah kesempatan untuk menambah pengetahuan.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // MENU
              Text(
                'Pengaturan Akun',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              _ProfileMenu(
                icon: Icons.person_outline_rounded,
                title: 'Edit Profile',
                subtitle: 'Ubah nama dan email',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(),
                    ),
                  );
                },
              ),

              _ProfileMenu(
                icon: Icons.history_rounded,
                title: 'Riwayat Kuis',
                subtitle: 'Lihat aktivitas kuis',
                onTap: () {
                  _showMessage(
                    context,
                    'Fitur riwayat kuis belum tersedia.',
                  );
                },
              ),

              _ProfileMenu(
                icon: Icons.tune_rounded,
                title: 'Pengaturan',
                subtitle: 'Atur preferensi aplikasi',
                onTap: () => _showThemeSettings(context),
              ),

              _ProfileMenu(
                icon: Icons.info_outline_rounded,
                title: 'Tentang Quizzy',
                subtitle: 'Informasi aplikasi',
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: 'Quizzy',
                    applicationVersion: '1.0.0',
                    applicationIcon: const Icon(
                      Icons.quiz_rounded,
                      color: purple,
                      size: 36,
                    ),
                    children: const [
                      Text(
                        'Quizzy adalah aplikasi kuis untuk belajar '
                        'dan menguji pengetahuan dengan cara yang menyenangkan.',
                      ),
                    ],
                  );
                },
              ),

              _ProfileMenu(
                icon: Icons.logout_rounded,
                title: 'Keluar',
                subtitle: 'Kembali ke halaman awal',
                iconColor: Colors.redAccent,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return AlertDialog(
                        title: const Text('Keluar dari Quizzy?'),
                        content: const Text(
                          'Kamu akan kembali ke halaman awal aplikasi.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },
                            child: const Text('Batal'),
                          ),
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.login,
                                (route) => false,
                              );
                            },
                            child: const Text('Keluar'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Quizzy v1.0.0',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.45),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 3),
    );
  }
}

// KOMPONEN PILIHAN TEMA
class _ThemeOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ThemeOption({
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF6C63FF).withOpacity(0.12)
              : theme.cardColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: selected
                ? const Color(0xFF6C63FF)
                : theme.dividerColor.withOpacity(0.25),
            width: selected ? 1.8 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: selected
                  ? const Color(0xFF6C63FF)
                  : theme.colorScheme.onSurface.withOpacity(0.65),
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: selected
                    ? const Color(0xFF6C63FF)
                    : theme.colorScheme.onSurface,
              ),
            ),
            if (selected) ...[
              const SizedBox(height: 5),
              const Icon(
                Icons.check_circle_rounded,
                size: 17,
                color: Color(0xFF6C63FF),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// KOMPONEN STATISTIK
class _ProfileStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _ProfileStat({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 6,
      ),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: theme.dividerColor.withOpacity(0.18),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF6C63FF),
            size: 25,
          ),
          const SizedBox(height: 9),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

// KOMPONEN MENU PROFIL
class _ProfileMenu extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? iconColor;
  final VoidCallback onTap;

  const _ProfileMenu({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      color: theme.cardColor,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.dividerColor.withOpacity(0.16),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 5,
        ),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: (iconColor ?? const Color(0xFF6C63FF))
                .withOpacity(0.12),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(
            icon,
            color: iconColor ?? const Color(0xFF6C63FF),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: onTap,
      ),
    );
  }
}
