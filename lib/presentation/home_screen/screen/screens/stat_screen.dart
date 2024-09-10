import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:spendly/constants/custom_gradient.dart';
import 'package:spendly/presentation/home_screen/components/list_components/transaction_list.dart';
import 'package:spendly/presentation/stat_screen/components/transactions_barchart.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PageTitle
            const Text(
              "Transactions",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // ChartContainer
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              child: BarChart(
                transactionsBarchart(
                  customLinearGradient(context, 40),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Transactionlist Headers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Expenses this week",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),

            // TransactionList
            const TransactionList()
          ],
        ),
      ),
    );
  }
}
