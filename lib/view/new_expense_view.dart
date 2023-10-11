import 'package:expenses_track/model/expense_model.dart';
import 'package:flutter/material.dart';

import '../widget/new_expense_list/new_expense_items.dart';

class NewExpenseView extends StatefulWidget {
  const NewExpenseView({super.key, required this.onAddExpense});

  final void Function(ExpenseListModel expenseListModel) onAddExpense;
  @override
  State<NewExpenseView> createState() => _NewExpenseViewState();
}

class _NewExpenseViewState extends State<NewExpenseView> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  Category _selectedCategory = Category.food;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid input"),
                content: const Text("Please make sure a valid title,amount,date and category was entered."),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Okay"))
                ],
              ));
      return;
    }
    widget.onAddExpense(ExpenseListModel(
      title: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
    ));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NewExpenseItems(
      enteredTitle: _titleController,
      enteredAmount: _amountController,
      submitData: _submitData,
      pickDate: _presentDatePicker,
      //
      //
      //
      //
      ////
      selectedCategory: DropdownButton(
        elevation: 3,
        borderRadius: BorderRadius.circular(10),
        value: _selectedCategory,
        items: Category.values
            .map((category) => DropdownMenuItem(
                value: category,
                child: Text(
                  category.name.toUpperCase(),
                )))
            .toList(),
        onChanged: (value) {
          if (value == null) {
            return;
          }
          setState(() {
            _selectedCategory = value;
          });
        },
      ),
      seltecedDate: _selectedDate,
    );
  }
}
