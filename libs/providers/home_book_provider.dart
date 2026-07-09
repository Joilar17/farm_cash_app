import 'package:flutter/foundation.dart';
import '../models/transaction_item.dart';

class HomeBookProvider extends ChangeNotifier {
  final List<TransactionItem> _liveTransactions = [
    TransactionItem(id: '1', title: 'Pupuk', amount: 100000, isIncome: true, date: DateTime.now()),
    TransactionItem(id: '2', title: 'Bensin', amount: 150000, isIncome: false, date: DateTime.now()),
  ];
  
  String _keypadValue = "";

  List<TransactionItem> get liveTransactions => List.unmodifiable(_liveTransactions);
  String get keypadValue => _keypadValue.isEmpty ? "0" : _keypadValue;

  // Character inputs from screen keypad triggers
  void appendKeypadValue(String character) {
    if (character == '.' && _keypadValue.contains('.')) return;
    if (character == '⌫') {
      removeLastKeypadDigit();
      return;
    }
    _keypadValue += character;
    notifyListeners();
  }

  void removeLastKeypadDigit() {
    if (_keypadValue.isNotEmpty) {
      _keypadValue = _keypadValue.substring(0, _keypadValue.length - 1);
      notifyListeners();
    }
  }

  void clearKeypadValue() {
    _keypadValue = "";
    notifyListeners();
  }

  void commitNewTransaction(String title, bool isIncome) {
    final parsedAmount = double.tryParse(_keypadValue) ?? 0.0;
    if (parsedAmount <= 0 || title.isEmpty) return;

    final newItem = TransactionItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      amount: parsedAmount,
      isIncome: isIncome,
      date: DateTime.now(),
    );

    _liveTransactions.insert(0, newItem);
    clearKeypadValue();
  }
}