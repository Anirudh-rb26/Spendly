import 'package:flutter/material.dart';

class ListTileInfo extends StatelessWidget {
  final String moneySpent;
  final String spentTime;
  const ListTileInfo({
    super.key,
    required this.moneySpent,
    required this.spentTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          r"-$" + moneySpent,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          spentTime,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.outline,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
