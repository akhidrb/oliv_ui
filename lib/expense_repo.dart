import 'package:flutter/material.dart';
import 'package:oliv_ui/expense_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseRepo {
  static List<ExpenseModel> getExpenses() {
    final total = ExpenseRepo.getTotalExpense();
    List<ExpenseModel> expList = _expenses;
    ExpenseModel other = ExpenseModel('other', 0);
    var toRemove = [];

    for (var e in _expenses) {
      if (e.amount < total.amount * 0.05) {
        other.amount += e.amount;
        toRemove.add(e);
      }
    }
    expList.removeWhere((element) => toRemove.contains(element));
    if (other.amount > 0) {
      expList.add(other);
    }
    return expList;
  }

  static ExpenseModel getTotalExpense() {
    double sum = 0;
    for (var e in _expenses) {sum += e.amount;}
    return ExpenseModel('Total', sum);
  }

}

List<ExpenseModel> _expenses = [
  ExpenseModel('housing', 77050),
  ExpenseModel('travel', 70500),
  ExpenseModel('commute', 66200),
  ExpenseModel('kids', 20301),
  ExpenseModel('activities', 25100),
  ExpenseModel('outings', 20000),
  ExpenseModel('rent', 13000),
  ExpenseModel('home', 7000),
];
