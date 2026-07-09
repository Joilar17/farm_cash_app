import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';

class EmptyState extends StatelessWidget {
  final String message;

  const EmptyState({
    super.key,
    this.message = 'Belum ada data transaksi',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_late_outlined, size: 64, color: AppColors.textMutedLight),
          const SizedBox(height: AppDimensions.paddingMedium),
          Text(
            message,
            style: TextStyle(color: AppColors.textMuted, fontSize: 14),
          ),
        ],
      ),
    );
  }
}