import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../models/recipe.dart';
import '../services/tunisian_recipes_service.dart';

class CreateRecipeScreen extends StatefulWidget {
  const CreateRecipeScreen({super.key});

  @override
  State<CreateRecipeScreen> createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _instructionsController = TextEditingController();
  
  String _selectedCategory = 'Traditionnel Tunisien';
  final List<String> _ingredients = [''];
  final List<String> _measures = [''];
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _addIngredient() {
    setState(() {
      _ingredients.add('');
      _measures.add('');
    });
  }

  void _removeIngredient(int index) {
    setState(() {
      _ingredients.removeAt(index);
      _measures.removeAt(index);
    });
  }

  Future<void> _submitRecipe() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });

      final recipe = Recipe(
        id: 'custom_${DateTime.now().millisecondsSinceEpoch}',
        name: _nameController.text,
        category: _selectedCategory,
        area: 'Tunisie',
        instructions: _instructionsController.text,
        thumbnail: '/placeholder.svg?height=300&width=300',
        ingredients: _ingredients.where((i) => i.isNotEmpty).toList(),
        measures: _measures.where((m) => m.isNotEmpty).toList(),
      );

      final success = await TunisianRecipesService.saveCustomRecipe(recipe);

      setState(() {
        _isSubmitting = false;
      });

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Recette publiée avec succès !'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(languageProvider.translate('create_recipe')),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nom de la recette
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: languageProvider.translate('recipe_name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Catégorie
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: languageProvider.translate('category'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: [
                  'Traditionnel Tunisien',
                  'Salé',
                  'Sucré',
                  'Étranger',
                ].map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              SizedBox(height: 24),

              // Ingrédients
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    languageProvider.translate('ingredients'),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle, color: Colors.orange),
                    onPressed: _addIngredient,
                  ),
                ],
              ),
              SizedBox(height: 8),

              ..._ingredients.asMap().entries.map((entry) {
                int index = entry.key;
                return Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          initialValue: _ingredients[index],
                          decoration: InputDecoration(
                            labelText: 'Ingrédient ${index + 1}',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {
                            _ingredients[index] = value;
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          initialValue: _measures[index],
                          decoration: InputDecoration(
                            labelText: 'Quantité',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onChanged: (value) {
                            _measures[index] = value;
                          },
                        ),
                      ),
                      if (index > 0)
                        IconButton(
                          icon: Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () => _removeIngredient(index),
                        ),
                    ],
                  ),
                );
              }).toList(),

              SizedBox(height: 24),

              // Instructions
              TextFormField(
                controller: _instructionsController,
                decoration: InputDecoration(
                  labelText: languageProvider.translate('instructions'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignLabelWithHint: true,
                ),
                maxLines: 8,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer les instructions';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),

              // Bouton de soumission
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submitRecipe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isSubmitting
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          languageProvider.translate('publish_recipe'),
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
      ),
    );
  }
}
