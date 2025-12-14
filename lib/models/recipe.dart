class Recipe {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnail;
  final List<String> ingredients;
  final List<String> measures;

  Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
    required this.ingredients,
    required this.measures,
  });

  // Créer un Recipe depuis JSON (API TheMealDB)
  factory Recipe.fromJson(Map<String, dynamic> json) {
    // Extraire les ingrédients et mesures (jusqu'à 20 possibles dans l'API)
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      String? ingredient = json['strIngredient$i'];
      String? measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? '');
      }
    }

    return Recipe(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? 'Unknown',
      category: json['strCategory'] ?? 'Unknown',
      area: json['strArea'] ?? 'Unknown',
      instructions: json['strInstructions'] ?? 'No instructions available',
      thumbnail: json['strMealThumb'] ?? '',
      ingredients: ingredients,
      measures: measures,
    );
  }

  // Convertir un Recipe en JSON (pour sauvegarde locale)
  Map<String, dynamic> toJson() {
    return {
      'idMeal': id,
      'strMeal': name,
      'strCategory': category,
      'strArea': area,
      'strInstructions': instructions,
      'strMealThumb': thumbnail,
      'strIngredient1': ingredients.isNotEmpty ? ingredients[0] : null,
      'strMeasure1': measures.isNotEmpty ? measures[0] : null,
    };
  }
}
