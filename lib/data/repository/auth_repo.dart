import 'package:get/get.dart';
import 'package:test2/data/Api/api_client.dart';

class AuthentificationRepo extends GetxService {
  final ApiClient apiClient;

  AuthentificationRepo({required this.apiClient});

  Future<Response> auth(Map data) async {
    return await apiClient.postData("api/login",data);
  }
}
