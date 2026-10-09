import 'package:flutter/foundation.dart';
import 'package:surtidespensa/features/recipes/data/recipe_repository.dart';
import 'package:surtidespensa/features/recipes/models/recipe.dart';

class RecipeFormViewModel extends ChangeNotifier {
  final RecipeRepository _repository;
  RecipeFormViewModel(this._repository);

  Future<void> saveRecipe(Recipe recipe) async {
    await _repository.save(recipe);
  }
}
