import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:surtidespensa/features/recipes/data/recipe_repository.dart';
import 'package:surtidespensa/features/recipes/presentation/screens/recipe_form_screen.dart';
import 'package:surtidespensa/features/recipes/presentation/screens/recipe_list_screen.dart';
import 'package:surtidespensa/features/recipes/presentation/view_models/recipe_form_view_model.dart';
import 'package:surtidespensa/features/recipes/presentation/view_models/recipe_list_view_model.dart';

/// Configura las rutas y crea los ViewModels propios de cada pantalla.
abstract final class AppRouter {
  static const recipeListPath = '/';
  static const recipeFormPath = '/recipes/new';

  static final router = GoRouter(
    initialLocation: recipeListPath,
    routes: [
      GoRoute(
        path: recipeListPath,
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (context) =>
                RecipeListViewModel(context.read<RecipeRepository>())..load(),
            child: const RecipeListScreen(),
          );
        },
      ),
      GoRoute(
        path: recipeFormPath,
        name: RecipeFormScreen.name,
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (context) => RecipeFormViewModel(context.read<RecipeRepository>()),
            child: const RecipeFormScreen(),
          );
        },
      ),
    ],
  );
}
