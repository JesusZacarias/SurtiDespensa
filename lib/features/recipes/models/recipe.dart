import 'package:surtidespensa/features/recipes/models/recipe_ingredient.dart';

/// Receta completa del catálogo.
///
/// Es un modelo de dominio: no conoce formularios, widgets ni SQLite.
class Recipe {
  Recipe({
    required String id,
    required String name,
    required this.baseServings,
    required List<RecipeIngredient> ingredients,
  }) : id = id.trim(),
       name = _cleanName(name),
       ingredients = List.unmodifiable(ingredients) {
    if (this.id.isEmpty) {
      throw ArgumentError.value(id, 'id', 'No puede estar vacío');
    }

    if (this.name.isEmpty) {
      throw ArgumentError.value(name, 'name', 'No puede estar vacío');
    }

    if (baseServings <= 0) {
      throw ArgumentError.value(
        baseServings,
        'baseServings',
        'Debe ser mayor que cero',
      );
    }

    if (this.ingredients.isEmpty) {
      throw ArgumentError.value(
        ingredients,
        'ingredients',
        'La receta debe tener al menos un ingrediente',
      );
    }

    _validateDuplicatedIngredients(this.ingredients);
  }

  final String id;
  final String name;
  final int baseServings;

  /// La lista no puede modificarse desde fuera de la receta.
  final List<RecipeIngredient> ingredients;

  /// Crea una nueva versión conservando el mismo identificador.
  Recipe copyWith({
    String? name,
    int? baseServings,
    List<RecipeIngredient>? ingredients,
  }) {
    return Recipe(
      id: id,
      name: name ?? this.name,
      baseServings: baseServings ?? this.baseServings,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  static String _cleanName(String value) {
    return value.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  static void _validateDuplicatedIngredients(
    List<RecipeIngredient> ingredients,
  ) {
    final registeredIngredients = <String>{};

    for (final recipeIngredient in ingredients) {
      final key = recipeIngredient.ingredient.normalizedName;

      final wasAdded = registeredIngredients.add(key);
      if (!wasAdded) {
        throw ArgumentError.value(
          ingredients,
          'ingredients',
          'No se puede repetir un ingrediente en la misma receta',
        );
      }
    }
  }
}
