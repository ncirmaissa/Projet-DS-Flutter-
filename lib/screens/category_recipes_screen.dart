import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../services/tunisian_recipes_service.dart';
import '../providers/language_provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_screen.dart';

class CategoryRecipesScreen extends StatefulWidget {
  final String categoryName;
  final String categoryValue;

  const CategoryRecipesScreen({
    super.key,
    required this.categoryName,
    required this.categoryValue,
  });

  @override
  State<CategoryRecipesScreen> createState() => _CategoryRecipesScreenState();
}

class _CategoryRecipesScreenState extends State<CategoryRecipesScreen> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(milliseconds: 500));
    
    final recipes = TunisianRecipesService.getRecipesByCategory(widget.categoryValue);
    
    setState(() {
      _recipes = recipes;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _recipes.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        languageProvider.translate('no_recipes'),
                        style: TextStyle(fontSize: 16, color: Colors.grey),
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
                    itemCount: _recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = _recipes[index];
                      return RecipeCard(
                        recipe: recipe,
                        showFavoriteButton: true,
                        isFavorite: favoritesProvider.isFavorite(recipe.id),
                        onFavoriteToggle: () {
                          favoritesProvider.toggleFavorite(recipe);
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
