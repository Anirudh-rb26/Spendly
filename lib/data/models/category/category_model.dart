import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'category_model.g.dart';

@HiveType(typeId: 0)
class CategoryModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int iconCode; // Use int to store icon data

  CategoryModel({
    required this.name,
    required this.iconCode,
  });

  // Helper methods to convert icon and color to and from int
  IconData get icon => IconData(
        iconCode,
        fontFamily: 'MaterialIcons',
      );
}
