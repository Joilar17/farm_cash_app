import 'package:flutter/foundation.dart';
import '../models/transaction_item.dart';

class TransactionProvider extends ChangeNotifier {
  bool _isMonthlyView = false;
  DateTime? _startDate;
  DateTime? _endDate;

  bool get isMonthlyView => _isMonthlyView;
  DateTime? get startDate => _startDate;
  DateTime? get endDate => _endDate;

  void toggleViewFormat(int navigationIndex) {
    _isMonthlyView = (navigationIndex == 1);
    notifyListeners();
  }

  void updateFilterRange(DateTime? start, DateTime? end) {
    _startDate = start;
    _endDate = end;
    notifyListeners();
  }

  // Processes raw historical transaction arrays into UI aggregate containers
  List<TransactionItem> filterLoggedHistory(List<TransactionItem> completePool) {
    return completePool.where((item) {
      if (_startDate != null && item.date.isBefore(_startDate!)) return false;
      if (_endDate != null && item.date.isAfter(_endDate!)) return false;
      return true;
    }).toList();
  }
}