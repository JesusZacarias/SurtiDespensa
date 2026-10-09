import 'package:flutter/material.dart';
import 'package:surtidespensa/features/recipes/models/measurement_unit.dart';

/// Estado editable de una fila de ingrediente.
///
/// Vive en `presentation` porque contiene TextEditingController, una clase de
/// Flutter que nunca debe entrar en los modelos del negocio ni en SQLite.
class IngredientFormController {
  IngredientFormController({
    String name = '',
    String quantity = '',
    this.unit = MeasurementUnit.piece,
  }) : nameController = TextEditingController(text: name),
       quantityController = TextEditingController(text: quantity);

  final TextEditingController nameController;
  final TextEditingController quantityController;
  MeasurementUnit unit;

  void dispose() {
    nameController.dispose();
    quantityController.dispose();
  }
}
