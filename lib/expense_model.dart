class ExpenseModel {
  final String category;
  final double amount;
  late String? amountLabel = _amountToString();

  ExpenseModel(this.category, this.amount);

  String? _amountToString() {
    switch (amount) {
      case > 1000:
        var num = amount / 1000;
        return '${num.toStringAsFixed(0)}K';
    }
    return null;
  }
}
