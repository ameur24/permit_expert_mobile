import 'package:get/get.dart';
import 'package:test2/data/repository/transaction_repo.dart';
import 'package:test2/models/transaction_model.dart';

class TransactionController extends GetxController {
  final TransactionRepo transactionRepo;

  TransactionController({required this.transactionRepo});

  var transactions = <TransactionModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  void fetchTransactions() async {
    isLoading.value = true;
    try {
      var fetchedTransactions = await transactionRepo.getTransactions();
      transactions.value = fetchedTransactions;
    } finally {
      isLoading.value = false;
    }
  }

  double calculateTotalDebits() {
    return transactions
        .where((transaction) => transaction.typeTransaction == 'flux sortant')
        .fold(0, (sum, transaction) => sum + transaction.montantT);
  }

  double calculateTotalCredits() {
    return transactions
        .where((transaction) => transaction.typeTransaction == 'flux entrant')
        .fold(0, (sum, transaction) => sum + transaction.montantT);
  }

  double calculateTotalBalanceMoniteur() {
    double totalDebits = calculateTotalDebits();
    double totalCredits = calculateTotalCredits();
    return totalDebits - totalCredits;
  }

  double calculateTotalBalanceCandidat() {
    double totalDebits = calculateTotalDebits();
    double totalCredits = calculateTotalCredits();
    return totalCredits - totalDebits;
  }
}
