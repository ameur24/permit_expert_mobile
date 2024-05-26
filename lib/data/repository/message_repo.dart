import 'package:get/get.dart';
import 'package:test2/data/api/api_client.dart';

class MessageRepo extends GetxService {
  final ApiClient apiClient;

  MessageRepo({required this.apiClient});

  Future<Response> postMessage(String message) async {
    final body = {"message_description": message};

    return await apiClient.postData("/api/message/storeForMobile", body);
  }
}
