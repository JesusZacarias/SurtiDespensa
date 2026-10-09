import 'package:surtidespensa/features/recipes/models/recipe.dart';

/// Fuente de verdad de las recetas para los ViewModels.
///
/// Esta primera implementación guarda datos en memoria para que el flujo sea
/// fácil de estudiar. Más adelante el contenido se sustituirá por `sqflite`
/// sin cambiar las pantallas.
class RecipeRepository {
  RecipeRepository({List<Recipe> initialRecipes = const []})
    : _recipes = {for (final recipe in initialRecipes) recipe.id: recipe};

  final Map<String, Recipe> _recipes;

  Future<void> deleteById(String id) async {
    _recipes.remove(id);
  }

  Future<List<Recipe>> getAll() async {
    return List.unmodifiable(_recipes.values);
  }

  Future<void> save(Recipe recipe) async {
    _recipes[recipe.id] = recipe;
  }
}
