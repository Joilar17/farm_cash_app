import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';

class CashTypeTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const CashTypeTabs({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
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
          _buildTab(0, 'Pemasukkan'),
          _buildTab(1, 'Pengeluaran'),
        ],
      ),
    );
  }

  Widget _buildTab(int index, String label) {
    final isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onTabChanged(index),
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