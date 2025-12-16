import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/recipe.dart';

class FavoritesProvider extends ChangeNotifier {
  List<Recipe> _favorites = [];

  FavoritesProvider() {
    _loadFavorites();
  }

  List<Recipe> get favorites => _favorites;

  // Charger les favoris depuis le stockage local
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');

    if (favoritesJson != null) {
      final List<dynamic> decoded = json.decode(favoritesJson);
      _favorites = decoded.map((item) => Recipe.fromJson(item)).toList();
      notifyListeners();
    }
  }

  // Sauvegarder les favoris dans le stockage local
  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = json.encode(
      _favorites.map((recipe) => recipe.toJson()).toList(),
    );
    await prefs.setString('favorites', favoritesJson);
  }

  // Vérifier si une recette est dans les favoris
  bool isFavorite(String recipeId) {
    return _favorites.any((recipe) => recipe.id == recipeId);
  }

  // Ajouter une recette aux favoris
  Future<void> addFavorite(Recipe recipe) async {
    if (!isFavorite(recipe.id)) {
      _favorites.add(recipe);
      await _saveFavorites();
      notifyListeners();
    }
  }

  // Retirer une recette des favoris
  Future<void> removeFavorite(String recipeId) async {
    _favorites.removeWhere((recipe) => recipe.id == recipeId);
    await _saveFavorites();
    notifyListeners();
  }

  // Basculer le statut favori d'une recette
  Future<void> toggleFavorite(Recipe recipe) async {
    if (isFavorite(recipe.id)) {
      await removeFavorite(recipe.id);
    } else {
      await addFavorite(recipe);
    }
  }

  // Obtenir le nombre de favoris
  int get favoritesCount => _favorites.length;
}
