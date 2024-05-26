import 'package:get/get.dart';
import '../controllers/notification_controller.dart';
import '../repository/notification_repo.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NotificationRepo(apiClient: Get.find()));
    Get.put(NotificationController(notificationRepo: Get.find()));
  }
}
