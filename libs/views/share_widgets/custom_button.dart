import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryTeal,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingMedium),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        ),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}