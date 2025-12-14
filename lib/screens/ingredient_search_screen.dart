import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/recipe.dart';
import '../services/tunisian_recipes_service.dart';
import '../providers/language_provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_screen.dart';

class IngredientSearchScreen extends StatefulWidget {
  const IngredientSearchScreen({super.key});

  @override
  State<IngredientSearchScreen> createState() => _IngredientSearchScreenState();
}

class _IngredientSearchScreenState extends State<IngredientSearchScreen> {
  final _ingredientController = TextEditingController();
  final List<String> _selectedIngredients = [];
  List<Recipe> _searchResults = [];
  bool _isSearching = false;
  bool _hasSearched = false;

  @override
  void dispose() {
    _ingredientController.dispose();
    super.dispose();
  }

  void _addIngredient() {
    final ingredient = _ingredientController.text.trim();
    if (ingredient.isNotEmpty && !_selectedIngredients.contains(ingredient)) {
      setState(() {
        _selectedIngredients.add(ingredient);
        _ingredientController.clear();
      });
    }
  }

  void _removeIngredient(String ingredient) {
    setState(() {
      _selectedIngredients.remove(ingredient);
    });
  }

  Future<void> _performSearch() async {
    if (_selectedIngredients.isEmpty) return;

    setState(() {
      _isSearching = true;
      _hasSearched = true;
    });

    await Future.delayed(Duration(milliseconds: 500));
    
    final results = TunisianRecipesService.searchByIngredients(_selectedIngredients);
    
    setState(() {
      _searchResults = results;
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(languageProvider.translate('search_by_ingredients')),
      ),
      body: Column(
        children: [
          // Zone de saisie des ingrédients
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _ingredientController,
                        decoration: InputDecoration(
                          hintText: languageProvider.translate('add_ingredient'),
                          prefixIcon: Icon(Icons.add),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onSubmitted: (_) => _addIngredient(),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _addIngredient,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Liste des ingrédients sélectionnés
                if (_selectedIngredients.isNotEmpty)
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _selectedIngredients.map((ingredient) {
                      return Chip(
                        label: Text(ingredient),
                        deleteIcon: Icon(Icons.close, size: 18),
                        onDeleted: () => _removeIngredient(ingredient),
                        backgroundColor: Colors.orange.shade100,
                      );
                    }).toList(),
                  ),

                if (_selectedIngredients.isNotEmpty) SizedBox(height: 16),

                // Bouton de recherche
                if (_selectedIngredients.isNotEmpty)
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _performSearch,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        languageProvider.translate('search_recipes'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Divider(),

          // Résultats
          Expanded(
            child: _isSearching
                ? Center(child: CircularProgressIndicator())
                : !_hasSearched
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.kitchen, size: 64, color: Colors.grey),
                            SizedBox(height: 16),
                            Text(
                              languageProvider.translate('add_ingredients_to_search'),
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : _searchResults.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.search_off, size: 64, color: Colors.grey),
                                SizedBox(height: 16),
                                Text(
                                  languageProvider.translate('no_results'),
                                  style: TextStyle(fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(12),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              itemCount: _searchResults.length,
                              itemBuilder: (context, index) {
                                final recipe = _searchResults[index];
                                return RecipeCard(
                                  recipe: recipe,
                                  showFavoriteButton: true,
                                  isFavorite:
                                      favoritesProvider.isFavorite(recipe.id),
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
          ),
        ],
      ),
    );
  }
}
