import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:surtidespensa/features/recipes/models/ingredient.dart';
import 'package:surtidespensa/features/recipes/models/quantity.dart';
import 'package:surtidespensa/features/recipes/models/recipe.dart';
import 'package:surtidespensa/features/recipes/models/recipe_ingredient.dart';
import 'package:surtidespensa/features/recipes/presentation/view_models/recipe_form_view_model.dart';
import 'package:surtidespensa/app/theme/app_colors.dart';
import 'package:surtidespensa/core/presentation/widgets/app_bottom_action_button.dart';
import 'package:surtidespensa/features/recipes/models/measurement_unit.dart';
import 'package:surtidespensa/features/recipes/presentation/controllers/ingredient_form_controller.dart';
import 'package:surtidespensa/features/recipes/presentation/widgets/recipe_form/recipe_basic_information_section.dart';
import 'package:surtidespensa/features/recipes/presentation/widgets/recipe_form/recipe_ingredients_section.dart';

/// Coordina el estado visual y el ciclo de vida del formulario.
///
/// La implementación original concentraba estilos, filas y secciones aquí.
/// Se separaron en widgets para que esta clase solo ensamble la pantalla y
/// administre los controllers que necesitan `dispose`.
class RecipeFormScreen extends StatefulWidget {
  static const name = 'recipe-form';

  const RecipeFormScreen({super.key});

  @override
  State<RecipeFormScreen> createState() => _RecipeFormScreenState();
}

class _RecipeFormScreenState extends State<RecipeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ingredientControllers = <IngredientFormController>[];

  int _baseServings = 3;

  @override
  void initState() {
    super.initState();

    // Iniciamos con una fila vacía, no con ingredientes ficticios. El usuario
    // entiende inmediatamente qué debe capturar y el formulario sigue limpio.
    _ingredientControllers.add(IngredientFormController());
  }

  @override
  void dispose() {
    _nameController.dispose();
    for (final controller in _ingredientControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _incrementServings() {
    setState(() => _baseServings++);
  }

  void _decrementServings() {
    if (_baseServings <= 1) return;
    setState(() => _baseServings--);
  }

  void _addIngredient() {
    setState(() => _ingredientControllers.add(IngredientFormController()));
  }

  void _deleteIngredient(int index) {
    final removedController = _ingredientControllers[index];
    setState(() => _ingredientControllers.removeAt(index));
    removedController.dispose();
  }

  void _changeIngredientUnit(int index, MeasurementUnit unit) {
    // La unidad cambia dentro del estado local del formulario. No hace falta
    // redibujar toda la pantalla porque el Dropdown ya muestra la selección.
    _ingredientControllers[index].unit = unit;
  }

  void _submit() async {
    FocusScope.of(context).unfocus();
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;
    const uuid = Uuid();

    final ingredients = _ingredientControllers.map((controller) {
      final ingredient = Ingredient(
        id: uuid.v4(),
        name: controller.nameController.text,
      );

      return RecipeIngredient(
        ingredient: ingredient,
        quantity: Quantity(
          double.parse(controller.quantityController.text.trim()),
        ),
        unit: controller.unit,
      );
    }).toList();

    final recipe = Recipe(
      id: uuid.v4(),
      name: _nameController.text,
      baseServings: _baseServings,
      ingredients: ingredients,
    );

    await context.read<RecipeFormViewModel>().saveRecipe(recipe);

    if (!mounted) return;
    context.pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          child: Column(
            children: [
              RecipeBasicInformationSection(
                nameController: _nameController,
                baseServings: _baseServings,
                onIncrementServings: _incrementServings,
                onDecrementServings: _decrementServings,
              ),
              const SizedBox(height: 12),
              RecipeIngredientsSection(
                ingredients: _ingredientControllers,
                onAdd: _addIngredient,
                onDelete: _deleteIngredient,
                onUnitChanged: _changeIngredientUnit,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomActionButton(
        label: 'Guardar receta',
        onPressed: _submit,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: 78,
      elevation: 1,
      shadowColor: Colors.black26,
      leadingWidth: 72,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.arrow_back, size: 30),
        ),
      ),
      titleSpacing: 0,
      title: const Text(
        'Nueva receta',
        style: TextStyle(
          color: AppColors.navy,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}
