import 'dart:ui';

class ExpenseModel {
  final String category;
  double amount;
  late String? amountLabel = _amountToString();

  ExpenseModel(this.category, this.amount);

  String? _amountToString() {
    switch (amount) {
      case > 1000:
        var num = amount / 1000;
        return '${num.toStringAsFixed(0)}K';
    }
    return amount.toStringAsFixed(0);
  }
}
