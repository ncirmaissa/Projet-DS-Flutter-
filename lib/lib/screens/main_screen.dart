import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  Key _homeKey = UniqueKey();

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen(key: _homeKey);
      case 1:
        return SearchScreen();
      case 2:
        return FavoritesScreen();
      case 3:
        return ProfileScreen(
          onRecipeCreated: () {
            setState(() {
              _homeKey = UniqueKey();
            });
          },
        );
      default:
        return HomeScreen(key: _homeKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      body: _getScreen(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: languageProvider.translate('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: languageProvider.translate('search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: languageProvider.translate('favorites'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: languageProvider.translate('profile'),
          ),
        ],
      ),
    );
  }
}
