import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ColorList {
  blue('Blue', Color(0xFF42A5F5)),
  yellow('Orange', Color(0xFFFF7043)),
  purple('Purple', Color(0xFFAB47BC)),
  green('Green', Color(0xFF66BB6A)),
  pink('Pink', Color(0xFFEC407A)),
  red('Red', Color(0xFFEF5350)),
  brown('Brown', Color(0xFF8D6E63));

  const ColorList(this.label, this.color);
  final String label;
  final Color color;
}

// DropdownMenuEntry labels and values for the second dropdown menu.
enum IconList {
  shopping(
    'Shopping',
    Icon(
      CupertinoIcons.bag,
      color: Colors.grey,
    ),
  ),
  transport(
    'Transport',
    Icon(
      CupertinoIcons.bus,
      color: Colors.grey,
    ),
  ),
  rent(
    'Rent',
    Icon(
      CupertinoIcons.house,
      color: Colors.grey,
    ),
  ),
  phone(
    'Phone',
    Icon(
      CupertinoIcons.phone,
      color: Colors.grey,
    ),
  ),
  groceries(
    'Groceries',
    Icon(
      CupertinoIcons.shopping_cart,
      color: Colors.grey,
    ),
  ),
  insurance(
    'Insurance',
    Icon(
      CupertinoIcons.umbrella,
      color: Colors.grey,
    ),
  ),
  entertainment(
    'Entertainment',
    Icon(
      CupertinoIcons.tv,
      color: Colors.grey,
    ),
  ),
  travel(
    'Travel',
    Icon(
      CupertinoIcons.airplane,
      color: Colors.grey,
    ),
  ),
  books(
    'Books',
    Icon(
      CupertinoIcons.book,
      color: Colors.grey,
    ),
  ),
  work(
    'Work',
    Icon(
      CupertinoIcons.briefcase,
      color: Colors.grey,
    ),
  ),
  fitness(
    'Fitness',
    Icon(
      CupertinoIcons.heart,
      color: Colors.grey,
    ),
  );

  const IconList(this.label, this.icon);
  final String label;
  final Icon icon;
}
