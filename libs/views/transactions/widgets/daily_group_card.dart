import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';

class DailyGroupCard extends StatelessWidget {
  final String headerText;
  final String totalIncome;
  final String totalExpense;

  const DailyGroupCard({
    super.key,
    required this.headerText,
    required this.totalIncome,
    required this.totalExpense,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.paddingLarge, 
            vertical: AppDimensions.paddingMedium,
          ),
          decoration: const BoxDecoration(
            color: AppColors.lightHeaderTeal,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimensions.radiusMedium),
              topRight: Radius.circular(AppDimensions.radiusMedium),
            ),
          ),
          child: Text(
            headerText,
            style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(AppDimensions.paddingLarge),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(AppDimensions.radiusMedium),
              bottomRight: Radius.circular(AppDimensions.radiusMedium),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Pemasukkan', style: TextStyle(fontWeight: FontWeight.w500)),
                  Text(totalIncome, style: const TextStyle(color: AppColors.primaryTeal, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: AppDimensions.paddingMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Pengeluaran', style: TextStyle(fontWeight: FontWeight.w500)),
                  Text(totalExpense, style: const TextStyle(color: AppColors.primaryTeal, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}