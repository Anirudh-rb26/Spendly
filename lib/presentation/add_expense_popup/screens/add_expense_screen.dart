import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendly/data/category_input_data.dart';
import 'package:spendly/data/models/transactions/transaction_model.dart';
import 'package:spendly/data/repositories/transaction/transaction_repository_impl.dart';
import 'package:spendly/domain/services/transaction_services.dart';
import 'package:spendly/domain/services/transaction_services_impl.dart';
import 'package:spendly/presentation/add_expense_popup/components/expense_inputfields.dart';
import 'package:spendly/presentation/add_expense_popup/components/gradient_savebutton.dart';

final TransactionServices transactionServices = TransactionServiceImpl(TransactionRepositoryImpl());

class AddExpense extends StatefulWidget {
  AddExpense({
    super.key,
  });

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final TextEditingController _expenseController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _categoryColorController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _newCategoryController = TextEditingController();

  CategoryList? _selectedIcon;
  ColorList? _selectedColor;

  void _handleSelectionChange(CategoryList? icon, ColorList? color) {
    setState(() {
      _selectedIcon = icon;
      _selectedColor = color;
    });
  }

  void saveAndPop(BuildContext context) async {
    debugPrint("inside func");
    String title = _noteController.text;
    debugPrint("title: " + title);
    String cashSpent = _expenseController.text;
    debugPrint("cashSpent: " + cashSpent);
    String date = _dateController.text;
    debugPrint("date: " + date);
    String iconName = _selectedIcon?.iconName ?? "CupertinoIcons.question";
    debugPrint("iconName: " + iconName);
    Color color = _selectedColor?.color ?? Colors.grey;

    TransactionModel transaction = TransactionModel(
      title: title,
      iconName: iconName,
      cashSpent: cashSpent,
      date: date,
      colorValue: color.value,
    );

    debugPrint("model created");

    await transactionServices.addTransaction(transaction);

    debugPrint("func done");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(CupertinoIcons.chevron_back),
          ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Add Expense Input Fields
                  ExpenseInputFields(
                    expenseController: _expenseController,
                    categoryController: _categoryController,
                    categoryColorController: _categoryColorController,
                    noteController: _noteController,
                    dateController: _dateController,
                    newCategoryController: _newCategoryController,
                    onSelectionChanged: _handleSelectionChange,
                  ),

                  // Gap
                  const SizedBox(height: 30),

                  // Save Expense Button
                  saveButton(
                    context,
                    "S A V E",
                    () {
                      debugPrint("button pressed");
                      saveAndPop(context);
                      debugPrint("func called pressed");
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
