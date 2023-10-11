import 'package:expenses_track/data/expense_data_list.dart';
import 'package:expenses_track/model/expense_model.dart';
import 'package:expenses_track/view/new_expense_view.dart';
import 'package:expenses_track/widget/chart/chart.dart';
import 'package:expenses_track/widget/expense_list/expense_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AllExpenseList _allExpenseList = AllExpenseList();

  void _removeExpense(ExpenseListModel expenseListModel) {
    final expenseIndex = _allExpenseList.dummyList.indexOf(expenseListModel);

    setState(() {
      _allExpenseList.dummyList.remove(expenseListModel);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text(
        "Expense deleted.",
      ),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
          label: "undo",
          onPressed: () {
            setState(() {
              _allExpenseList.dummyList.insert(expenseIndex, expenseListModel);
            });
          }),
    ));
  }

  void _addExpenseTab() {
    showModalBottomSheet(
      constraints: const BoxConstraints(maxWidth: double.infinity),
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      builder: (ctx) => NewExpenseView(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(ExpenseListModel expenseListModel) {
    setState(() {
      _allExpenseList.dummyList.add(expenseListModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("Daily Expenses"),
          elevation: 3,
          actions: [IconButton(onPressed: _addExpenseTab, icon: const Icon(Icons.add))],
        ),
        body: SafeArea(
          child: _allExpenseList.dummyList.isEmpty
              ? const Center(
                  child: Text("No expenses found.try adding some."),
                )
              : Center(
                  child: width >= height
                      ? Row(
                          children: [
                            Expanded(
                              child: Chart(
                                expenses: _allExpenseList.dummyList,
                              ),
                            ),
                            Expanded(
                              child: ExpenseList(
                                expenseList: _allExpenseList.dummyList,
                                removeExpense: _removeExpense,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Chart(
                              expenses: _allExpenseList.dummyList,
                            ),
                            Expanded(
                              child: ExpenseList(
                                expenseList: _allExpenseList.dummyList,
                                removeExpense: _removeExpense,
                              ),
                            ),
                          ],
                        )),
        ));
  }
}
