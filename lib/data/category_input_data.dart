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
enum CategoryList {
  shopping(
    'Shopping',
    Icon(
      CupertinoIcons.bag,
      color: Colors.grey,
    ),
    "CupertinoIcons.bag",
  ),
  transport(
    'Transport',
    Icon(
      CupertinoIcons.bus,
      color: Colors.grey,
    ),
    "CupertinoIcons.bus",
  ),
  rent(
    'Rent',
    Icon(
      CupertinoIcons.house,
      color: Colors.grey,
    ),
    "CupertinoIcons.house",
  ),
  phone(
    'Phone',
    Icon(
      CupertinoIcons.phone,
      color: Colors.grey,
    ),
    "CupertinoIcons.phone",
  ),
  groceries(
    'Groceries',
    Icon(
      CupertinoIcons.shopping_cart,
      color: Colors.grey,
    ),
    "CupertinoIcons.shopping_cart",
  ),
  insurance(
    'Insurance',
    Icon(
      CupertinoIcons.umbrella,
      color: Colors.grey,
    ),
    "CupertinoIcons.umbrella",
  ),
  entertainment(
    'Entertainment',
    Icon(
      CupertinoIcons.tv,
      color: Colors.grey,
    ),
    "CupertinoIcons.tv",
  ),
  travel(
    'Travel',
    Icon(
      CupertinoIcons.airplane,
      color: Colors.grey,
    ),
    "CupertinoIcons.airplane",
  ),
  books(
    'Books',
    Icon(
      CupertinoIcons.book,
      color: Colors.grey,
    ),
    "CupertinoIcons.book",
  ),
  work(
    'Work',
    Icon(
      CupertinoIcons.briefcase,
      color: Colors.grey,
    ),
    "CupertinoIcons.briefcase",
  ),
  fitness(
    'Fitness',
    Icon(
      CupertinoIcons.heart,
      color: Colors.grey,
    ),
    "CupertinoIcons.heart",
  );

  const CategoryList(
    this.label,
    this.icon,
    this.iconName,
  );

  final String label;
  final Icon icon;
  final String iconName;
}
