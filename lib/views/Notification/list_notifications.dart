import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/notification_controller.dart';
import '../../widgets/container/notificationContainer.dart';
import '../../models/notification_model.dart';
import '../../routes/routes_helper.dart';

class ListNotifications extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Notifications'.tr,
            style: TextStyle(fontSize: 19, fontFamily: 'Poppins'),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Get.toNamed(RouteHelper.profile);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (controller.notifications.isEmpty) {
          return _buildEmptyState();
        } else {
          return Container(
            padding: EdgeInsets.only(top: 35),
            child: ListView.separated(
              itemCount: controller.notifications.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10);
              },
              itemBuilder: (context, index) {
                NotificationModel notification = controller.notifications[index];
                return NotificationContainer(
                  title: notification.title,
                  subtitle: notification.subtitle,
                  date: notification.date,
                );
              },
            ),
          );
        }
      }),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset(
              'assets/images/notif.png',
              width: 347,
              height: 502,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Aucune_notification'.tr,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
