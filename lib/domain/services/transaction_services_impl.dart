import 'package:spendly/data/models/transactions/transaction_model.dart';
import 'package:spendly/data/repositories/transaction/transaction_repository.dart';
import 'package:spendly/domain/services/transaction_services.dart';

class TransactionServiceImpl implements TransactionServices {
  final TransactionRepository _repository;

  TransactionServiceImpl(this._repository);

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    await _repository.addTransaction(transaction);
  }

  @override
  Stream<List<TransactionModel>> getTransactionsStream() {
    return _repository.getTransactionsStream();
  }
}
