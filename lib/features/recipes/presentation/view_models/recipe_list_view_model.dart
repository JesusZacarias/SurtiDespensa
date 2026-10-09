import 'package:flutter/foundation.dart';
import 'package:surtidespensa/features/recipes/data/recipe_repository.dart';
import 'package:surtidespensa/features/recipes/models/recipe.dart';

enum RecipeListStatus { initial, loading, success, failure }

/// Convierte la carga del catálogo en estados que la pantalla puede dibujar.
class RecipeListViewModel extends ChangeNotifier {
  RecipeListViewModel(this._repository);

  final RecipeRepository _repository;

  RecipeListStatus _status = RecipeListStatus.initial;
  RecipeListStatus get status => _status;

  List<Recipe> _recipes = const [];
  List<Recipe> get recipes => _recipes;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> load() async {
    _status = RecipeListStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final loadedRecipes = await _repository.getAll();
      _recipes = [...loadedRecipes]
        ..sort(
          (left, right) =>
              left.name.toLowerCase().compareTo(right.name.toLowerCase()),
        );
      _status = RecipeListStatus.success;
    } on Object {
      _status = RecipeListStatus.failure;
      _errorMessage = 'No se pudieron cargar las recetas.';
    }

    notifyListeners();
  }
}
