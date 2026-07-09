import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimensions.dart';

class AppTheme {
  // Global Light Theme Configurator
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.textDark,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        iconTheme: IconThemeData(color: AppColors.textDark),
      ),
    );
  }

  // Shared Structural Component Styles
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      );

  // Reusable Form Input Customizer
  static InputDecoration pickerInputDecoration(String hint) => InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.textMuted),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.paddingMedium, 
          vertical: AppDimensions.paddingSmall,
        ),
        suffixIcon: Icon(
          Icons.calendar_today_outlined, 
          size: AppDimensions.iconSmall, 
          color: AppColors.textMuted,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
          borderSide: BorderSide(color: AppColors.borderGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
          borderSide: BorderSide(color: AppColors.borderGrey),
        ),
      );
}