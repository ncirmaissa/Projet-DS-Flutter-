import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  static const String _keyIsLoggedIn = 'isLoggedIn';
  static const String _keyCurrentUser = 'currentUser';
  static const String _keyUsers = 'users';

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  static Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_keyCurrentUser);
    
    if (userJson != null) {
      return User.fromJson(json.decode(userJson));
    }
    return null;
  }

  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      final usersJson = prefs.getString(_keyUsers);
      List<Map<String, dynamic>> users = [];
      
      if (usersJson != null) {
        users = List<Map<String, dynamic>>.from(json.decode(usersJson));
      }

      bool emailExists = users.any((user) => user['email'] == email);
      if (emailExists) {
        return {
          'success': false,
          'message': 'Cet email est déjà utilisé',
        };
      }

      final newUser = {
        'id': DateTime.now().millisecondsSinceEpoch.toString(),
        'name': name,
        'email': email,
        'password': password,
        'photoUrl': null,
      };

      users.add(newUser);
      await prefs.setString(_keyUsers, json.encode(users));

      final user = User.fromJson(newUser);
      await _saveUserSession(user);

      return {
        'success': true,
        'message': 'Compte créé avec succès',
        'user': user,
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Erreur lors de l\'inscription : $e',
      };
    }
  }

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      final usersJson = prefs.getString(_keyUsers);
      
      if (usersJson == null) {
        return {
          'success': false,
          'message': 'Aucun compte trouvé',
        };
      }

      List<Map<String, dynamic>> users = 
          List<Map<String, dynamic>>.from(json.decode(usersJson));

      final userMap = users.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => {},
      );

      if (userMap.isEmpty) {
        return {
          'success': false,
          'message': 'Email ou mot de passe incorrect',
        };
      }

      final user = User.fromJson(userMap);
      await _saveUserSession(user);

      return {
        'success': true,
        'message': 'Connexion réussie',
        'user': user,
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Erreur lors de la connexion : $e',
      };
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, false);
    await prefs.remove(_keyCurrentUser);
  }

  static Future<void> _saveUserSession(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, true);
    await prefs.setString(_keyCurrentUser, json.encode(user.toJson()));
  }

  static Future<bool> updateProfile({
    required String name,
    String? photoUrl,
  }) async {
    try {
      final user = await getCurrentUser();
      if (user == null) return false;

      final updatedUser = User(
        id: user.id,
        name: name,
        email: user.email,
        photoUrl: photoUrl ?? user.photoUrl,
      );

      await _saveUserSession(updatedUser);
      return true;
    } catch (e) {
      return false;
    }
  }
}
