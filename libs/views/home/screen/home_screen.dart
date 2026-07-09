import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/cash_type_tabs.dart';
import '../widgets/item_data_row.dart';
import '../widgets/numeric_keypad.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeTab = 0;

  void _showNumericKeypad() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const NumericKeypad(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Safely pulling the theme context for dynamic use
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        // 1. The AppBar title automatically consumes theme.appBarTheme.titleTextStyle (Roboto)
        title: const Text('Beranda'),
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
            CashTypeTabs(
              selectedIndex: _activeTab,
              onTabChanged: (index) => setState(() => _activeTab = index),
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
                  Expanded(
                    child: TextField(
                      decoration: AppTheme.pickerInputDecoration('Value'), 
                      readOnly: true,
                      style: theme.textTheme.bodyMedium, // 2. Forces input text to use Roboto
                    ),
                  ),
                  const SizedBox(width: AppDimensions.paddingSmall),
                  Expanded(
                    child: TextField(
                      decoration: AppTheme.pickerInputDecoration('Value'), 
                      readOnly: true,
                      style: theme.textTheme.bodyMedium, // 3. Forces input text to use Roboto
                    ),
                  ),
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
                    child: Text(
                      'Submit',
                      // 4. Merging weight onto bodyMedium while retaining the Roboto font family
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.paddingXLarge),
            Expanded(
              child: ListView(
                children: [
                  ItemDataRow(title: 'Pupuk', amount: 'Rp. 100.000', isIncome: _activeTab == 0),
                  const SizedBox(height: AppDimensions.paddingMedium),
                  ItemDataRow(title: 'Bensin', amount: 'Rp. 150.000', isIncome: _activeTab == 0),
                  const SizedBox(height: AppDimensions.paddingXLarge),
                  IconButton(
                    iconSize: AppDimensions.iconXLarge,
                    icon: const Icon(Icons.add_circle_outline, color: AppColors.softCircleMint),
                    onPressed: _showNumericKeypad,
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