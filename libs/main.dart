import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'views/main_navigation.dart';

void main() {
  // Ensures Flutter framework services are fully initialized before the app runs
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Farm Cash App',
      
      // Turns off the debug banner in the top-right corner for a clean look
      debugShowCheckedModeBanner: false,
      
      // Injects your centralized professional design system globally
      theme: AppTheme.lightTheme,
      
      // Launches the tab navigation controller as the default starting screen
      home: const MainNavigationScreen(),
    );
  }
}