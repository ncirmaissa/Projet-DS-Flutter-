import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/language_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/favorites_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/main_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Chef\'s Book',
            theme: themeProvider.currentTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(isLoggedIn: false),
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/login':
                  return MaterialPageRoute(builder: (_) => const LoginScreen());
                case '/register':
                  return MaterialPageRoute(builder: (_) => const RegisterScreen());
                case '/main':
                  return MaterialPageRoute(builder: (_) => const MainScreen());
                case '/settings':
                  return MaterialPageRoute(builder: (_) => const SettingsScreen());
                default:
                  return MaterialPageRoute(
                    builder: (_) => const SplashScreen(isLoggedIn: false),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
