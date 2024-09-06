import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendly/screens/add_expense/components/expense_inputfields.dart';

class AddExpense extends StatelessWidget {
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(CupertinoIcons.chevron_back),
          backgroundColor: Theme.of(context).colorScheme.surface,
          centerTitle: true,
          title: const Text(
            "Add Expense",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: ExpenseInputFields(
                expenseController: _expenseController,
                categoryController: _categoryController,
                noteController: _noteController,
                dateController: _dateController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
