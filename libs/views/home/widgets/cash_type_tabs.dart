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
          // 1. Pass the 'context' parameter down into the helper method here
          _buildTab(context, 0, 'Pemasukkan'),
          _buildTab(context, 1, 'Pengeluaran'),
        ],
      ),
    );
  }

  // 2. Accept the BuildContext inside your helper method signatures
  Widget _buildTab(BuildContext context, int index, String label) {
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
            // 3. This is where you swap out the raw TextStyle setup!
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isSelected ? AppColors.textDark : AppColors.textMuted,
                ),
          ),
        ),
      ),
    );
  }
}