import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isLoggedIn = false;
  bool _isLoading = true;

  AuthProvider() {
    _checkLoginStatus();
  }

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  Future<void> _checkLoginStatus() async {
    _isLoading = true;
    notifyListeners();

    _isLoggedIn = await AuthService.isLoggedIn();
    if (_isLoggedIn) {
      _currentUser = await AuthService.getCurrentUser();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await AuthService.register(
      name: name,
      email: email,
      password: password,
    );

    if (result['success']) {
      _currentUser = result['user'];
      _isLoggedIn = true;
      notifyListeners();
    }

    return result;
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final result = await AuthService.login(
      email: email,
      password: password,
    );

    if (result['success']) {
      _currentUser = result['user'];
      _isLoggedIn = true;
      notifyListeners();
    }

    return result;
  }

  Future<void> logout() async {
    await AuthService.logout();
    _currentUser = null;
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<bool> updateProfile({
    required String name,
    String? photoUrl,
  }) async {
    final success = await AuthService.updateProfile(
      name: name,
      photoUrl: photoUrl,
    );

    if (success) {
      _currentUser = await AuthService.getCurrentUser();
      notifyListeners();
    }

    return success;
  }
}
