import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';

class ItemDataRow extends StatelessWidget {
  final String title;
  final String amount;
  final bool isIncome;

  const ItemDataRow({
    super.key,
    required this.title,
    required this.amount,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w600, 
              color: AppColors.textDark,
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryTeal,
            ),
          ),
        ],
      ),
    );
  }
}