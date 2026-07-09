import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/view_toggle_bar.dart';
import '../widgets/daily_group_card.dart';
import 'transaction_detail.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int _activeToggle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Transaksi'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppDimensions.paddingLarge),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/320px-Flag_of_Indonesia.svg.png',
              width: AppDimensions.flagWidth,
              height: AppDimensions.flagHeight,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.paddingLarge),
        child: Column(
          children: [
            ViewToggleBar(
              selectedIndex: _activeToggle,
              onToggleChanged: (index) => setState(() => _activeToggle = index),
            ),
            const SizedBox(height: AppDimensions.paddingLarge),
            Container(
              padding: const EdgeInsets.all(AppDimensions.paddingMedium),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
              ),
              child: Row(
                children: [
                  Expanded(child: TextField(decoration: AppTheme.pickerInputDecoration('Value'), readOnly: true)),
                  const SizedBox(width: AppDimensions.paddingSmall),
                  Expanded(child: TextField(decoration: AppTheme.pickerInputDecoration('Value'), readOnly: true)),
                  const SizedBox(width: AppDimensions.paddingSmall),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryTeal,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.paddingLarge),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppDimensions.paddingLarge),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TransactionDetailScreen()),
                        );
                      },
                      child: DailyGroupCard(
                        headerText: _activeToggle == 0 
                            ? 'Hari Sesuai Tanggal / per hari' 
                            : 'Hari Sesuai Bulan',
                        totalIncome: 'Rp. 200.000',
                        totalExpense: 'Rp. 50.000',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}