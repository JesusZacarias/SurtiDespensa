import 'package:flutter_test/flutter_test.dart';
import 'package:surtidespensa/features/recipes/models/ingredient.dart';

void main() {
  group('Ingredient', () {
    test('limpia y normaliza el nombre automáticamente', () {
      final ingredient = Ingredient(
        id: ' ingredient-1 ',
        name: '  Jitomate   Saladet ',
      );

      expect(ingredient.id, 'ingredient-1');
      expect(ingredient.name, 'Jitomate Saladet');
      expect(ingredient.normalizedName, 'jitomate saladet');
    });

    test('rechaza un nombre vacío', () {
      expect(
        () => Ingredient(id: 'ingredient-1', name: '   '),
        throwsArgumentError,
      );
    });

    test('copyWith cambia el nombre y conserva el id', () {
      final ingredient = Ingredient(id: 'ingredient-1', name: 'Jitomate');

      final updated = ingredient.copyWith(name: 'Jitomate saladet');

      expect(updated.id, ingredient.id);
      expect(updated.name, 'Jitomate saladet');
      expect(updated.normalizedName, 'jitomate saladet');
    });
  });
}
