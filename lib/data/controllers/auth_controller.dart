import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test2/routes/routes_helper.dart';

import '../../models/login_model.dart';
import '../../utils/utils.dart';
import '../api/api_client.dart'as a;
import '../repository/auth_repo.dart';

class AuthController extends GetxController {
  final AuthentificationRepo authRepo;
  final box = GetStorage();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;

  AuthController({required this.authRepo});

  @override
  onDispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future<void> login(String email, String password) async {
    loading = true;
    update();

    try {
      final loginRequest = LoginRequest(email: email, password: password);
      final response = await authRepo.login(loginRequest.toJson());

      if (response != null) {
        print('response ${response.body}');
        if (response.statusCode == 200) {
          print("200");
          final token = response.body['access_token'];
          print('token : $token');

            userRole =
          response.body['role'] == 'moniteur' ? Roles.moniteur : Roles.candidat;

          box.write('TOKEN', token);
          Get.find<a.ApiClient>().updateHeader(token);
          Get.offNamed(RouteHelper.home);
        } else {
          Get.snackbar('Erreur', 'Verifier vos cordonnées',

          );
          if (response.statusCode == 401) {
            print('Unauthorized');
          } else {
            print('Error: ${response.statusCode}');
          }
        }
      } else {
        print('Server error: Response is null');
      }
    } catch (e) {
      print('Exception during login: $e');
    }

    loading = false;
    update();
  }
}