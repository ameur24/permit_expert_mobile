import 'package:get/get.dart';
import '../controllers/transaction_controller.dart';
import '../repository/transaction_repo.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TransactionRepo(apiClient: Get.find()));
    Get.put(TransactionController(transactionRepo: Get.find()));
  }
}
