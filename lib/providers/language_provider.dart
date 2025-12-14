import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/translations.dart';

class LanguageProvider extends ChangeNotifier {
  String _languageCode = 'fr'; // Langue par défaut : français

  LanguageProvider() {
    _loadLanguagePreference();
  }

  String get languageCode => _languageCode;

  Locale get currentLocale => Locale(_languageCode);

  bool get isRTL => _languageCode == 'ar'; // Right-to-left pour l'arabe

  // Charger la préférence de langue depuis le stockage local
  Future<void> _loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _languageCode = prefs.getString('languageCode') ?? 'fr';
    notifyListeners();
  }

  // Changer la langue
  Future<void> changeLanguage(String newLanguageCode) async {
    if (_languageCode != newLanguageCode) {
      _languageCode = newLanguageCode;
      
      // Sauvegarder la préférence
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('languageCode', newLanguageCode);
      
      notifyListeners();
    }
  }

  // Méthode de traduction
  String translate(String key) {
    return Translations.translate(key, _languageCode);
  }
}
