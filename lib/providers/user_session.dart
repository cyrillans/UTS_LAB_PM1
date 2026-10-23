
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSession extends ChangeNotifier {
  final Map<String, Map<String, String>> _accounts = {};

  String _userName = 'Quizzer';
  String _email = 'quizzer@email.com';

  bool _isLoggedIn = false;

  String get userName => _userName;
  String get email => _email;
  bool get isLoggedIn => _isLoggedIn;

  // Memuat akun dan sesi dari penyimpanan lokal.
  Future<bool> restoreSession() async {
    final prefs = await SharedPreferences.getInstance();

    final savedAccounts = prefs.getString('accounts');

    if (savedAccounts != null) {
      final decoded = jsonDecode(savedAccounts) as Map<String, dynamic>;

      _accounts
        ..clear()
        ..addAll(
          decoded.map(
            (key, value) => MapEntry(
              key,
              Map<String, String>.from(value as Map),
            ),
          ),
        );
    }

    final savedEmail = prefs.getString('currentEmail');
    final account = savedEmail == null ? null : _accounts[savedEmail];

    _isLoggedIn =
        prefs.getBool('isLoggedIn') == true && account != null;

    if (_isLoggedIn) {
      _email = savedEmail!;
      _userName = account!['name']!;
    }

    notifyListeners();
    return _isLoggedIn;
  }

  Future<void> _saveAccounts() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('accounts', jsonEncode(_accounts));
  }

  // Mendaftarkan akun baru.
  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();

    if (_accounts.containsKey(normalizedEmail)) {
      return false;
    }

    _accounts[normalizedEmail] = {
      'name': name.trim(),
      'password': password,
    };

    await _saveAccounts();
    return true;
  }

  // Memeriksa akun dan menyimpan sesi ketika login berhasil.
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();
    final account = _accounts[normalizedEmail];

    if (account == null || account['password'] != password) {
      return false;
    }

    _userName = account['name']!;
    _email = normalizedEmail;
    _isLoggedIn = true;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('currentEmail', _email);

    notifyListeners();
    return true;
  }

  // Keluar dari akun tanpa menghapus akun yang sudah terdaftar.
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('currentEmail');

    _isLoggedIn = false;
    notifyListeners();
  }

  // Memperbarui nama dan email pada profil.
  Future<void> updateProfile({
    required String userName,
    required String email,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();

    _userName = userName.trim();
    _email = normalizedEmail;

    final account = _accounts[normalizedEmail];

    if (account != null) {
      account['name'] = _userName;
      await _saveAccounts();
    }

    if (_isLoggedIn) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('currentEmail', _email);
    }

    notifyListeners();
  }
}
