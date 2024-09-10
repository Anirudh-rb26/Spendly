import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spendly/app.dart';
import 'package:spendly/data/models/category/category_model.dart';
import 'package:spendly/data/models/transactions/transaction_model.dart';

void main() async {
  await Hive.initFlutter();

  // Regsistering TypeAdapters for Hive
  Hive.registerAdapter(TransactionModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());

  runApp(const MyApp());
}
