import 'package:get/get.dart';
import '../controllers/message_controller.dart';
import '../repository/message_repo.dart';

class MessageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MessageRepo(apiClient: Get.find()));
    Get.put(MessageController(messageRepo: Get.find()));
  }
}
