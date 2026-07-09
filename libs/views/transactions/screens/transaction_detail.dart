import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../home/widgets/item_data_row.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Transaksi'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingLarge),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingLarge, 
                vertical: AppDimensions.paddingMedium,
              ),
              decoration: BoxDecoration(
                color: AppColors.lightHeaderTeal,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              ),
              child: const Text(
                'Detail Transaksi (Tanggal Harian/Bulan)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.white, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.paddingLarge),
            Expanded(
              child: ListView(
                children: [
                  const ItemDataRow(title: 'Pupuk', amount: 'Rp. 100.000', isIncome: true),
                  const SizedBox(height: AppDimensions.paddingMedium),
                  const ItemDataRow(title: 'Bensin', amount: 'Rp. 150.000', isIncome: true),
                  const SizedBox(height: AppDimensions.paddingXLarge),
                  IconButton(
                    iconSize: AppDimensions.iconXLarge,
                    icon: const Icon(Icons.add_circle_outline, color: AppColors.softCircleMint),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}