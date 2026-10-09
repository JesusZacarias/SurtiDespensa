import 'package:flutter/material.dart';
import 'package:surtidespensa/app/theme/app_colors.dart';

/// Selector propio de una receta para aumentar o disminuir sus porciones base.
class BaseServingsSelector extends StatelessWidget {
  const BaseServingsSelector({
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    super.key,
  });

  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.symmetric(horizontal: 9),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          _PortionButton(icon: Icons.remove, onPressed: onDecrement),
          Expanded(
            child: Text(
              '$value personas',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.navy,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _PortionButton(icon: Icons.add, onPressed: onIncrement),
        ],
      ),
    );
  }
}

class _PortionButton extends StatelessWidget {
  const _PortionButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryContainer,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(icon, color: AppColors.primary, size: 27),
        ),
      ),
    );
  }
}
