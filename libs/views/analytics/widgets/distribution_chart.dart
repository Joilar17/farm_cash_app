import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';

class DistributionChart extends StatelessWidget {
  const DistributionChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alokasi Kas',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textDark),
          ),
          SizedBox(height: AppDimensions.paddingMedium),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppDimensions.paddingMedium),
              child: Text(
                'Data Pipeline Matrix Stack Ready',
                style: TextStyle(color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
              ),
            ),
          )
        ],
      ),
    );
  }
}