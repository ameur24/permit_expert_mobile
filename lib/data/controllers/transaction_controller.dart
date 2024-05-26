import 'package:get/get.dart';
import 'package:test2/data/repository/transaction_repo.dart';
import 'package:test2/models/transaction_model.dart';

class TransactionController extends GetxController {
  final TransactionRepo transactionRepo;

  TransactionController({required this.transactionRepo});

  var transactions = <TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  void fetchTransactions() async {
    var fetchedTransactions = await transactionRepo.getTransactions();
    transactions.value = fetchedTransactions;
  }
}
