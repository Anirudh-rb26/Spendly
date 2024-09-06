import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spendly/components/info_tooltip.dart';
import 'package:spendly/constants/custom_gradient.dart';
import 'package:spendly/screens/home/components/cash_tile.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.cashflowTooltipKey,
  });

  final GlobalKey<TooltipState> cashflowTooltipKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width / 2,
      // color: Colors.amber,
      decoration: customLinearGradient(context, 4),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InfoTooltip(tooltipKey: cashflowTooltipKey),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Balance
              CashTile(
                isCentered: true,
                title: "Total Balance",
                titleStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                amount: "7,686",
                amountStyle: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // MoneyFlow Overview
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CashTile(
                    title: "Cash In",
                    titleStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    amount: "10,000",
                    amountStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    isCentered: false,
                    icon: CupertinoIcons.arrow_up,
                    isCashFlowIn: true,
                  ),
                  CashTile(
                    title: "Cash Out",
                    titleStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    amount: "2,314",
                    amountStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    isCentered: false,
                    icon: CupertinoIcons.arrow_down,
                    isCashFlowIn: false,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
