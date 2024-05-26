import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/routes/routes_helper.dart';
import '../repository/change_repo.dart';

class ChangePwdController extends GetxController {
  final ChangePwdRepo changeRepo;

  ChangePwdController({required this.changeRepo});

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<void> changePassword() async {
    final oldPassword = oldPasswordController.text.trim();
    final newPassword = newPasswordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (newPassword != confirmPassword) {
      Get.snackbar('Erreur', 'Les nouveaux mots de passe ne correspondent pas');
      return;
    }

    Response response = await changeRepo.changePassword(oldPassword, newPassword, confirmPassword);

    if (response.statusCode == 200) {
      Get.snackbar('Succès', response.body['message']);
      Get.toNamed(RouteHelper.parameter);
    } else {
      Get.snackbar('Erreur', 'Échec de la modification du mot de passe');
    }
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
