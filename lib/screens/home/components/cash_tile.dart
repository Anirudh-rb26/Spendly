import 'dart:ui';

import 'package:flutter/material.dart';

class CashTile extends StatelessWidget {
  final String title;
  final String amount;
  final bool isCentered;
  final bool? isCashFlowIn;
  final IconData? icon;
  final TextStyle? titleStyle;
  final TextStyle? amountStyle;

  const CashTile({
    super.key,
    required this.title,
    required this.amount,
    required this.isCentered,
    this.isCashFlowIn,
    this.icon,
    this.titleStyle,
    this.amountStyle,
  });

  @override
  Widget build(BuildContext context) {
    // ArrowColor Changes for Down/Up
    final color = isCashFlowIn != null
        ? (isCashFlowIn! ? Colors.green : Colors.red)
        : Colors.white30;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Stack(
            children: [
              // GlassLayer
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
              ),

              // GlassEffect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              ),

              // Icon
              Icon(
                icon,
                color: color,
              ),
            ],
          ),
        ],

        // Gap
        const SizedBox(width: 10),

        // Income text column
        Column(
          crossAxisAlignment:
              isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            Text(
              r"$" + amount,
              style: amountStyle,
            ),
          ],
        ),
      ],
    );
  }
}
