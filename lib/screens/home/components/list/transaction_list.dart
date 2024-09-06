import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendly/data/transaction_data.dart';
import 'package:spendly/screens/home/components/list/list_tile_info.dart';
import 'package:spendly/screens/home/components/list/list_tile_title.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: transactionData.length,
        itemBuilder: (BuildContext context, int index) {
          final transaction = transactionData[index];
          // ListItem
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
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
                      title: transaction['name'],
                      icon: transaction['icon'],
                      color: transaction['color'],
                    ),

                    // ItemInfo
                    ListTileInfo(
                      moneySpent: transaction['cashSpent'],
                      spentTime: transaction['date'],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
