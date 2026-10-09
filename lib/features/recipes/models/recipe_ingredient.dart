import 'package:surtidespensa/features/recipes/models/ingredient.dart';
import 'package:surtidespensa/features/recipes/models/measurement_unit.dart';
import 'package:surtidespensa/features/recipes/models/quantity.dart';

/// Uso concreto de un ingrediente dentro de una receta.
///
/// [Ingredient] responde qué producto es; esta clase agrega cuánto se necesita
/// y en qué unidad se mide para una receta específica.
class RecipeIngredient {
  const RecipeIngredient({
    required this.ingredient,
    required this.quantity,
    required this.unit,
  });

  final Ingredient ingredient;
  final Quantity quantity;
  final MeasurementUnit unit;

  /// Crea una nueva versión conservando los valores que no se indiquen.
  RecipeIngredient copyWith({
    Ingredient? ingredient,
    Quantity? quantity,
    MeasurementUnit? unit,
  }) {
    return RecipeIngredient(
      ingredient: ingredient ?? this.ingredient,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
    );
  }

  /// Escala solamente la cantidad; el producto y su unidad no cambian.
  RecipeIngredient scaledBy(double factor) {
    return copyWith(quantity: quantity.scaledBy(factor));
  }
}
