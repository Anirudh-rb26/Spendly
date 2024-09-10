import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendly/presentation/home_screen/components/home_card.dart';
import 'package:spendly/presentation/home_screen/components/list_components/transaction_list.dart';
import 'package:spendly/presentation/home_screen/components/user_information.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> cashflowTooltipKey = GlobalKey<TooltipState>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Username & Profile
                const UserInformation(),

                // SettingsIcon
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.settings,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),

            // Gap
            const SizedBox(height: 20),

            // CreditCard Design Element
            HomeCard(cashflowTooltipKey: cashflowTooltipKey),

            // Gap
            const SizedBox(height: 30),

            // Transactions
            // Title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),

            // Gap
            const SizedBox(height: 20),

            // TransactionList
            const TransactionList(),
          ],
        ),
      ),
    );
  }
}
