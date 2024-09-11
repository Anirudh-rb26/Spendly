import 'package:spendly/data/models/transactions/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addTransaction(TransactionModel transaction);
  Stream<List<TransactionModel>> getTransactionsStream();
}
