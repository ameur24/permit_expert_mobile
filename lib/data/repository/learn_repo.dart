import 'package:get/get.dart';
import 'package:test2/data/api/api_client.dart';

class LearnRepo extends GetxService {
  final ApiClient apiClient;

  LearnRepo({required this.apiClient});

  Future<Response> getResources() async {
    return await apiClient.getData("/api/ressourceeducative/index");
  }
  Future<Response> getResources1() async {
    return await apiClient.getData("/api/ressourceeducative/indexx");
  }
}
