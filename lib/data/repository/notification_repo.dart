import 'package:get/get.dart';
import 'package:test2/data/api/api_client.dart';
import 'package:test2/models/notification_model.dart';

class NotificationRepo extends GetxService {
  final ApiClient apiClient;

  NotificationRepo({required this.apiClient});

  Future<List<NotificationModel>> getNotifications() async {
    try {
      final response = await apiClient.getData('/api/Notification/ShowNotificationsByReceptientId');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.body;
        List<NotificationModel> notifications = responseData.map((data) => NotificationModel.fromJson(data)).toList();
        return notifications;
      } else {
        throw Exception('Failed to fetch notifications: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch notifications: $e');
    }
  }
}
