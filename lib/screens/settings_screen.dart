import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/language_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(languageProvider.translate('settings')),
      ),
      body: ListView(
        children: [
          // Section Thème
          ListTile(
            leading: Icon(Icons.palette),
            title: Text(languageProvider.translate('theme')),
          ),
          SwitchListTile(
            secondary: Icon(
              themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            title: Text(
              themeProvider.isDarkMode
                  ? languageProvider.translate('dark_mode')
                  : languageProvider.translate('light_mode'),
            ),
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),
          Divider(),

          // Section Langue
          ListTile(
            leading: Icon(Icons.language),
            title: Text(languageProvider.translate('language')),
          ),
          ListTile(
            title: Text(languageProvider.translate('french')),
            leading: Radio<String>(
              value: 'fr',
              groupValue: languageProvider.languageCode,
              onChanged: (value) {
                if (value != null) {
                  languageProvider.changeLanguage(value);
                }
              },
            ),
            onTap: () => languageProvider.changeLanguage('fr'),
          ),
          ListTile(
            title: Text(languageProvider.translate('english')),
            leading: Radio<String>(
              value: 'en',
              groupValue: languageProvider.languageCode,
              onChanged: (value) {
                if (value != null) {
                  languageProvider.changeLanguage(value);
                }
              },
            ),
            onTap: () => languageProvider.changeLanguage('en'),
          ),
          ListTile(
            title: Text(languageProvider.translate('arabic')),
            leading: Radio<String>(
              value: 'ar',
              groupValue: languageProvider.languageCode,
              onChanged: (value) {
                if (value != null) {
                  languageProvider.changeLanguage(value);
                }
              },
            ),
            onTap: () => languageProvider.changeLanguage('ar'),
          ),
          Divider(),

          // Version
          ListTile(
            leading: Icon(Icons.info),
            title: Text(languageProvider.translate('app_version')),
            subtitle: Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}
