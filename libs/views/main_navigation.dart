import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_dimensions.dart';
import 'home/screen/home_screen.dart';
import 'transactions/screens/transaction_screen.dart';
import 'analytics/screens/analytics_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const TransactionScreen(),
    const AnalyticsScreen(),
    const Scaffold(body: Center(child: Text('Profile Screen'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.18),
              blurRadius: 10,              
              offset: const Offset(0, -5),
            ),
          ],
        ), // <-- FIXED: Changed from ], to ), to properly close BoxDecoration
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryTeal,
          unselectedItemColor: AppColors.textMutedLight,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: AppDimensions.iconLarge),
              activeIcon: Icon(Icons.home, size: AppDimensions.iconLarge),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart, size: AppDimensions.iconLarge),
              label: 'Aktivitas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined, size: AppDimensions.iconLarge),
              label: 'Analitik',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: AppDimensions.iconLarge),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}