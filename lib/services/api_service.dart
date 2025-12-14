import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';

class ApiService {
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  static Future<List<Recipe>> searchRecipes(String query) async {
    try {
      final url = Uri.parse('$baseUrl/search.php?s=$query');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        if (data['meals'] != null) {
          List<Recipe> recipes = (data['meals'] as List)
              .map((meal) => Recipe.fromJson(meal))
              .toList();
          return recipes;
        } else {
          return [];
        }
      } else {
        throw Exception('Erreur HTTP : ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erreur lors de la recherche : $e');
      throw Exception('Impossible de charger les recettes');
    }
  }

  static Future<List<Recipe>> getPopularRecipes() async {
    return searchRecipes('chicken');
  }

  static Future<Recipe> getRecipeById(String id) async {
    try {
      final url = Uri.parse('$baseUrl/lookup.php?i=$id');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['meals'] != null && data['meals'].isNotEmpty) {
          return Recipe.fromJson(data['meals'][0]);
        } else {
          throw Exception('Recette non trouvée');
        }
      } else {
        throw Exception('Erreur HTTP : ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erreur lors de la récupération : $e');
      throw Exception('Impossible de charger la recette');
    }
  }

  static Future<List<Recipe>> getRecipesByCategory(String category) async {
    return searchRecipes(category);
  }

  static Future<List<String>> getCategories() async {
    try {
      final url = Uri.parse('$baseUrl/categories.php');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['categories'] != null) {
          List<String> categories = (data['categories'] as List)
              .map((cat) => cat['strCategory'] as String)
              .toList();
          return categories;
        } else {
          return [];
        }
      } else {
        throw Exception('Erreur HTTP : ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erreur lors de la récupération des catégories : $e');
      return ['Chicken', 'Beef', 'Dessert', 'Vegetarian', 'Seafood'];
    }
  }
}
