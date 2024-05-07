import 'package:get/get.dart';
import 'package:test2/data/controllers/auth_controller.dart';
import 'package:test2/data/repository/auth_repo.dart';

//lOGIN CONTROLLERS ARE INITIALISED HERE
//TODO create new classes for each route and initialise it's controllers here
class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthentificationRepo(apiClient: Get.find()));
    Get.put(AuthController(authRepo: Get.find()));
  }
}
