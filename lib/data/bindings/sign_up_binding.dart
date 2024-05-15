import 'package:get/get.dart';
import '../controllers/signup_controller.dart';
import '../repository/sign_repo.dart';

//lOGIN CONTROLLERS ARE INITIALISED HERE
//TODO create new classes for each route and initialise it's controllers here
class SignUPBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignUPRepo(apiClient: Get.find()));
    Get.put(SignUpController(signRepo: Get.find()));
  }
}
