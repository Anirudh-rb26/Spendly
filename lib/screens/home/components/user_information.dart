import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // UserIcon
        GestureDetector(
          onTap: () {},
          child: Stack(
            alignment: Alignment.center,
            children: [
              // UserIcon Background
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow[700],
                ),
              ),

              // UserIcon Icon
              Icon(
                CupertinoIcons.person_fill,
                size: 35,
                color: Colors.yellow[800],
              ),
            ],
          ),
        ),

        // Gap
        const SizedBox(width: 10),

        // WelcomeText
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // WelcomeText
            Text(
              "Welcome",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
            // UserName
            Text(
              "Jhon Doe",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
