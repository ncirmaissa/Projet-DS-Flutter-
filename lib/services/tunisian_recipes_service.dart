import '../models/recipe.dart';
import 'package:flutter/foundation.dart';

class TunisianRecipesService {
  // Recettes tunisiennes traditionnelles élargies
  static List<Recipe> getTunisianRecipes() {
    return [
      Recipe(
        id: 'tn001',
        name: 'Couscous Tunisien',
        category: 'Traditionnel Tunisien',
        area: 'Tunisie',
        instructions: '''
1. Laver et couper les légumes (carottes, navets, courgettes, pommes de terre).
2. Dans une marmite, faire revenir la viande (agneau ou poulet) avec de l'huile d'olive.
3. Ajouter les oignons, l'ail, les épices (cumin, coriandre, harissa) et faire revenir.
4. Ajouter les légumes et couvrir d'eau. Laisser mijoter 45 minutes.
5. Ajouter les pois chiches et les courgettes. Cuire 15 minutes.
6. Préparer la semoule dans un couscoussier à la vapeur.
7. Servir la semoule avec le bouillon et les légumes. Ajouter la harissa selon le goût.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Semoule',
          'Viande d\'agneau',
          'Carottes',
          'Navets',
          'Courgettes',
          'Pois chiches',
          'Oignons',
          'Harissa',
          'Cumin',
          'Huile d\'olive'
        ],
        measures: [
          '500g',
          '500g',
          '3 pièces',
          '2 pièces',
          '2 pièces',
          '200g',
          '2 pièces',
          '2 cuillères',
          '1 cuillère',
          '3 cuillères'
        ],
      ),
      Recipe(
        id: 'tn002',
        name: 'Brik à l\'œuf',
        category: 'Traditionnel Tunisien',
        area: 'Tunisie',
        instructions: '''
1. Préparer la farce : écraser le thon, ajouter les câpres, le persil haché, l'oignon et l'harissa.
2. Poser une feuille de brick à plat.
3. Placer la farce au centre, puis casser un œuf dessus.
4. Plier la feuille en triangle en veillant à ne pas casser l'œuf.
5. Faire frire dans l'huile chaude jusqu'à ce que la brik soit dorée et croustillante.
6. Servir chaud avec des quartiers de citron.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Feuilles de brick',
          'Œufs',
          'Thon',
          'Câpres',
          'Persil',
          'Oignons',
          'Harissa',
          'Huile de friture'
        ],
        measures: [
          '4 feuilles',
          '4 pièces',
          '1 boîte',
          '2 cuillères',
          '1 bouquet',
          '1 pièce',
          '1 cuillère',
          '500ml'
        ],
      ),
      Recipe(
        id: 'tn003',
        name: 'Lablabi',
        category: 'Traditionnel Tunisien',
        area: 'Tunisie',
        instructions: '''
1. Faire cuire les pois chiches dans de l'eau salée avec du cumin pendant 1h30.
2. Dans des assiettes creuses, émietter du pain rassis.
3. Ajouter l'ail écrabouillé, le cumin, l'harissa et l'huile d'olive.
4. Verser les pois chiches chauds avec leur bouillon sur le pain.
5. Ajouter un œuf mollet sur chaque assiette.
6. Servir avec des quartiers de citron, des câpres et de l'harissa à côté.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Pois chiches',
          'Pain rassis',
          'Œufs',
          'Ail',
          'Cumin',
          'Harissa',
          'Huile d\'olive',
          'Citron',
          'Câpres'
        ],
        measures: [
          '500g',
          '4 tranches',
          '4 pièces',
          '4 gousses',
          '2 cuillères',
          '2 cuillères',
          '4 cuillères',
          '1 pièce',
          '2 cuillères'
        ],
      ),
      Recipe(
        id: 'tn004',
        name: 'Makroudh',
        category: 'Sucré',
        area: 'Tunisie',
        instructions: '''
1. Préparer la pâte : mélanger la semoule fine, l'huile, l'eau de fleur d'oranger et un peu d'eau.
2. Pétrir jusqu'à obtenir une pâte lisse. Laisser reposer 30 minutes.
3. Préparer la farce : mélanger les dattes hachées avec un peu de cannelle.
4. Former des boudins avec la pâte, les farcir avec les dattes, puis les refermer.
5. Découper en losanges et faire des motifs avec une fourchette.
6. Frire dans l'huile chaude jusqu'à coloration dorée.
7. Plonger immédiatement dans du miel chaud, puis égoutter.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Semoule fine',
          'Dattes',
          'Huile',
          'Eau de fleur d\'oranger',
          'Cannelle',
          'Miel',
          'Huile de friture'
        ],
        measures: [
          '500g',
          '300g',
          '100ml',
          '2 cuillères',
          '1 cuillère',
          '200g',
          '500ml'
        ],
      ),
      Recipe(
        id: 'tn005',
        name: 'Ojja aux Merguez',
        category: 'Salé',
        area: 'Tunisie',
        instructions: '''
1. Dans une poêle, faire revenir les merguez coupées en rondelles.
2. Ajouter l'oignon haché, l'ail, les tomates et les poivrons coupés.
3. Assaisonner avec la harissa, le cumin, le paprika, sel et poivre.
4. Laisser mijoter 20 minutes jusqu'à épaississement de la sauce.
5. Casser les œufs directement dans la poêle sur la préparation.
6. Couvrir et laisser cuire jusqu'à ce que les œufs soient cuits.
7. Servir chaud avec du pain.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Merguez',
          'Œufs',
          'Tomates',
          'Poivrons',
          'Oignons',
          'Ail',
          'Harissa',
          'Cumin',
          'Paprika'
        ],
        measures: [
          '6 pièces',
          '4 pièces',
          '4 pièces',
          '2 pièces',
          '1 pièce',
          '3 gousses',
          '2 cuillères',
          '1 cuillère',
          '1 cuillère'
        ],
      ),
      Recipe(
        id: 'tn006',
        name: 'Fricassé Tunisien',
        category: 'Traditionnel Tunisien',
        area: 'Tunisie',
        instructions: '''
1. Préparer la pâte avec farine, levure, sel et eau tiède. Laisser lever 2h.
2. Former des boules et les aplatir légèrement.
3. Faire frire dans l'huile chaude jusqu'à gonflement et coloration dorée.
4. Ouvrir en deux et garnir de thon, harissa, olives, câpres, pommes de terre et œuf dur.
5. Ajouter de l'huile d'olive et du citron.
6. Servir immédiatement bien chaud.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Farine',
          'Levure',
          'Thon',
          'Œufs durs',
          'Pommes de terre',
          'Harissa',
          'Olives',
          'Câpres',
          'Huile d\'olive'
        ],
        measures: [
          '500g',
          '10g',
          '2 boîtes',
          '4 pièces',
          '3 pièces',
          '3 cuillères',
          '100g',
          '2 cuillères',
          '4 cuillères'
        ],
      ),
      Recipe(
        id: 'tn007',
        name: 'Slata Mechouia',
        category: 'Salé',
        area: 'Tunisie',
        instructions: '''
1. Griller les poivrons, tomates et piments sur flamme ou au four jusqu'à noircissement de la peau.
2. Éplucher les légumes grillés et les hacher finement.
3. Ajouter l'ail écrabouillé, le sel, le cumin et l'huile d'olive.
4. Bien mélanger et laisser reposer au frais 2 heures.
5. Servir avec des œufs durs, du thon et des olives.
6. Accompagner de pain chaud.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Poivrons',
          'Tomates',
          'Piments',
          'Ail',
          'Cumin',
          'Huile d\'olive',
          'Œufs durs',
          'Thon',
          'Olives'
        ],
        measures: [
          '4 pièces',
          '4 pièces',
          '2 pièces',
          '3 gousses',
          '1 cuillère',
          '5 cuillères',
          '2 pièces',
          '1 boîte',
          '100g'
        ],
      ),
      Recipe(
        id: 'tn008',
        name: 'Kaftaji',
        category: 'Salé',
        area: 'Tunisie',
        instructions: '''
1. Faire frire séparément les poivrons, courgettes et citrouille.
2. Écraser tous les légumes frits ensemble.
3. Faire revenir l'ail et ajouter la purée de tomates.
4. Ajouter les légumes écrabouillés, le cumin, carvi et harissa.
5. Casser les œufs dans la préparation et mélanger.
6. Servir chaud avec du pain.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Poivrons',
          'Courgettes',
          'Citrouille',
          'Œufs',
          'Tomates concentrée',
          'Ail',
          'Cumin',
          'Carvi',
          'Harissa'
        ],
        measures: [
          '3 pièces',
          '2 pièces',
          '200g',
          '4 pièces',
          '2 cuillères',
          '4 gousses',
          '1 cuillère',
          '1 cuillère',
          '2 cuillères'
        ],
      ),
      Recipe(
        id: 'tn009',
        name: 'Bambalouni',
        category: 'Sucré',
        area: 'Tunisie',
        instructions: '''
1. Mélanger la farine, levure, sucre et sel.
2. Ajouter l'eau tiède progressivement en pétrissant.
3. Laisser lever la pâte pendant 2 heures.
4. Former des anneaux et les laisser reposer 15 minutes.
5. Faire frire dans l'huile chaude jusqu'à coloration dorée.
6. Saupoudrer de sucre glace et servir chaud.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Farine',
          'Levure',
          'Sucre',
          'Sel',
          'Eau tiède',
          'Huile de friture',
          'Sucre glace'
        ],
        measures: [
          '500g',
          '10g',
          '2 cuillères',
          '1 pincée',
          '300ml',
          '500ml',
          '100g'
        ],
      ),
      Recipe(
        id: 'tn010',
        name: 'Tajine Tunisien',
        category: 'Traditionnel Tunisien',
        area: 'Tunisie',
        instructions: '''
1. Faire revenir la viande hachée avec les oignons.
2. Ajouter le fromage râpé, persil, œufs battus et épices.
3. Bien mélanger tous les ingrédients.
4. Verser dans un plat huilé et enfourner à 180°C.
5. Cuire 45 minutes jusqu'à coloration dorée.
6. Servir tiède coupé en parts.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Viande hachée',
          'Œufs',
          'Fromage râpé',
          'Oignons',
          'Persil',
          'Pommes de terre',
          'Cumin',
          'Sel',
          'Poivre'
        ],
        measures: [
          '500g',
          '6 pièces',
          '200g',
          '2 pièces',
          '1 bouquet',
          '2 pièces',
          '1 cuillère',
          '1 cuillère',
          '1 cuillère'
        ],
      ),
      Recipe(
        id: 'tn011',
        name: 'Zrir (Assida)',
        category: 'Sucré',
        area: 'Tunisie',
        instructions: '''
1. Faire griller les pignons et amandes légèrement.
2. Diluer la farine dans de l'eau froide sans grumeaux.
3. Cuire à feu doux en remuant constamment jusqu'à épaississement.
4. Verser dans des assiettes et laisser refroidir.
5. Décorer avec les fruits secs, sucre et beurre fondu.
6. Servir tiède ou froid.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Farine',
          'Sucre',
          'Pignons',
          'Amandes',
          'Noisettes',
          'Beurre',
          'Eau de fleur d\'oranger'
        ],
        measures: [
          '200g',
          '150g',
          '50g',
          '50g',
          '50g',
          '50g',
          '2 cuillères'
        ],
      ),
      Recipe(
        id: 'tn012',
        name: 'Masfouf',
        category: 'Sucré',
        area: 'Tunisie',
        instructions: '''
1. Cuire la semoule à la vapeur dans un couscoussier.
2. Ajouter le beurre et mélanger pour décoller les grains.
3. Saupoudrer de sucre et ajouter les raisins secs et dattes.
4. Arroser de lait et eau de fleur d'oranger.
5. Décorer avec des fruits secs (amandes, pistaches).
6. Servir tiède ou froid.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Semoule',
          'Sucre',
          'Beurre',
          'Dattes',
          'Raisins secs',
          'Lait',
          'Eau de fleur d\'oranger',
          'Amandes',
          'Pistaches'
        ],
        measures: [
          '500g',
          '100g',
          '50g',
          '100g',
          '50g',
          '250ml',
          '2 cuillères',
          '50g',
          '30g'
        ],
      ),
      Recipe(
        id: 'tn013',
        name: 'Kafteji',
        category: 'Salé',
        area: 'Tunisie',
        instructions: '''
1. Faire frire les légumes séparément (poivrons, courgettes, potiron).
2. Écraser grossièrement tous les légumes ensemble.
3. Faire revenir l'ail avec la purée de tomates.
4. Ajouter les légumes, épices (cumin, carvi) et harissa.
5. Incorporer les œufs battus et mélanger sur feu doux.
6. Servir chaud avec du pain.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Poivrons',
          'Courgettes',
          'Potiron',
          'Œufs',
          'Tomate concentrée',
          'Ail',
          'Cumin',
          'Carvi',
          'Harissa'
        ],
        measures: [
          '3 pièces',
          '2 pièces',
          '200g',
          '4 pièces',
          '2 cuillères',
          '4 gousses',
          '1 cuillère',
          '1 cuillère',
          '2 cuillères'
        ],
      ),
      Recipe(
        id: 'tn014',
        name: 'Mloukhia',
        category: 'Traditionnel Tunisien',
        area: 'Tunisie',
        instructions: '''
1. Faire cuire la viande dans de l'eau avec oignons et épices.
2. Préparer le t'faya : faire revenir oignons, ail et pâte de tomate.
3. Ajouter la mloukhia séchée et mélanger.
4. Verser le bouillon de viande progressivement.
5. Laisser mijoter 1 heure en remuant régulièrement.
6. Servir avec du pain et de la harissa.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Mloukhia séchée',
          'Viande de bœuf',
          'Oignons',
          'Ail',
          'Tomate concentrée',
          'Cumin',
          'Coriandre',
          'Carvi',
          'Harissa'
        ],
        measures: [
          '200g',
          '500g',
          '3 pièces',
          '6 gousses',
          '3 cuillères',
          '1 cuillère',
          '1 cuillère',
          '1 cuillère',
          '2 cuillères'
        ],
      ),
      Recipe(
        id: 'tn015',
        name: 'Kaak Warka',
        category: 'Sucré',
        area: 'Tunisie',
        instructions: '''
1. Préparer la pâte avec farine, huile, sucre, levure et eau de fleur d'oranger.
2. Laisser reposer 1 heure.
3. Former des anneaux et décorer avec des graines de sésame.
4. Badigeonner de jaune d'œuf.
5. Enfourner à 180°C pendant 25 minutes jusqu'à coloration dorée.
6. Laisser refroidir et saupoudrer de sucre glace.
        ''',
        thumbnail: '/placeholder.svg?height=400&width=400',
        ingredients: [
          'Farine',
          'Sucre',
          'Huile',
          'Levure',
          'Eau de fleur d\'oranger',
          'Sésame',
          'Œufs',
          'Sucre glace'
        ],
        measures: [
          '500g',
          '150g',
          '100ml',
          '10g',
          '3 cuillères',
          '50g',
          '2 pièces',
          '50g'
        ],
      ),
    ];
  }

  // Filtrer les recettes par catégorie
  static List<Recipe> getRecipesByCategory(String category) {
    return getTunisianRecipes()
        .where((recipe) => recipe.category == category)
        .toList();
  }

  // Rechercher des recettes par ingrédients disponibles
  static List<Recipe> searchByIngredients(List<String> availableIngredients) {
    if (availableIngredients.isEmpty) return [];

    List<Recipe> allRecipes = getTunisianRecipes();
    List<Recipe> matchingRecipes = [];

    for (Recipe recipe in allRecipes) {
      int matchCount = 0;
      for (String ingredient in recipe.ingredients) {
        for (String available in availableIngredients) {
          if (ingredient.toLowerCase().contains(available.toLowerCase()) ||
              available.toLowerCase().contains(ingredient.toLowerCase())) {
            matchCount++;
            break;
          }
        }
      }

      // Si au moins 30% des ingrédients correspondent
      if (matchCount >= (recipe.ingredients.length * 0.3)) {
        matchingRecipes.add(recipe);
      }
    }

    // Trier par nombre d'ingrédients correspondants (ordre décroissant)
    matchingRecipes.sort((a, b) {
      int countA = _countMatchingIngredients(a, availableIngredients);
      int countB = _countMatchingIngredients(b, availableIngredients);
      return countB.compareTo(countA);
    });

    return matchingRecipes;
  }

  static int _countMatchingIngredients(Recipe recipe, List<String> available) {
    int count = 0;
    for (String ingredient in recipe.ingredients) {
      for (String avail in available) {
        if (ingredient.toLowerCase().contains(avail.toLowerCase()) ||
            avail.toLowerCase().contains(ingredient.toLowerCase())) {
          count++;
          break;
        }
      }
    }
    return count;
  }

  // Sauvegarder une nouvelle recette créée par l'utilisateur
  static Future<bool> saveCustomRecipe(Recipe recipe) async {
    // Simulation de sauvegarde
    await Future.delayed(Duration(seconds: 1));
    debugPrint('Recette sauvegardée: ${recipe.name}');
    return true;
  }
}
