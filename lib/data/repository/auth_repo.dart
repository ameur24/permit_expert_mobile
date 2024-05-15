import 'package:get/get.dart';
import 'package:test2/data/api/api_client.dart';

class AuthentificationRepo extends GetxService {
  final ApiClient apiClient;

  AuthentificationRepo({required this.apiClient});





  Future<Response> login(Map body) async {
    return await apiClient.postData("/api/login", body);
  }

}
