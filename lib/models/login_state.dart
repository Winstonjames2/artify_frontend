import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginState with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoggedIn = false;
  String? _token;

  bool get isLoggedIn => _isLoggedIn;
  String? get token => _token;

  // Check if the user is logged in
  Future<void> checkLoginStatus() async {
    _token = await _authService.getToken();
    _isLoggedIn = _token != null;
    notifyListeners();
  }

  // Log the user in
  Future<void> login(String token) async {
    _token = token;
    _isLoggedIn = true;
    await _authService.saveToken(token);
    notifyListeners();
  }

  // Log the user out
  Future<void> logout() async {
    _token = null;
    _isLoggedIn = false;
    await _authService.deleteToken();
    notifyListeners();
  }
}
