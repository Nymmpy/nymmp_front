import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthNotifier extends ChangeNotifier {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  String? _jwtToken;

  AuthNotifier() {
    _loadToken();
  }

  String? get jwtToken => _jwtToken;

  Future<void> _loadToken() async {
    _jwtToken = await _storage.read(key: 'jwtToken');
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    _jwtToken = token;
    await _storage.write(key: 'jwtToken', value: token);
    notifyListeners();
  }

  Future<void> clearToken() async {
    _jwtToken = null;
    await _storage.delete(key: 'jwtToken');
    notifyListeners();
  }
}
