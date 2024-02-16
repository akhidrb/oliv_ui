import 'package:flutter/material.dart';
import 'package:oliv_ui/expense_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ExpenseRepo {
  static List<ExpenseModel> getExpenses() {
    final total = ExpenseRepo.getTotalExpense(_expenses);
    return _constructOther(_expenses, total);
  }

  static List<ExpenseModel> _constructOther(
      List<ExpenseModel> expenses, ExpenseModel total) {
    List<ExpenseModel> expList = expenses;
    ExpenseModel other = ExpenseModel('other', 0);
    var toRemove = [];

    for (var e in expenses) {
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

  static ExpenseModel getTotalExpense(List<ExpenseModel> expenses) {
    double sum = 0;
    for (var e in expenses) {
      sum += e.amount;
    }
    return ExpenseModel('Total', sum);
  }

  static List<ExpenseModel> getSubCategories(String category) {
    List<ExpenseModel> expenses;
    switch (category) {
      case 'housing':
        expenses = _housing;
        break;
      case 'commute':
        expenses = _commute;
        break;
      case 'activities':
        expenses = _activities;
        break;
      case 'outings':
        expenses = _outings;
        break;
      default:
        expenses = _expenses;
        break;
    }
    final total = ExpenseRepo.getTotalExpense(expenses);
    return _constructOther(expenses, total);
  }
}

List<ExpenseModel> _expenses = [
  ExpenseModel('housing', 77050),
  ExpenseModel('commute', 66200),
  ExpenseModel('activities', 25100),
  ExpenseModel('outings', 20000),
];

List<ExpenseModel> _housing = [
  ExpenseModel('electricity', 10000),
  ExpenseModel('gas', 10000),
  ExpenseModel('water', 10000),
  ExpenseModel('rent', 40000),
  ExpenseModel('home', 7050),
];

List<ExpenseModel> _commute = [
  ExpenseModel('travel', 33200),
  ExpenseModel('car', 33000),
];

List<ExpenseModel> _activities = [
  ExpenseModel('climbing', 10000),
  ExpenseModel('rowing', 10000),
  ExpenseModel('jiu jujitsu', 5100),
];

List<ExpenseModel> _outings = [
  ExpenseModel('restaurants', 5000),
  ExpenseModel('movies', 10000),
  ExpenseModel('cafes', 5000),
];
