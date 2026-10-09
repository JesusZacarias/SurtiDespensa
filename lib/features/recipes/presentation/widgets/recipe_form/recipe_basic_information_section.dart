import 'package:flutter/material.dart';
import 'package:surtidespensa/app/theme/app_colors.dart';
import 'package:surtidespensa/core/presentation/widgets/app_form_section.dart';
import 'package:surtidespensa/core/presentation/widgets/app_text_form_field.dart';
import 'package:surtidespensa/features/recipes/presentation/widgets/recipe_form/base_servings_selector.dart';

/// Sección específica del formulario que reúne nombre y porciones.
class RecipeBasicInformationSection extends StatelessWidget {
  const RecipeBasicInformationSection({
    required this.nameController,
    required this.baseServings,
    required this.onIncrementServings,
    required this.onDecrementServings,
    super.key,
  });

  final TextEditingController nameController;
  final int baseServings;
  final VoidCallback onIncrementServings;
  final VoidCallback onDecrementServings;

  @override
  Widget build(BuildContext context) {
    return AppFormSection(
      title: 'Información básica',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FieldLabel('Nombre de la receta'),
          const SizedBox(height: 7),
          AppTextFormField(
            controller: nameController,
            hintText: 'Ej. Mole poblano',
            textCapitalization: TextCapitalization.sentences,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Escribe el nombre de la receta';
              }
              return null;
            },
          ),
          const SizedBox(height: 17),
          const _FieldLabel('Porciones base'),
          const SizedBox(height: 7),
          BaseServingsSelector(
            value: baseServings,
            onIncrement: onIncrementServings,
            onDecrement: onDecrementServings,
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: AppColors.label, fontSize: 16),
    );
  }
}
