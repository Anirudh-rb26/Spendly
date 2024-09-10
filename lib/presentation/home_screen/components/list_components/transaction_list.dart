import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendly/data/repositories/transaction/transaction_repository_impl.dart';
import 'package:spendly/domain/services/transaction_services.dart'; // Import the service
import 'package:spendly/data/models/transactions/transaction_model.dart';
import 'package:spendly/domain/services/transaction_services_impl.dart';
import 'package:spendly/presentation/home_screen/components/list_components/list_tile_info.dart';
import 'package:spendly/presentation/home_screen/components/list_components/list_tile_title.dart';

// Define a map for icon name to IconData
final Map<String, IconData> iconNameToIconData = {
  'CupertinoIcons.bag': CupertinoIcons.bag,
  'CupertinoIcons.bus': CupertinoIcons.bus,
  'CupertinoIcons.house': CupertinoIcons.house,
  'CupertinoIcons.phone': CupertinoIcons.phone,
  'CupertinoIcons.shopping_cart': CupertinoIcons.shopping_cart,
  'CupertinoIcons.umbrella': CupertinoIcons.umbrella,
  'CupertinoIcons.tv': CupertinoIcons.tv,
  'CupertinoIcons.airplane': CupertinoIcons.airplane,
  'CupertinoIcons.book': CupertinoIcons.book,
  'CupertinoIcons.briefcase': CupertinoIcons.briefcase,
  'CupertinoIcons.heart': CupertinoIcons.heart,
};

final TransactionServices transactionService = TransactionServiceImpl(TransactionRepositoryImpl());

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TransactionModel>>(
      future: transactionService.getTransactions(), // Directly call getTransactions
      builder: (BuildContext context, AsyncSnapshot<List<TransactionModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Expanded(
            child: Center(
              child: Text(
                'Error: ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                "No transactions, add an expense to see your transaction history",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
          );
        }

        final transactions = snapshot.data!;

        return Expanded(
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, int index) {
              final transaction = transactions[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // AlertDialog Title
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Expense",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.xmark_circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),

                                // Gap
                                const SizedBox(height: 15),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: transaction.color,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        // CategoryName and CategoryIcon
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              iconNameToIconData[transaction.iconName] ?? CupertinoIcons.question_circle,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              transaction.title,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),

                                        // Gap
                                        const SizedBox(height: 15),

                                        // CashSpent and Date
                                        Text(
                                          r"$" + transaction.cashSpent,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        Text(
                                          transaction.date,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // ItemIcon
                          ListTileTitle(
                            title: transaction.title,
                            icon: iconNameToIconData[transaction.iconName] ?? CupertinoIcons.question_circle,
                            color: transaction.color,
                          ),

                          // ItemInfo
                          ListTileInfo(
                            moneySpent: transaction.cashSpent,
                            spentTime: transaction.date,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
