import 'package:flutter_test/flutter_test.dart';
import 'package:surtidespensa/features/recipes/models/ingredient.dart';
import 'package:surtidespensa/features/recipes/models/measurement_unit.dart';
import 'package:surtidespensa/features/recipes/models/quantity.dart';
import 'package:surtidespensa/features/recipes/models/recipe_ingredient.dart';

void main() {
  group('RecipeIngredient', () {
    test('relaciona un ingrediente con cantidad y unidad', () {
      final ingredient = Ingredient(id: 'ingredient-1', name: 'Jitomate');

      final recipeIngredient = RecipeIngredient(
        ingredient: ingredient,
        quantity: Quantity(3),
        unit: MeasurementUnit.piece,
      );

      expect(recipeIngredient.ingredient, same(ingredient));
      expect(recipeIngredient.quantity.value, 3);
      expect(recipeIngredient.unit, MeasurementUnit.piece);
    });

    test('scaledBy crea una copia con la cantidad escalada', () {
      final recipeIngredient = RecipeIngredient(
        ingredient: Ingredient(id: 'ingredient-1', name: 'Arroz'),
        quantity: Quantity(500),
        unit: MeasurementUnit.gram,
      );

      final scaled = recipeIngredient.scaledBy(2);

      expect(scaled.quantity.value, 1000);
      expect(scaled.ingredient, same(recipeIngredient.ingredient));
      expect(scaled.unit, recipeIngredient.unit);
      expect(recipeIngredient.quantity.value, 500);
    });
  });
}
