import 'package:get/get.dart';
import '../controllers/change_pwd_controller.dart';
import '../repository/change_repo.dart';

class ChangeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put( ChangePwdRepo(apiClient: Get.find()));
    Get.put(ChangePwdController(changeRepo: Get.find()));
  }
}
