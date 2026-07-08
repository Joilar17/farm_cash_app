import 'package:flutter/material.dart';
import 'home/screens/home_screen.dart';
import 'transactions/screens/transaction_screen.dart';
import 'analytics/screens/analytics_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // Daftar halaman yang diurutkan sesuai ikon dari kiri ke kanan
  final List<Widget> _screens = [
    const HomeScreen(),
    const TransactionScreen(),
    const AnalyticsScreen(),
    const Scaffold(body: Center(child: Text('Profil Screen (Placeholder)'))),
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
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ],
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF76C4BB), // Warna hijau toska sesuai tema
          unselectedItemColor: Colors.grey.shade400,
          showSelectedLabels: false,   // Menyembunyikan label sesuai design mockup
          showUnselectedLabels: false, // Hanya menampilkan ikon saja
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 28),
              activeIcon: Icon(Icons.home, size: 28),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart, size: 28),
              label: 'Aktivitas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined, size: 28),
              label: 'Analitik',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 28),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}