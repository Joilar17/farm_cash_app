import 'package:flutter/foundation.dart';
import '../models/transaction_item.dart';

class AnalyticsProvider extends ChangeNotifier {
  // Calculates lifetime performance summary indicators
  double calculateLifetimeNetProfit(List<TransactionItem> transactions) {
    double total = 0.0;
    for (var item in transactions) {
      if (item.isIncome) {
        total += item.amount;
      } else {
        total -= item.amount;
      }
    }
    return total;
  }

  double calculateAllocationRatio(List<TransactionItem> transactions, bool fetchIncomeRatio) {
    double totalIncome = 0.0;
    double totalExpense = 0.0;

    for (var item in transactions) {
      if (item.isIncome) {
        totalIncome += item.amount;
      } else {
        totalExpense += item.amount;
      }
    }

    double combinedVolume = totalIncome + totalExpense;
    if (combinedVolume == 0) return 0.0;

    return fetchIncomeRatio ? (totalIncome / combinedVolume) : (totalExpense / combinedVolume);
  }
}