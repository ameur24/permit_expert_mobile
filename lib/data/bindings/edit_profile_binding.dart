import 'package:get/get.dart';
import '../controllers/edit_profile_controller.dart';
import '../repository/edit_repo.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put( EditProfileRepo (apiClient: Get.find()));
    Get.put(EditProfileController(editProfileRepo: Get.find()));
  }
}
