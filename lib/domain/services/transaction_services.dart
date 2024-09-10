import 'package:spendly/data/models/transactions/transaction_model.dart';

abstract class TransactionServices {
  Future<void> addTransaction(TransactionModel transaction);
  Future<List<TransactionModel>> getTransactions();
}
