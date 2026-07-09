import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';

class NumericKeypad extends StatelessWidget {
  const NumericKeypad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingLarge),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.radiusLarge),
          topRight: Radius.circular(AppDimensions.radiusLarge),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: AppDimensions.paddingLarge),
            decoration: BoxDecoration(
              color: AppColors.fillGrey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2,
              mainAxisSpacing: AppDimensions.paddingSmall,
              crossAxisSpacing: AppDimensions.paddingSmall,
            ),
            itemCount: 12,
            itemBuilder: (context, index) {
              String label = '';
              if (index < 9) label = '${index + 1}';
              if (index == 9) label = '.';
              if (index == 10) label = '0';
              if (index == 11) label = '⌫';

              return InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
                child: Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}