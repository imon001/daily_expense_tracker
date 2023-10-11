import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final dateFormate = DateFormat.yMd();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie_creation,
  Category.work: Icons.work,
};

class ExpenseListModel {
  ExpenseListModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return dateFormate.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket(this.category, this.expenseList);

  ExpenseBucket.forCategory(
    List<ExpenseListModel> totalExpense,
    this.category,
  ) : expenseList = totalExpense.where((expense) => expense.category == category).toList();

  final Category category;
  final List<ExpenseListModel> expenseList;

  double get totalExpense {
    double sum = 0;

    for (final expense in expenseList) {
      sum += expense.amount;
    }

    return sum;
  }
}
