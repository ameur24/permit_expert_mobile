import 'package:get/get.dart';
import 'package:test2/contants.dart';
import 'package:test2/data/api/api_client.dart';

import '../data/repository/notification_repo.dart';

Future<void> init() async {
//TODO YOU SHOULD INITIALIZE THE API CLIENT WHEN THE APP STARTS
  Get.lazyPut(() => ApiClient(appBaseUrl: Constants.baseUrl));

// USE BINDING FOR THE REST
}
