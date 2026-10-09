import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:surtidespensa/features/recipes/presentation/screens/recipe_form_screen.dart';
import 'package:surtidespensa/features/recipes/presentation/view_models/recipe_list_view_model.dart';
import 'package:surtidespensa/features/recipes/presentation/widgets/recipe_card.dart';

/// Pantalla que observa el ViewModel y dibuja su estado.
class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeListViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Mis recetas')),
      body: _RecipeListBody(viewModel: viewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushNamed(RecipeFormScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _RecipeListBody extends StatelessWidget {
  const _RecipeListBody({required this.viewModel});

  final RecipeListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return switch (viewModel.status) {
      RecipeListStatus.initial || RecipeListStatus.loading => const Center(
        child: CircularProgressIndicator(),
      ),
      RecipeListStatus.failure => Center(
        child: Text(viewModel.errorMessage ?? 'Ocurrió un error.'),
      ),
      RecipeListStatus.success when viewModel.recipes.isEmpty => const Center(
        child: Text('Todavía no tienes recetas.'),
      ),
      RecipeListStatus.success => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: viewModel.recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(recipe: viewModel.recipes[index]);
        },
      ),
    };
  }
}
