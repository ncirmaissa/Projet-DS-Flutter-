import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../services/tunisian_recipes_service.dart';
import '../providers/language_provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_screen.dart';
import 'categories_screen.dart';
import 'ingredient_search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      await Future.delayed(Duration(milliseconds: 500));
      final recipes = TunisianRecipesService.getTunisianRecipes();
      setState(() {
        _recipes = recipes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(languageProvider.translate('tunisian_recipes')),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 64, color: Colors.red),
                      SizedBox(height: 16),
                      Text(
                        languageProvider.translate('error'),
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(_error!, textAlign: TextAlign.center),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadRecipes,
                        child: Text(languageProvider.translate('retry')),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoriesScreen(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.category, color: Colors.white, size: 18),
                              label: Text(
                                languageProvider.translate('categories'),
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        IngredientSearchScreen(),
                                  ),
                                );
                              },
                              icon: Icon(Icons.kitchen, color: Colors.white, size: 18),
                              label: Flexible(
                                child: Text(
                                  languageProvider.translate('search_by_ingredients'),
                                  style: TextStyle(color: Colors.white, fontSize: 11),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Liste des recettes
                    Expanded(
                      child: _recipes.isEmpty
                          ? Center(
                              child: Text(
                                languageProvider.translate('no_recipes'),
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          : RefreshIndicator(
                              onRefresh: _loadRecipes,
                              child: Padding(
                                padding: EdgeInsets.all(12),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
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
                                      isFavorite: favoritesProvider
                                          .isFavorite(recipe.id),
                                      onFavoriteToggle: () {
                                        favoritesProvider.toggleFavorite(recipe);
                                      },
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RecipeDetailScreen(
                                                    recipe: recipe),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
    );
  }
}
