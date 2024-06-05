import 'package:get/get.dart';
import '../controllers/learn_controller.dart';
import '../repository/learn_repo.dart';

class LearnBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LearnRepo(apiClient: Get.find()));
    Get.put(LearnController(learnRepo: Get.find()));
  }
}
