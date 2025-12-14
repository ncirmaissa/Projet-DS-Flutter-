import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(languageProvider.translate('favorites')),
      ),
      body: favoritesProvider.favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Text(
                    languageProvider.translate('no_favorites'),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.all(12),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: favoritesProvider.favorites.length,
                itemBuilder: (context, index) {
                  final recipe = favoritesProvider.favorites[index];
                  return RecipeCard(
                    recipe: recipe,
                    showFavoriteButton: true,
                    isFavorite: true,
                    onFavoriteToggle: () {
                      favoritesProvider.removeFavorite(recipe.id);
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailScreen(recipe: recipe),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}
