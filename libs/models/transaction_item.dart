class TransactionItem {
  final String id;
  final String title;
  final double amount;
  final bool isIncome;
  final DateTime date;

  const TransactionItem({
    required this.id,
    required this.title,
    required this.amount,
    required this.isIncome,
    required this.date,
  });

  // Reusable deep-copy cloning method for state mutations
  TransactionItem copyWith({
    String? id,
    String? title,
    double? amount,
    bool? isIncome,
    DateTime? date,
  }) {
    return TransactionItem(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      isIncome: isIncome ?? this.isIncome,
      date: date ?? this.date,
    );
  }
}