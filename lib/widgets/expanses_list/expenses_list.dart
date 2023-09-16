import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expanses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
              background: Container(
                color: Theme.of(context).colorScheme.error.withAlpha(170),
                margin: Theme.of(context).cardTheme.margin,
                child: const Center(
                    child: Text(
                  "Delete!",
                  style: TextStyle(fontSize: 20),
                )),
              ),
              key: ValueKey(expenses[index]),
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              child: ExpenseItem(
                expense: expenses[index],
              ));
        });
  }
}
