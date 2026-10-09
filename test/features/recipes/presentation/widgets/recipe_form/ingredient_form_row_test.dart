import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surtidespensa/features/recipes/presentation/controllers/ingredient_form_controller.dart';
import 'package:surtidespensa/features/recipes/presentation/widgets/recipe_form/ingredient_form_row.dart';

void main() {
  testWidgets('rechaza una cantidad que no es un número', (tester) async {
    // Preparar: el widget necesita un Form para ejecutar sus validadores.
    final formKey = GlobalKey<FormState>();
    final controller = IngredientFormController(name: 'Jitomate');
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Form(
            key: formKey,
            child: IngredientFormRow(
              controller: controller,
              onUnitChanged: (_) {},
              onDelete: () {},
            ),
          ),
        ),
      ),
    );

    // Actuar: el segundo TextFormField es el campo de cantidad.
    await tester.enterText(find.byType(TextFormField).at(1), 'abc');
    final isValid = formKey.currentState!.validate();
    await tester.pump();

    // Comprobar: el formulario falla y muestra el mensaje de ayuda.
    expect(isValid, isFalse);
    expect(find.text('Ingresa una cantidad mayor que cero'), findsOneWidget);
  });

  testWidgets('rechaza una cantidad igual a cero', (tester) async {
    final formKey = GlobalKey<FormState>();
    final controller = IngredientFormController(name: 'Jitomate');
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Form(
            key: formKey,
            child: IngredientFormRow(
              controller: controller,
              onUnitChanged: (_) {},
              onDelete: () {},
            ),
          ),
        ),
      ),
    );
    // Actuar: el segundo TextFormField es el campo de cantidad.
    await tester.enterText(find.byType(TextFormField).at(1), '0');
    final isValid = formKey.currentState!.validate();
    await tester.pump();

    // Comprobar: el formulario falla y muestra el mensaje de ayuda.
    expect(isValid, isFalse);
    expect(find.text('Ingresa una cantidad mayor que cero'), findsOneWidget);
  });
  testWidgets('acepta una cantidad decimal positiva', (tester) async {
    final formKey = GlobalKey<FormState>();
    final controller = IngredientFormController(name: 'Jitomate');
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Form(
            key: formKey,
            child: IngredientFormRow(
              controller: controller,
              onUnitChanged: (_) {},
              onDelete: () {},
            ),
          ),
        ),
      ),
    );
    // El segundo TextFormField es el campo de cantidad.
    await tester.enterText(find.byType(TextFormField).at(1), '2.5');
    final isValid = formKey.currentState!.validate();
    await tester.pump();

    // Comprobar: el formulario falla y muestra el mensaje de ayuda.
    expect(isValid, isTrue);
    expect(find.text('Ingresa una cantidad mayor que cero'), findsNothing);
  });
}
