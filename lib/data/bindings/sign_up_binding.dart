import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import '../repository/sign_repo.dart';


class SignUPBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUPRepo(apiClient: Get.find()));
    Get.put(SignUpController(signRepo: Get.find()));
  }
}
