import 'package:flutter/material.dart';
import 'package:surtidespensa/app/theme/app_colors.dart';
import 'package:surtidespensa/core/presentation/widgets/app_text_form_field.dart';
import 'package:surtidespensa/features/recipes/models/measurement_unit.dart';
import 'package:surtidespensa/features/recipes/presentation/controllers/ingredient_form_controller.dart';

/// Fila editable de un ingrediente dentro de una receta.
class IngredientFormRow extends StatelessWidget {
  const IngredientFormRow({
    required this.controller,
    required this.onUnitChanged,
    required this.onDelete,
    super.key,
  });

  final IngredientFormController controller;
  final ValueChanged<MeasurementUnit> onUnitChanged;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    const compactPadding = EdgeInsets.symmetric(horizontal: 10, vertical: 15);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE1E7E6)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 20,
            child: AppTextFormField(
              controller: controller.nameController,
              hintText: 'Ingrediente',
              textCapitalization: TextCapitalization.sentences,
              contentPadding: compactPadding,
              validator: _requiredField,
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            flex: 10,
            child: AppTextFormField(
              controller: controller.quantityController,
              hintText: '0',
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              contentPadding: compactPadding,
              validator: (value) {
                final quantity = double.tryParse(value?.trim() ?? '');
                if (quantity == null || quantity <= 0) {
                  return 'Ingresa una cantidad mayor que cero';
                }
                return null;
              },
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            flex: 14,
            child: DropdownButtonFormField<MeasurementUnit>(
              initialValue: controller.unit,
              isExpanded: true,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.navy,
              ),
              style: const TextStyle(color: AppColors.navy, fontSize: 15),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 14, 7, 14),
              ),
              items: MeasurementUnit.values.map((unit) {
                return DropdownMenuItem(
                  value: unit,
                  child: Text(unit.label, overflow: TextOverflow.ellipsis),
                );
              }).toList(),
              onChanged: (unit) {
                if (unit != null) onUnitChanged(unit);
              },
            ),
          ),
          const SizedBox(width: 2),
          IconButton(
            onPressed: onDelete,
            color: AppColors.danger,
            tooltip: 'Eliminar ingrediente',
            visualDensity: VisualDensity.compact,
            constraints: const BoxConstraints(minWidth: 40, minHeight: 48),
            icon: const Icon(Icons.delete_outline, size: 27),
          ),
        ],
      ),
    );
  }

  static String? _requiredField(String? value) {
    return value == null || value.trim().isEmpty ? '' : null;
  }
}
