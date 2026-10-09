import 'package:flutter/material.dart';
import 'package:surtidespensa/app/theme/app_colors.dart';
import 'package:surtidespensa/core/presentation/widgets/app_form_section.dart';
import 'package:surtidespensa/features/recipes/models/measurement_unit.dart';
import 'package:surtidespensa/features/recipes/presentation/controllers/ingredient_form_controller.dart';
import 'package:surtidespensa/features/recipes/presentation/widgets/recipe_form/ingredient_form_row.dart';

/// Presenta la colección editable de ingredientes de una receta.
class RecipeIngredientsSection extends StatelessWidget {
  const RecipeIngredientsSection({
    required this.ingredients,
    required this.onAdd,
    required this.onDelete,
    required this.onUnitChanged,
    super.key,
  });

  final List<IngredientFormController> ingredients;
  final VoidCallback onAdd;
  final ValueChanged<int> onDelete;
  final void Function(int index, MeasurementUnit unit) onUnitChanged;

  @override
  Widget build(BuildContext context) {
    return AppFormSection(
      title: 'Ingredientes',
      padding: const EdgeInsets.fromLTRB(12, 17, 12, 18),
      child: Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            child: Column(
              children: [
                for (var index = 0; index < ingredients.length; index++) ...[
                  IngredientFormRow(
                    key: ObjectKey(ingredients[index]),
                    controller: ingredients[index],
                    onUnitChanged: (unit) => onUnitChanged(index, unit),
                    onDelete: () => onDelete(index),
                  ),
                  if (index < ingredients.length - 1)
                    const SizedBox(height: 10),
                ],
              ],
            ),
          ),
          if (ingredients.isNotEmpty) const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add, size: 29),
              label: const Text('Agregar ingrediente'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
