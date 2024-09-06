import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendly/constants/custom_gradient.dart';
import 'package:spendly/screens/add_expense/screens/add_expense_screen.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: customLinearGradient(context, 6),
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpense()),
          );
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
