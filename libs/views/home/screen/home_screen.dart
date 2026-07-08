import 'package:flutter/material.dart';
import '../widgets/cash_type_tabs.dart';
import '../widgets/item_data_row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeTab = 0; // 0: Pemasukkan, 1: Pengeluaran

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () {},
        ),
        title: const Text(
          'Beranda',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Flag_of_Indonesia.svg/320px-Flag_of_Indonesia.svg.png',
              width: 30,
              height: 20,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tab Selector Pemasukkan / Pengeluaran
            CashTypeTabs(
              selectedIndex: _activeTab,
              onTabChanged: (index) {
                setState(() {
                  _activeTab = index;
                });
              },
            ),
            const SizedBox(height: 16),

            // Date Picker Pickers & Submit Button Box
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(child: _buildDatePickerButton('Value')),
                  const SizedBox(width: 8),
                  Expanded(child: _buildDatePickerButton('Value')),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF76C4BB),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Transaction List Stream Builder / List View
            Expanded(
              child: ListView(
                children: [
                  ItemDataRow(
                    title: 'Pupuk',
                    amount: 'Rp. 100.000',
                    isIncome: _activeTab == 0,
                  ),
                  const SizedBox(height: 12),
                  ItemDataRow(
                    title: 'Bensin',
                    amount: 'Rp. 150.000',
                    isIncome: _activeTab == 0,
                  ),
                  const SizedBox(height: 24),
                  
                  // Centralized Add Button Interface
                  IconButton(
                    iconSize: 48,
                    icon: const Icon(Icons.add_circle_outline, color: Color(0xFFB2DFDB)),
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

  Widget _buildDatePickerButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.between,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          const Icon(Icons.calendar_today_outlined, size: 16, color: Colors.black45),
        ],
      ),
    );
  }
}