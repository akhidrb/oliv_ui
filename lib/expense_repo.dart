import 'package:flutter/material.dart';
import 'package:oliv_ui/expense_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseRepo {
  static List<ExpenseModel> getExpenses() {
    return [
      ExpenseModel('housing', 77050),
      ExpenseModel('travel', 70500),
      ExpenseModel('commute', 66200),
      ExpenseModel('kids', 20301),
      ExpenseModel('activities', 20100),
      ExpenseModel('outings', 12000),
      ExpenseModel('rent', 10000),
      ExpenseModel('home', 7000),
      ExpenseModel('other', 7000),
    ];
  }

  static ExpenseModel getTotalExpense() {
    double sum = 0;
    getExpenses().forEach((e){sum += e.amount;});
    return ExpenseModel('Total', sum);
  }

}
