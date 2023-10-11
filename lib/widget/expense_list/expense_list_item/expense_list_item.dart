import 'package:expenses_track/model/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseListItem extends StatelessWidget {
  const ExpenseListItem({super.key, required this.expenseList});

  final ExpenseListModel expenseList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3),
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expenseList.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  Text(
                    "\$${expenseList.amount.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const Spacer(),
                  Icon(
                    categoryIcons[expenseList.category],
                    size: 25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    expenseList.formattedDate,
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
