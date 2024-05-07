import 'package:get/get.dart';
import 'package:test2/data/Api/api_client.dart';

import '../data/controllers/notification_controller.dart';
import '../data/repository/auth_repo.dart';
import '../data/repository/notification_repo.dart';

Future<void> init()async {


Get.lazyPut(()=>AuthentificationRepo(apiClient: Get.find()));

Get.lazyPut(() => NotificationRepo(apiClient:Get.find()),fenix: true);
// controllers 

}