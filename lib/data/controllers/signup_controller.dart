import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test2/views/sign_up/codeV%C3%A9rifMDP.dart';

import '../../routes/routes_helper.dart';
import '../repository/sign_repo.dart';

class SignUpController extends GetxController {
  final SignUPRepo signRepo;
  var emailError = ''.obs;
  var codeError = ''.obs;
  var checkEmailError = ''.obs;




  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController = TextEditingController();

  bool loading = false;

  late final TextEditingController c1;
  late final TextEditingController c2;
  late final TextEditingController c3;
  late final TextEditingController c4;
  late final List<TextEditingController> textEditingCtrls;
  SignUpController({required this.signRepo}){
    c1 = TextEditingController();
    c2 = TextEditingController();
    c3 = TextEditingController();
    c4 = TextEditingController();
    textEditingCtrls = [c1, c2, c3, c4];
  }

  onDispose() {
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }
  Future<void> checkEmail(String email) async {
    loading = true;

    update();
    try {
      Response response = await signRepo.ckeckEmail(email);
      if (response.statusCode == 200) {
        emailError.value = 'Votre email est correcte';

        var responseBody = response.body;
        print(responseBody);
        print('Votre email est valide');
        Get.toNamed(RouteHelper.checkCode);
      } else {
        if (response.statusCode == 404) {
          emailError.value = 'Veuillez vérifier votre email';

          print("L'e-mail n'a pas été trouvé.");
        } else if(response.statusCode == 400) {
          emailError.value = "l'émail a déja un mot de passe";
        }else{
          print("Une erreur s'est produite lors de la vérification de l'e-mail.");
        }
      }
    } catch (e) {
      print('Une erreur s\'est produite lors de la vérification de l\'e-mail : $e');
    }
    loading = false;
    update();
  }
  Future<void> checkEmailForPassword(String email) async {
    loading = true;
    update();
    try {
      Response response = await signRepo.checkEmailForPassword(email);
      if (response.statusCode == 200) {
        checkEmailError.value = 'Votre email est correcte';
        var responseBody = response.body;
        print(responseBody);
        Get.to(VerificationMDP());
     // Get.toNamed(RouteHelper.checkPwd);
      } else {
        if (response.statusCode == 404) {
          checkEmailError.value = 'Veuillez vérifier votre email';
          print("L'e-mail n'a pas été trouvé.");
        } else if(response.statusCode == 400) {
          checkEmailError.value = "ce émail n' a pas encore un mot de passe.";

          print("ce émail n' a pas encore un mot de passe.");
        }
      }
    } catch (e) {
      checkEmailError.value = "Une erreur s\'est produite lors de la vérification de l\'e-mail.";

      print('Une erreur s\'est produite lors de la vérification de l\'e-mail : $e');
    }
    loading = false;
    update();
  }

  Future<void> verifyCode( String email, String code) async {
    loading = true;
    update();
    try {
      Response response = await signRepo.verifyCode( email,code);
      if (response.statusCode == 200) {
        var responseBody = response.body;
        print(responseBody);
        codeError.value = 'Le code de vérification est correcte';
        print('Le code de vérification est correct.');
        Get.toNamed(RouteHelper.signUp);
      } else if(response.statusCode == 400){
        codeError.value = "Le code de vérification n'est pas correcte";
      } else {
        print("Une erreur s'est produite lors de la vérification du code");
      }
    } catch (e) {
      print('Une erreur s\'est produite lors de la vérification du code : $e');
      // Handle error
    }
    loading = false;
    update();
  }
  Future<void> verifyCodePwd( String email, String code) async {
    loading = true;
    update();
    try {
      Response response = await signRepo.verifyCode(email,code);
      if (response.statusCode == 200) {
        var responseBody = response.body;
        print(responseBody);
        codeError.value = 'Le code de vérification est correcte';
        print('Le code de vérification est correct.');
        Get.toNamed(RouteHelper.resetMdp);
      } else if(response.statusCode == 400){
        codeError.value = "Le code de vérification n'est pas correcte";
      } else {
        print("Une erreur s'est produite lors de la vérification du code");
      }
    } catch (e) {
      print('Une erreur s\'est produite lors de la vérification du code : $e');
      // Handle error
    }
    loading = false;
    update();
  }
  Future<void> register(String username, String phone, String password,
      String confirmPassword) async {

  }
  Future<void> updateProfile(String email,String username, String phone, String password, String confirmPassword) async {
    try {
      Response response = await signRepo.updateProfile(
        email,
        username,
        password,
        confirmPassword,
        phone,
      );
      if (response.statusCode == 200) {
        print("Informations de l'utilisateur mises à jour avec succès");
            Get.toNamed(RouteHelper.signIn);
      } else {
        print("Une erreur s'est produite lors de la mise à jour du profil");
      }
    } catch (e) {
      print('Une erreur s\'est produite lors de la mise à jour du profil : $e');
    }
  }

  Future<void> updatePassword(String email, String password, String confirmPassword) async {
    try {
      Response response = await signRepo.updatePassword(email, password, confirmPassword);
      if (response.statusCode == 200) {

        print("Profile updated successfully");
        Get.toNamed(RouteHelper.signIn);
      } else {
        print("Failed to update profile: ${response.statusText}");
      }
    } catch (e) {
      print("Error updating profile: $e");
    }
  }

}