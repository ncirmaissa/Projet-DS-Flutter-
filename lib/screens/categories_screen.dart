import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import 'category_recipes_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    final categories = [
      {
        'name': languageProvider.translate('category_traditional'),
        'value': 'Traditionnel Tunisien',
        'icon': Icons.restaurant,
        'color': Colors.orange,
        'gradient': [Color(0xFFFF6B35), Color(0xFFFF8C42)],
      },
      {
        'name': languageProvider.translate('category_salty'),
        'value': 'Salé',
        'icon': Icons.dining,
        'color': Colors.red,
        'gradient': [Color(0xFFE63946), Color(0xFFF77F00)],
      },
      {
        'name': languageProvider.translate('category_sweet'),
        'value': 'Sucré',
        'icon': Icons.cake,
        'color': Colors.pink,
        'gradient': [Color(0xFFFF006E), Color(0xFFFFBE0B)],
      },
      {
        'name': languageProvider.translate('category_foreign'),
        'value': 'Étranger',
        'icon': Icons.public,
        'color': Colors.blue,
        'gradient': [Color(0xFF4361EE), Color(0xFF3A86FF)],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(languageProvider.translate('categories')),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return _CategoryCard(
                name: category['name'] as String,
                value: category['value'] as String,
                icon: category['icon'] as IconData,
                gradient: category['gradient'] as List<Color>,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryRecipesScreen(
                        categoryName: category['name'] as String,
                        categoryValue: category['value'] as String,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String name;
  final String value;
  final IconData icon;
  final List<Color> gradient;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.name,
    required this.value,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: gradient[0].withValues(alpha: 0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradient,
            ),
            boxShadow: [
              BoxShadow(
                color: gradient[0].withValues(alpha: 0.3),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 48,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
