import 'package:flutter_test/flutter_test.dart';
import 'package:surtidespensa/features/recipes/models/ingredient.dart';
import 'package:surtidespensa/features/recipes/models/measurement_unit.dart';
import 'package:surtidespensa/features/recipes/models/quantity.dart';
import 'package:surtidespensa/features/recipes/models/recipe.dart';
import 'package:surtidespensa/features/recipes/models/recipe_ingredient.dart';

void main() {
  group('Recipe', () {
    // Test positivo    
    test('se crea con datos válidos', () {
      final recipe = Recipe(id: 'recipe-1', name: 'Mole', baseServings: 3, ingredients: [
        RecipeIngredient(ingredient: Ingredient(id: 'tomate', name: 'Jitomate'), quantity: Quantity(2), unit: MeasurementUnit.piece),
        ]);

      expect(recipe.name, 'Mole');
      expect(recipe.baseServings, 3);
    });
     
      // Tests Negativos usan expect
     test('rechaza ingredientes duplicados', () {
      expect(
        () => Recipe(
          id: 'recipe-1', 
          name: 'Mole', 
          baseServings: 3, 
          ingredients: [
            RecipeIngredient(
              ingredient: Ingredient(
                id: 'tomate', 
                name: 'Jitomate'), 
              quantity: Quantity(2), 
              unit: MeasurementUnit.piece),
            RecipeIngredient(
              ingredient: Ingredient(
                id: 'tomate2', 
                name: 'Jitomate'), 
              quantity: Quantity(2), 
              unit: MeasurementUnit.piece
              ),
            ], 
          ),
          throwsArgumentError,
      );
    });
    test('rechaza porciones iguales a cero', () {
      expect(
        () => Recipe(id: 'recipe-2', name: 'Mole', baseServings: 0, ingredients: [RecipeIngredient(ingredient: Ingredient(id: 'tomate', name: 'Jitomate'), quantity: Quantity(10), unit: MeasurementUnit.piece)]),
        throwsArgumentError,
      );
    });
  });
}
