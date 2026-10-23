
import 'package:flutter/foundation.dart';

class UserSession extends ChangeNotifier {
  // Data akun yang terdaftar sementara.
  final Map<String, Map<String, String>> _accounts = {};

  String _userName = 'Quizzer';
  String _email = 'quizzer@email.com';

  String get userName => _userName;
  String get email => _email;

  // Mendaftarkan akun baru.
  bool register({
    required String name,
    required String email,
    required String password,
  }) {
    final normalizedEmail = email.trim().toLowerCase();

    if (_accounts.containsKey(normalizedEmail)) {
      return false;
    }

    _accounts[normalizedEmail] = {
      'name': name.trim(),
      'password': password,
    };

    return true;
  }

  // Memeriksa email dan password ketika login.
  bool login({
    required String email,
    required String password,
  }) {
    final normalizedEmail = email.trim().toLowerCase();
    final account = _accounts[normalizedEmail];

    if (account == null || account['password'] != password) {
      return false;
    }

    _userName = account['name']!;
    _email = normalizedEmail;

    notifyListeners();
    return true;
  }

  // Memperbarui nama dan email pada profil.
  void updateProfile({
    required String userName,
    required String email,
  }) {
    final normalizedEmail = email.trim().toLowerCase();

    _userName = userName.trim();
    _email = normalizedEmail;

    // Perbarui akun yang sedang digunakan jika tersedia.
    final account = _accounts[normalizedEmail];
    if (account != null) {
      account['name'] = _userName;
    }

    notifyListeners();
  }
}
