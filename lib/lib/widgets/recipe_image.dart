import 'package:flutter/material.dart';

class RecipeImage extends StatelessWidget {
  final String imageUrl;
  final String recipeName;
  final double height;
  final double? width;
  final BoxFit fit;

  const RecipeImage({
    super.key,
    required this.imageUrl,
    required this.recipeName,
    this.height = 200,
    this.width,
    this.fit = BoxFit.cover,
  });

  Color _getColorFromName(String name) {
    final hash = name.hashCode;
    final colors = [
      Color(0xFFFF6B6B), // Rouge
      Color(0xFF4ECDC4), // Turquoise
      Color(0xFFFFE66D), // Jaune
      Color(0xFF95E1D3), // Vert menthe
      Color(0xFFFF8C42), // Orange
      Color(0xFFA8E6CF), // Vert pastel
      Color(0xFFDDA15E), // Marron doré
      Color(0xFFBC6C25), // Marron foncé
    ];
    return colors[hash.abs() % colors.length];
  }

  IconData _getIconFromName(String name) {
    if (name.toLowerCase().contains('couscous')) {
      return Icons.rice_bowl;
    }
    if (name.toLowerCase().contains('brik')) {
      return Icons.breakfast_dining;
    }
    if (name.toLowerCase().contains('soupe') || name.toLowerCase().contains('lablabi')) {
      return Icons.soup_kitchen;
    }
    if (name.toLowerCase().contains('makroudh') || name.toLowerCase().contains('bambalouni')) {
      return Icons.cake;
    }
    if (name.toLowerCase().contains('ojja')) {
      return Icons.egg;
    }
    if (name.toLowerCase().contains('fricassé')) {
      return Icons.fastfood;
    }
    if (name.toLowerCase().contains('slata') || name.toLowerCase().contains('mechouia')) {
      return Icons.local_dining;
    }
    if (name.toLowerCase().contains('kaftaji')) {
      return Icons.ramen_dining;
    }
    if (name.toLowerCase().contains('tajine')) {
      return Icons.restaurant;
    }
    if (name.toLowerCase().contains('mloukhia')) {
      return Icons.set_meal;
    }
    return Icons.restaurant_menu;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            _getColorFromName(recipeName),
            _getColorFromName(recipeName).withOpacity(0.7),
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Motif décoratif
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: CustomPaint(
                painter: PatternPainter(),
              ),
            ),
          ),
          // Icône et texte
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getIconFromName(recipeName),
                  size: 80,
                  color: Colors.white.withOpacity(0.9),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    recipeName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (double i = 0; i < size.width; i += 30) {
      for (double j = 0; j < size.height; j += 30) {
        canvas.drawCircle(Offset(i, j), 10, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
