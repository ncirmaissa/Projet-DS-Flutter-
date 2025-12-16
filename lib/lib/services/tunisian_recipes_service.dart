import '../models/recipe.dart';
import 'package:flutter/foundation.dart';

class TunisianRecipesService {
  // Recettes tunisiennes traditionnelles élargies
  static List<Recipe> _customRecipes = [];

  static List<Recipe> getTunisianRecipes() {
    List<Recipe> baseRecipes = [
      // SALÉ TRADITIONNEL (22 recettes)
      Recipe(
        id: 'tn001',
        name: 'Couscous Tunisien',
        category: 'Salé Traditionnel',
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
        thumbnail: 'assets/images/recipes/couscous.jpg',
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
          'Huile d\'olive',
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
          '3 cuillères',
        ],
      ),
      Recipe(
        id: 'tn002',
        name: 'Brik à l\'œuf',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer la farce : écraser le thon, ajouter les câpres, le persil haché, l'oignon et l'harissa.
2. Poser une feuille de brick à plat.
3. Placer la farce au centre, puis casser un œuf dessus.
4. Plier la feuille en triangle en veillant à ne pas casser l'œuf.
5. Faire frire dans l'huile chaude jusqu'à ce que la brik soit dorée et croustillante.
6. Servir chaud avec des quartiers de citron.
        ''',
        thumbnail: 'assets/images/recipes/Brik.jpg',
        ingredients: [
          'Feuilles de brick',
          'Œufs',
          'Thon',
          'Câpres',
          'Persil',
          'Oignons',
          'Harissa',
          'Huile de friture',
        ],
        measures: [
          '4 feuilles',
          '4 pièces',
          '1 boîte',
          '2 cuillères',
          '1 bouquet',
          '1 pièce',
          '1 cuillère',
          '500ml',
        ],
      ),
      Recipe(
        id: 'tn003',
        name: 'Lablabi',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Faire cuire les pois chiches dans de l'eau salée avec du cumin pendant 1h30.
2. Dans des assiettes creuses, émietter du pain rassis.
3. Ajouter l'ail écrabouillé, le cumin, l'harissa et l'huile d'olive.
4. Verser les pois chiches chauds avec leur bouillon sur le pain.
5. Ajouter un œuf mollet sur chaque assiette.
6. Servir avec des quartiers de citron, des câpres et de l'harissa à côté.
        ''',
        thumbnail: 'assets/images/recipes/Lablebi.jpeg',
        ingredients: [
          'Pois chiches',
          'Pain rassis',
          'Œufs',
          'Ail',
          'Cumin',
          'Harissa',
          'Huile d\'olive',
          'Citron',
        ],
        measures: [
          '500g',
          '4 tranches',
          '4 pièces',
          '4 gousses',
          '2 cuillères',
          '2 cuillères',
          '4 cuillères',
          '2 pièces',
        ],
      ),
      Recipe(
        id: 'tn005',
        name: 'Ojja aux Merguez',
        category: 'Salé Traditionnel',
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
        thumbnail: 'assets/images/recipes/Ojja.jpg',
        ingredients: [
          'Merguez',
          'Œufs',
          'Tomates',
          'Poivrons',
          'Oignons',
          'Ail',
          'Harissa',
          'Cumin',
          'Paprika',
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
          '1 cuillère',
        ],
      ),
      Recipe(
        id: 'tn006',
        name: 'Fricassé Tunisien',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer la pâte avec farine, levure, sel et eau tiède. Laisser lever 2h.
2. Former des boules et les aplatir légèrement.
3. Faire frire dans l'huile chaude jusqu'à gonflement et coloration dorée.
4. Ouvrir en deux et garnir de thon, harissa, olives, câpres, pommes de terre et œuf dur.
5. Ajouter de l'huile d'olive et du citron.
6. Servir immédiatement bien chaud.
        ''',
        thumbnail: 'assets/images/recipes/fricasse.jpg',
        ingredients: [
          'Farine',
          'Levure',
          'Thon',
          'Œufs durs',
          'Pommes de terre',
          'Harissa',
          'Olives',
          'Câpres',
          'Huile d\'olive',
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
          '4 cuillères',
        ],
      ),
      Recipe(
        id: 'tn007',
        name: 'Kaftagi Gabès',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Griller les poivrons, tomates et piments sur flamme ou au four jusqu'à noircissement de la peau.
2. Éplucher les légumes grillés et les hacher finement.
3. Ajouter l'ail écrabouillé, le sel, le cumin et l'huile d'olive.
4. Bien mélanger et laisser reposer au frais 2 heures.
5. Servir avec des œufs durs, du thon et des olives.
6. Accompagner de pain chaud.
        ''',
        thumbnail: 'assets/images/recipes/kaftagi_gabes.jpg',
        ingredients: [
          'Poivrons',
          'Tomates',
          'Piments',
          'Ail',
          'Cumin',
          'Huile d\'olive',
          'Œufs durs',
          'Thon',
          'Olives',
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
          '100g',
        ],
      ),
      Recipe(
        id: 'tn008',
        name: 'Kaftaji',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Faire frire séparément les poivrons, courgettes et citrouille.
2. Écraser tous les légumes frits ensemble.
3. Faire revenir l'ail et ajouter la purée de tomates.
4. Ajouter les légumes écrabouillés, le cumin, carvi et harissa.
5. Casser les œufs dans la préparation et mélanger.
6. Servir chaud avec du pain.
        ''',
        thumbnail: 'assets/images/recipes/kafteji.jpg',
        ingredients: [
          'Poivrons',
          'Courgettes',
          'Citrouille',
          'Œufs',
          'Tomates concentrée',
          'Ail',
          'Cumin',
          'Carvi',
          'Harissa',
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
          '2 cuillères',
        ],
      ),
      Recipe(
        id: 'tn010',
        name: 'Tajine Tunisien',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Faire revenir la viande hachée avec les oignons.
2. Ajouter le fromage râpé, persil, œufs battus et épices.
3. Bien mélanger tous les ingrédients.
4. Verser dans un plat huilé et enfourner à 180°C.
5. Cuire 45 minutes jusqu'à coloration dorée.
6. Servir tiède coupé en parts.
        ''',
        thumbnail: 'assets/images/recipes/tajine.jpg',
        ingredients: [
          'Viande hachée',
          'Œufs',
          'Fromage râpé',
          'Oignons',
          'Persil',
          'Pommes de terre',
          'Cumin',
          'Sel',
          'Poivre',
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
          '1 cuillère',
        ],
      ),
      Recipe(
        id: 'tn014',
        name: 'Mloukhia',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Faire cuire la viande dans de l'eau avec oignons et épices.
2. Préparer le t'faya : faire revenir oignons, ail et pâte de tomate.
3. Ajouter la mloukhia séchée et mélanger.
4. Verser le bouillon de viande progressivement.
5. Laisser mijoter 1 heure en remuant régulièrement.
6. Servir avec du pain et de la harissa.
        ''',
        thumbnail: 'assets/images/recipes/mloukhia.jpg',
        ingredients: [
          'Mloukhia séchée',
          'Viande de bœuf',
          'Oignons',
          'Ail',
          'Tomate concentrée',
          'Cumin',
          'Coriandre',
          'Carvi',
          'Harissa',
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
          '2 cuillères',
        ],
      ),
      Recipe(
        id: 'tn016',
        name: 'Chakchuka',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Faire revenir poivrons, tomates et oignons.
2. Assaisonner avec cumin, paprika et harissa.
3. Laisser mijoter jusqu'à épaississement.
4. Casser les œufs dans la préparation.
5. Couvrir et cuire jusqu'à prise des œufs.
        ''',
        thumbnail: 'assets/images/recipes/chakchuka.jpg',
        ingredients: [
          'Poivrons',
          'Tomates',
          'Oignons',
          'Œufs',
          'Ail',
          'Cumin',
          'Paprika',
          'Harissa',
        ],
        measures: [
          '4 pièces',
          '6 pièces',
          '2 pièces',
          '4 pièces',
          '3 gousses',
          '1 cuillère',
          '1 cuillère',
          '2 cuillères',
        ],
      ),
      Recipe(
        id: 'tn017',
        name: 'Chebtiya',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer des pâtes fraîches en forme de languettes.
2. Faire revenir viande, pois chiches et légumes.
3. Cuire les pâtes dans le bouillon épicé.
4. Servir chaud avec harissa et citron.
        ''',
        thumbnail: 'assets/images/recipes/chebtiya.jpg',
        ingredients: [
          'Farine',
          'Viande',
          'Pois chiches',
          'Tomates',
          'Oignons',
          'Harissa',
          'Cumin',
          'Carvi',
        ],
        measures: [
          '400g',
          '500g',
          '200g',
          '3 pièces',
          '2 pièces',
          '2 cuillères',
          '1 cuillère',
          '1 cuillère',
        ],
      ),
      Recipe(
        id: 'tn018',
        name: 'Mlaoui',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer une pâte avec farine, semoule, sel et huile.
2. Former des boules et les étaler finement.
3. Cuire sur une plaque chaude en retournant.
4. Garnir de thon, harissa et œuf ou déguster nature.
        ''',
        thumbnail: 'assets/images/recipes/Mlaoui.jpeg',
        ingredients: ['Farine', 'Semoule fine', 'Huile', 'Sel', 'Eau'],
        measures: ['300g', '200g', '4 cuillères', '1 cuillère', '250ml'],
      ),
      Recipe(
        id: 'tn019',
        name: 'Droo',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer des petites boules de semoule roulées à la main.
2. Cuire à la vapeur dans le couscoussier.
3. Préparer une sauce avec viande, légumes et épices.
4. Servir le droo avec la sauce et harissa.
        ''',
        thumbnail: 'assets/images/recipes/DROO.jpg',
        ingredients: [
          'Semoule grosse',
          'Viande',
          'Pois chiches',
          'Carottes',
          'Courgettes',
          'Harissa',
          'Épices',
        ],
        measures: [
          '500g',
          '400g',
          '150g',
          '3 pièces',
          '2 pièces',
          '2 cuillères',
          'Mélange',
        ],
      ),
      Recipe(
        id: 'tn020',
        name: 'Marqa Bel Allouch',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Faire revenir l'agneau avec oignons et ail.
2. Ajouter tomates, artichauts et cardons.
3. Assaisonner avec cumin, coriandre et harissa.
4. Laisser mijoter 1h jusqu'à tendreté.
5. Servir avec du pain frais.
        ''',
        thumbnail: 'assets/images/recipes/marqa_allouche.jpg',
        ingredients: [
          'Agneau',
          'Artichauts',
          'Cardons',
          'Tomates',
          'Oignons',
          'Ail',
          'Cumin',
          'Harissa',
        ],
        measures: [
          '600g',
          '4 pièces',
          '300g',
          '4 pièces',
          '2 pièces',
          '4 gousses',
          '1 cuillère',
          '2 cuillères',
        ],
      ),
      Recipe(
        id: 'tn021',
        name: 'Garantita',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Mélanger farine de pois chiches avec eau et sel.
2. Ajouter cumin et huile d'olive.
3. Verser dans un plat huilé et enfourner 30 min.
4. Couper en carrés et servir avec harissa et citron.
        ''',
        thumbnail: 'assets/images/recipes/grantita.jpg',
        ingredients: [
          'Farine de pois chiches',
          'Eau',
          'Cumin',
          'Huile d\'olive',
          'Sel',
          'Harissa',
        ],
        measures: [
          '250g',
          '500ml',
          '2 cuillères',
          '3 cuillères',
          '1 cuillère',
          '2 cuillères',
        ],
      ),
      Recipe(
        id: 'tn030',
        name: 'Chakchuka',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Faire revenir poivrons, tomates et oignons.
2. Assaisonner avec cumin, paprika et harissa.
3. Laisser mijoter jusqu'à épaississement.
4. Casser les œufs dans la préparation.
5. Couvrir et cuire jusqu'à prise des œufs.
        ''',
        thumbnail: 'assets/images/recipes/chakchuka.jpg',
        ingredients: [
          'Poivrons',
          'Tomates',
          'Oignons',
          'Œufs',
          'Ail',
          'Cumin',
          'Paprika',
          'Harissa',
        ],
        measures: [
          '4 pièces',
          '6 pièces',
          '2 pièces',
          '4 pièces',
          '3 gousses',
          '1 cuillère',
          '1 cuillère',
          '2 cuillères',
        ],
      ),
      Recipe(
        id: 'tn029',
        name: 'Osban',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer la farce avec viande hachée, riz, foie et épices.
2. Remplir les boyaux nettoyés.
3. Fermer les extrémités.
4. Cuire dans le couscous ou en sauce.
5. Servir chaud en tranches.
        ''',
        thumbnail: 'assets/images/recipes/osban.jpg',
        ingredients: [
          'Boyaux',
          'Viande hachée',
          'Riz',
          'Foie',
          'Persil',
          'Menthe',
          'Cumin',
          'Harissa',
        ],
        measures: [
          '2 mètres',
          '500g',
          '200g',
          '200g',
          '1 bouquet',
          '1 bouquet',
          '2 cuillères',
          '2 cuillères',
        ],
      ),
      Recipe(
        id: 'tn035',
        name: 'Kafteji',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Faire frire séparément poivrons, potiron et courgettes.
2. Écraser grossièrement tous les légumes.
3. Faire revenir ail et harissa.
4. Ajouter les légumes et poudre de crevettes séchées.
5. Incorporer les œufs et mélanger. Servir chaud.
        ''',
        thumbnail: 'assets/images/recipes/kafteji.jpg',
        ingredients: [
          'Poivrons',
          'Potiron',
          'Courgettes',
          'Œufs',
          'Ail',
          'Harissa',
          'Crevettes séchées',
          'Cumin',
        ],
        measures: [
          '4 pièces',
          '300g',
          '3 pièces',
          '5 pièces',
          '6 gousses',
          '3 cuillères',
          '2 cuillères',
          '1 cuillère',
        ],
      ),
      Recipe(
        id: 'tn036',
        name: 'Ftayer',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer une pâte levée fine.
2. Garnir de thon, harissa, olives et câpres.
3. Plier en chausson.
4. Cuire au four 25 minutes à 200°C.
        ''',
        thumbnail: 'assets/images/recipes/ftayer.jpg',
        ingredients: [
          'Farine',
          'Levure',
          'Thon',
          'Olives',
          'Harissa',
          'Câpres',
        ],
        measures: [
          '500g',
          '10g',
          '2 boîtes',
          '100g',
          '3 cuillères',
          '2 cuillères',
        ],
      ),
      Recipe(
        id: 'tn037',
        name: 'Bouza',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Cuire les abats (foie, cœur, poumons) avec épices.
2. Couper en petits morceaux.
3. Faire revenir avec oignons, ail et harissa.
4. Servir chaud avec du pain.
        ''',
        thumbnail: 'assets/images/recipes/bouza.jpg',
        ingredients: [
          'Abats mélangés',
          'Oignons',
          'Ail',
          'Harissa',
          'Cumin',
          'Coriandre',
        ],
        measures: [
          '800g',
          '2 pièces',
          '4 gousses',
          '3 cuillères',
          '1 cuillère',
          '1 cuillère',
        ],
      ),
      Recipe(
        id: 'tn038',
        name: 'Samsa',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer une farce de viande hachée, oignons et épices.
2. Découper des feuilles de brick en triangles.
3. Garnir et plier en triangle.
4. Faire frire jusqu'à coloration dorée.
        ''',
        thumbnail: 'assets/images/recipes/Samsa.jpg',
        ingredients: [
          'Feuilles de brick',
          'Viande hachée',
          'Oignons',
          'Persil',
          'Œufs',
          'Épices',
        ],
        measures: [
          '8 feuilles',
          '400g',
          '2 pièces',
          '1 bouquet',
          '1 pièce',
          'Mélange',
        ],
      ),
      Recipe(
        id: 'tn023',
        name: 'Makroudh',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer la farce: mélanger dattes, cannelle et eau de fleur d'oranger.
2. Préparer la pâte avec semoule, beurre fondu et eau.
3. Étaler la pâte, ajouter la farce, rouler et découper en losanges.
4. Faire frire dans l'huile chaude jusqu'à coloration dorée.
5. Tremper dans du miel chaud parfumé.
6. Laisser refroidir et servir.
        ''',
        thumbnail: 'assets/images/recipes/Makrouds.jpg',
        ingredients: [
          'Semoule fine',
          'Dattes',
          'Beurre',
          'Miel',
          'Cannelle',
          'Eau de fleur d\'oranger',
          'Huile de friture',
        ],
        measures: [
          '500g',
          '400g',
          '200g',
          '250g',
          '1 cuillère',
          '3 cuillères',
          '500ml',
        ],
      ),
      Recipe(
        id: 'tn024',
        name: 'Bambalouni',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer une pâte levée avec farine, levure, sucre et sel.
2. Laisser lever 1 heure jusqu'à doublement de volume.
3. Former des anneaux ou boules avec la pâte.
4. Faire frire dans l'huile chaude.
5. Saupoudrer de sucre glace.
6. Servir chaud.
        ''',
        thumbnail: 'assets/images/recipes/bambalouni.jpg',
        ingredients: [
          'Farine',
          'Levure',
          'Sucre',
          'Sel',
          'Eau tiède',
          'Huile de friture',
          'Sucre glace',
        ],
        measures: [
          '500g',
          '10g',
          '2 cuillères',
          '1 cuillère',
          '300ml',
          '500ml',
          '100g',
        ],
      ),
      Recipe(
        id: 'tn026',
        name: 'Mesfouf',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Cuire la semoule fine à la vapeur.
2. Mélanger avec beurre, sucre et eau de fleur d'oranger.
3. Ajouter raisins secs, dattes et amandes.
4. Arroser d'eau de fleur d'oranger.
5. Servir tiède ou froid avec du lait.
        ''',
        thumbnail: 'assets/images/recipes/mesfouf.jpg',
        ingredients: [
          'Semoule fine',
          'Beurre',
          'Sucre',
          'Raisins secs',
          'Dattes',
          'Amandes',
          'Eau de fleur d\'oranger',
        ],
        measures: [
          '500g',
          '100g',
          '100g',
          '100g',
          '100g',
          '50g',
          '3 cuillères',
        ],
      ),
      Recipe(
        id: 'tn027',
        name: 'Bsisa',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer une pâte avec farine, sucre et eau de fleur d'oranger.
2. Étaler finement et découper en rectangles.
3. Rouler autour d'un bâton et faire frire.
4. Tremper dans du miel chaud.
5. Décorer de pistaches concassées.
        ''',
        thumbnail: 'assets/images/recipes/bsisa.jpg',
        ingredients: [
          'Farine',
          'Sucre',
          'Eau de fleur d\'oranger',
          'Miel',
          'Pistaches',
          'Huile de friture',
        ],
        measures: ['500g', '100g', '2 cuillères', '300g', '50g', '500ml'],
      ),
      Recipe(
        id: 'tn031',
        name: 'Borghol Bel Besbes',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Cuire le borghol dans du lait sucré.
2. Griller les graines de fenouil.
3. Mélanger avec des dattes et raisins secs.
4. Arroser d'eau de fleur d'oranger.
5. Servir tiède ou froid.
        ''',
        thumbnail: 'assets/images/recipes/mesfouf.jpg',
        ingredients: [
          'Borghol',
          'Lait',
          'Sucre',
          'Dattes',
          'Raisins secs',
          'Graines de fenouil',
          'Eau de fleur d\'oranger',
        ],
        measures: [
          '300g',
          '500ml',
          '100g',
          '150g',
          '100g',
          '2 cuillères',
          '3 cuillères',
        ],
      ),
      Recipe(
        id: 'tn032',
        name: 'Banatages',
        category: 'Salé Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer une pâte avec farine, œufs et eau de fleur d'oranger.
2. Étaler finement et découper en rectangles.
3. Rouler autour d'un bâton et faire frire.
4. Tremper dans du miel chaud.
5. Décorer de pistaches concassées.
        ''',
        thumbnail: 'assets/images/recipes/banatage.jpg',
        ingredients: [
          'Farine',
          'Œufs',
          'Eau de fleur d\'oranger',
          'Miel',
          'Pistaches',
          'Huile de friture',
        ],
        measures: ['500g', '3 pièces', '2 cuillères', '300g', '50g', '500ml'],
      ),
      Recipe(
        id: 'tn039',
        name: 'Baklawa Tunisienne',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Beurrer des feuilles de brick et les superposer.
2. Disposer des amandes et pistaches concassées.
3. Recouvrir de feuilles beurrées.
4. Découper en losanges et cuire 30 min.
5. Arroser de sirop au miel et eau de fleur d'oranger.
        ''',
        thumbnail: 'assets/images/recipes/baklawa.jpg',
        ingredients: [
          'Feuilles de brick',
          'Amandes',
          'Pistaches',
          'Beurre',
          'Miel',
          'Eau de fleur d\'oranger',
        ],
        measures: ['500g', '300g', '200g', '250g', '300g', '3 cuillères'],
      ),
      Recipe(
        id: 'tn040',
        name: 'Hrissa Tunisienne',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Faire un sirop avec eau, sucre et citron.
2. Mélanger semoule, œufs, levure et huile.
3. Verser dans un moule beurré.
4. Cuire 35 minutes à 180°C.
5. Verser le sirop chaud sur le gâteau et laisser absorber.
        ''',
        thumbnail: 'assets/images/recipes/hrissa.jpg',
        ingredients: [
          'Semoule fine',
          'Sucre',
          'Œufs',
          'Levure',
          'Huile',
          'Amandes',
        ],
        measures: ['400g', '300g', '4 pièces', '10g', '100ml', '100g'],
      ),
      Recipe(
        id: 'tn041',
        name: 'Yoyo',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Préparer une pâte avec farine, levure et lait.
2. Former des boules et laisser lever.
3. Faire frire jusqu'à coloration dorée.
4. Tremper dans du sirop au miel.
5. Servir avec du sucre glace.
        ''',
        thumbnail: 'assets/images/recipes/yoyo.jpeg',
        ingredients: [
          'Farine',
          'Levure',
          'Lait',
          'Œufs',
          'Miel',
          'Sucre glace',
        ],
        measures: ['500g', '10g', '250ml', '2 pièces', '250g', '100g'],
      ),
      Recipe(
        id: 'tn042',
        name: 'Ghraiba',
        category: 'Sucré Traditionnel',
        area: 'Tunisie',
        instructions: '''
1. Mélanger beurre, sucre glace et vanille.
2. Ajouter la farine progressivement.
3. Former des boules et aplatir légèrement.
4. Cuire 15 minutes à 160°C jusqu'à légère coloration.
5. Laisser refroidir et saupoudrer de sucre glace.
        ''',
        thumbnail: 'assets/images/recipes/ghraiba.jpg',
        ingredients: [
          'Beurre',
          'Sucre glace',
          'Farine',
          'Vanille',
          'Amandes en poudre',
        ],
        measures: ['250g', '150g', '400g', '1 sachet', '100g'],
      ),
    ];

    return [...baseRecipes, ..._customRecipes];
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
    await Future.delayed(Duration(seconds: 1));
    _customRecipes.add(recipe);
    debugPrint(
      'Recette sauvegardée: ${recipe.name}. Total recettes: ${getTunisianRecipes().length}',
    );
    return true;
  }

  static bool isCustomRecipe(String recipeId) {
    return _customRecipes.any((recipe) => recipe.id == recipeId);
  }

  static Future<bool> deleteCustomRecipe(String recipeId) async {
    await Future.delayed(Duration(milliseconds: 500));
    final initialLength = _customRecipes.length;
    _customRecipes.removeWhere((recipe) => recipe.id == recipeId);
    final deleted = _customRecipes.length < initialLength;
    if (deleted) {
      debugPrint(
        'Recette supprimée: $recipeId. Total recettes: ${getTunisianRecipes().length}',
      );
    }
    return deleted;
  }

  // Ajouter search functionality for local Tunisian recipes
  static List<Recipe> searchRecipes(String query) {
    if (query.trim().isEmpty) {
      return [];
    }

    final lowerQuery = query.toLowerCase();
    final allRecipes = getTunisianRecipes();

    return allRecipes.where((recipe) {
      // Search in recipe name
      if (recipe.name.toLowerCase().contains(lowerQuery)) {
        return true;
      }

      // Search in category
      if (recipe.category.toLowerCase().contains(lowerQuery)) {
        return true;
      }

      // Search in ingredients
      for (var ingredient in recipe.ingredients) {
        if (ingredient.toLowerCase().contains(lowerQuery)) {
          return true;
        }
      }

      return false;
    }).toList();
  }
}
