import 'package:get/get.dart';
import 'package:test2/data/api/api_client.dart';
import 'package:test2/models/transaction_model.dart';

class TransactionRepo extends GetxService {
  final ApiClient apiClient;

  TransactionRepo({required this.apiClient});

  Future<List<TransactionModel>> getTransactions() async {
    final response = await apiClient.getData('/api/transaction/showTransactionForMoniteurAndCandidat');
    if (response.statusCode == 200) {
      List<dynamic> jsonData = response.body;
      if (jsonData.isNotEmpty) {
        return jsonData.map<TransactionModel>((transaction) => TransactionModel.fromJson(transaction)).toList();
      }
    }
    return [];
  }
}
