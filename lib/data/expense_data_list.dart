import '../model/expense_model.dart';

class AllExpenseList {
  List<ExpenseListModel> dummyList = [
    ExpenseListModel(
      title: "flutter course",
      amount: 14.90,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseListModel(
      title: "Avatar two",
      amount: 18.90,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    ExpenseListModel(
      title: "Grocery",
      amount: 11.70,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];
}
