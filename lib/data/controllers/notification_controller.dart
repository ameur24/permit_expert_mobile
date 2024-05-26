import 'package:get/get.dart';
import 'package:test2/data/repository/notification_repo.dart';
import 'package:test2/models/notification_model.dart';

class NotificationController extends GetxController {
  final NotificationRepo notificationRepo;

  NotificationController({required this.notificationRepo});

  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  void fetchNotifications() async {
    try {
      var fetchedNotifications = await notificationRepo.getNotifications();
      if (fetchedNotifications != null) {
        notifications.assignAll(fetchedNotifications);
      } else {
        print("Fetched notifications is null");
      }
    } catch (e) {
      print("Error fetching notifications: $e");
    }
  }

}
