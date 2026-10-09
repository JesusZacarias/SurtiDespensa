import 'package:flutter/material.dart';
import 'package:surtidespensa/app/theme/app_colors.dart';

/// Contenedor visual reutilizable para agrupar campos relacionados.
///
/// Es global porque no conoce conceptos de recetas; cualquier formulario de
/// la aplicación puede usarlo conservando el mismo espaciado y color.
class AppFormSection extends StatelessWidget {
  const AppFormSection({
    required this.title,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 16, 16, 20),
    super.key,
  });

  final String title;
  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.palePrimary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall
                ?.copyWith(color: AppColors.navy, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
