import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surtidespensa/app/router/app_router.dart';
import 'package:surtidespensa/app/theme/app_theme.dart';
import 'package:surtidespensa/features/recipes/data/recipe_repository.dart';

/// Prepara las dependencias globales y arranca la aplicación.
void startSurtiDespensa() {
  runApp(const SurtiDespensaApp());
}

/// Widget raíz de SurtiDespensa.
///
/// Su trabajo es ensamblar dependencias globales, tema y navegación.
/// No contiene reglas relacionadas con recetas.
class SurtiDespensaApp extends StatelessWidget {
  const SurtiDespensaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<RecipeRepository>(create: (_) => RecipeRepository()),
      ],
      child: MaterialApp.router(
        title: 'SurtiDespensa',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
