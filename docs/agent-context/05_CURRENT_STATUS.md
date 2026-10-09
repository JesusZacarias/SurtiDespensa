# Estado actual

Fecha de referencia: **9 de octubre de 2026**.

Este archivo debe verificarse contra el código al comenzar una nueva sesión.

## Implementado

- Proyecto Flutter y navegación con GoRouter.
- Provider registrado para repositorios y ViewModels de recetas.
- Estilo visual inicial y componentes reutilizables del formulario.
- Modelos iniciales:
  - `Ingredient`
  - `Quantity`
  - `MeasurementUnit`
  - `RecipeIngredient`
  - `Recipe`
- Validaciones de nombre, cantidad, porciones e ingredientes duplicados.
- Catálogo inicial de recetas.
- Formulario de nueva receta con filas dinámicas de ingredientes.
- Conversión de los controladores del formulario a modelos del dominio.
- Guardado a través de `RecipeFormViewModel` y `RecipeRepository`.
- Repositorio temporal en memoria.
- Pruebas iniciales de modelos, ViewModel y validación del formulario.

## Comportamiento confirmado por el usuario

- El formulario permite crear y guardar una receta.
- Después de guardar, la receta todavía no aparece automáticamente en el
  catálogo inicial.

## Siguiente tarea exacta

Recargar `RecipeListViewModel` cuando el formulario devuelva `true`:

```dart
final wasSaved = await context.pushNamed<bool>(RecipeFormScreen.name);

if (wasSaved == true && context.mounted) {
  await context.read<RecipeListViewModel>().load();
}
```

El formulario debe regresar con `context.pop(true)` únicamente después de que el
repositorio confirme el guardado.

## Después de esa tarea

1. Añadir una prueba de widget/integración para crear y mostrar una receta.
2. Incorporar estado de guardado y manejo de error en `RecipeFormViewModel`.
3. Implementar SQLite y migrar el repositorio en memoria.
4. Completar editar y eliminar recetas.
5. Comenzar el modelo del planificador semanal.

## Limitaciones conocidas

- Las recetas actuales se pierden al reiniciar porque viven en memoria.
- El CRUD de recetas todavía no está completo.
- Planner, shopping list, history y sync aún no están implementados.
- La última ejecución automatizada de análisis/pruebas debe confirmarse en el
  entorno local; no asumir que la suite está en verde sin ejecutarla.

## Comandos de comprobación

```powershell
dart format lib test
flutter analyze
flutter test
flutter build apk --debug
```

