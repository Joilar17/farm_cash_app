import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';

class HistoricalTrend extends StatelessWidget {
  const HistoricalTrend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Statistik', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),
          const SizedBox(height: AppDimensions.paddingLarge),
          SizedBox(
            height: AppDimensions.chartHeight,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 5,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(color: Colors.grey, fontSize: 12);
                        switch (value.toInt()) {
                          case 0: return const Text('Jan', style: style);
                          case 1: return const Text('Feb', style: style);
                          case 2: return const Text('Mar', style: style);
                          case 3: return const Text('Apr', style: style);
                          case 4: return const Text('May', style: style);
                          default: return const Text('');
                        }
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 80,
                      getTitlesWidget: (value, meta) {
                        return Text('Rp.${value.toInt()}.000.000', style: const TextStyle(color: Colors.grey, fontSize: 10));
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(color: AppColors.fillGrey, strokeWidth: 1),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  _makeBarGroup(0, 2.0, 4.0),
                  _makeBarGroup(1, 2.3, 4.8),
                  _makeBarGroup(2, 2.6, 4.3),
                  _makeBarGroup(3, 2.8, 3.4),
                  _makeBarGroup(4, 2.0, 3.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData _makeBarGroup(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: AppColors.primaryTeal, width: 8, borderRadius: BorderRadius.circular(4)),
        BarChartRodData(toY: y2, color: AppColors.darkTeal, width: 8, borderRadius: BorderRadius.circular(4)),
      ],
    );
  }
}