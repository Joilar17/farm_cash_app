import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../widgets/profit_overview_card.dart';
import '../widgets/distribution_chart.dart';
import '../widgets/historical_trend.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.all(AppDimensions.paddingSmall),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, size: AppDimensions.iconMedium),
            onPressed: () {},
          ),
        ),
        title: const Text('Presentasi Keuntungan'),
        actions: [
          Container(
            margin: const EdgeInsets.all(AppDimensions.paddingSmall),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_none, size: AppDimensions.iconMedium),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.paddingLarge),
        child: Column(
          children: [
            const ProfitOverviewCard(totalProfit: 'Rp.1.500.000', percentage: '30%'),
            const SizedBox(height: AppDimensions.paddingXLarge),
            _buildStatProgressBar('Pemasukkan', 0.75, '+%25', AppColors.primaryTeal),
            const SizedBox(height: AppDimensions.paddingMedium),
            _buildStatProgressBar('Pengeluaran', 0.45, '+%14', AppColors.darkTeal),
            const SizedBox(height: AppDimensions.paddingXLarge),
            const DistributionChart(),
            const SizedBox(height: AppDimensions.paddingXLarge),
            const HistoricalTrend(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatProgressBar(String title, double value, String percentage, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    title == 'Pemasukkan' ? Icons.arrow_upward : Icons.arrow_downward,
                    color: color,
                  ),
                  const SizedBox(width: AppDimensions.paddingSmall),
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
              Text(percentage, style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: AppDimensions.paddingMedium),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: AppColors.fillGrey,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: AppDimensions.progressIndicatorHeight,
            ),
          ),
        ],
      ),
    );
  }
}