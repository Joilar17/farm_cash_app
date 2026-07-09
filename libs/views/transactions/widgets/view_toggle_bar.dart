import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';

class ViewToggleBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onToggleChanged;

  const ViewToggleBar({
    super.key,
    required this.selectedIndex,
    required this.onToggleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fillGrey,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Row(
        children: [
          _buildButton(0, 'Harian'),
          _buildButton(1, 'Bulanan'),
        ],
      ),
    );
  }

  Widget _buildButton(int index, String label) {
    final isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onToggleChanged(index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppDimensions.paddingMedium),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.textDark : AppColors.textMuted,
            ),
          ),
        ),
      ),
    );
  }
}