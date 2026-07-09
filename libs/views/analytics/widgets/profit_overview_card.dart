import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';

class ProfitOverviewCard extends StatelessWidget {
  final String totalProfit;
  final String percentage;

  const ProfitOverviewCard({
    super.key,
    required this.totalProfit,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimensions.paddingXLarge),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColors.profitGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Total Keuntungan',
            style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: AppDimensions.paddingSmall),
          Text(
            totalProfit,
            style: const TextStyle(color: AppColors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: AppDimensions.paddingLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.arrow_upward, color: AppColors.white, size: 16),
              const SizedBox(width: 4),
              Text(
                'Presentasi Keuntungan $percentage',
                style: const TextStyle(color: AppColors.white, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}