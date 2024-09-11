import 'dart:async';

import 'package:hive/hive.dart';
import 'package:spendly/data/models/transactions/transaction_model.dart';
import 'package:spendly/data/repositories/transaction/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final StreamController<List<TransactionModel>> _controller = StreamController.broadcast();
  static const String _boxName = 'transactionBox';

  Future<Box<TransactionModel>> _getBox() async {
    return await Hive.openBox<TransactionModel>(_boxName);
  }

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    final box = await _getBox();
    await box.add(transaction);
    _updateTransaction();
  }

  @override
  Stream<List<TransactionModel>> getTransactionsStream() {
    _updateTransaction(); // Ensure the stream is updated with the current data
    return transactionStream; // Return the stream
  }

  Stream<List<TransactionModel>> get transactionStream => _controller.stream;

  void _updateTransaction() async {
    try {
      final box = await _getBox();
      final transactions = box.values.toList();
      _controller.add(transactions);
    } catch (e) {
      _controller.addError(e);
    }
  }
}
