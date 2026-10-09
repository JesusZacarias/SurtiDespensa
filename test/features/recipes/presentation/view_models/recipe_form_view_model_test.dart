import 'package:flutter_test/flutter_test.dart';
import 'package:surtidespensa/features/recipes/data/recipe_repository.dart';
import 'package:surtidespensa/features/recipes/models/ingredient.dart';
import 'package:surtidespensa/features/recipes/models/measurement_unit.dart';
import 'package:surtidespensa/features/recipes/models/quantity.dart';
import 'package:surtidespensa/features/recipes/models/recipe.dart';
import 'package:surtidespensa/features/recipes/models/recipe_ingredient.dart';
import 'package:surtidespensa/features/recipes/presentation/view_models/recipe_form_view_model.dart';

void main() {
  test('saveRecipe guarda la receta en el repository', () async {
    // Preparar: usamos un repository vacío y una receta válida.
    final repository = RecipeRepository();
    final viewModel = RecipeFormViewModel(repository);
    addTearDown(viewModel.dispose);

    final recipe = Recipe(
      id: 'recipe-1',
      name: 'Mole',
      baseServings: 3,
      ingredients: [
        RecipeIngredient(
          ingredient: Ingredient(id: 'ingredient-1', name: 'Jitomate'),
          quantity: Quantity(2),
          unit: MeasurementUnit.piece,
        ),
      ],
    );

    // Actuar: esperamos porque saveRecipe devuelve un Future.
    await viewModel.saveRecipe(recipe);

    // Comprobar: consultamos el mismo repository recibido por el ViewModel.
    final savedRecipes = await repository.getAll();
    expect(savedRecipes, hasLength(1));
    expect(savedRecipes.single, same(recipe));
  });
}
