import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileTitle extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color color;
  const ListTileTitle({
    super.key,
    required this.title,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),

        // Gap
        const SizedBox(width: 20),

        // ItemName
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
