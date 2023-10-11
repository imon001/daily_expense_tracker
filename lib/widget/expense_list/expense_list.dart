import 'package:expenses_track/model/expense_model.dart';
import 'package:expenses_track/widget/expense_list/expense_list_item/expense_list_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenseList, required this.removeExpense});

  final List<ExpenseListModel> expenseList;
  final void Function(ExpenseListModel expenseListModel) removeExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (context, index) => Dismissible(
              key: ValueKey(expenseList[index]),
              onDismissed: (direction) {
                removeExpense(expenseList[index]);
              },
              background: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(60, 244, 67, 54),
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: ExpenseListItem(expenseList: expenseList[index]),
            ));
  }
}
