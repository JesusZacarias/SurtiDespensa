import 'package:flutter/material.dart';
import 'package:surtidespensa/app/theme/app_colors.dart';

/// Campo de texto con el aspecto general de SurtiDespensa.
///
/// El tema global contiene los bordes y colores. Este widget reúne las
/// opciones comunes para que cada pantalla se concentre en sus validaciones.
class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.controller,
    this.hintText,
    this.validator,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding,
    super.key,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      style: const TextStyle(color: AppColors.navy, fontSize: 17),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: contentPadding,
      ),
      validator: validator,
    );
  }
}
