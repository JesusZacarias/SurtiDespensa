import 'package:flutter/material.dart';
import 'package:surtidespensa/features/recipes/models/recipe.dart';

/// Representación visual reutilizable de una receta.
class RecipeCard extends StatelessWidget {
  const RecipeCard({required this.recipe, super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.restaurant_menu)),
        title: Text(recipe.name),
        subtitle: Text('${recipe.baseServings} porciones base'),
      ),
    );
  }
}
