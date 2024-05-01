import 'package:get/get.dart';
import 'package:test2/data/Api/api_client.dart';

class NotificationRepo extends GetxService {
  final ApiClient apiClient;

  NotificationRepo({required this.apiClient});

  Future<Response> getNotificationList() async {
    return await apiClient.get("https://votre_nom_de_domaine/notifications/store");
  }
}
