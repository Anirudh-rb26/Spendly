import 'package:hive/hive.dart';
import 'package:spendly/data/models/transactions/transaction_model.dart';
import 'package:spendly/data/repositories/transaction/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  static const String _boxName = 'transactionBox';

  Future<Box<TransactionModel>> _getBox() async {
    return await Hive.openBox<TransactionModel>(_boxName);
  }

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    final box = await _getBox();
    await box.add(transaction);
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final box = await _getBox();
    return box.values.toList();
  }
}
