import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../models/login_model.dart';
import '../repository/auth_repo.dart';

class AuthController extends GetxController {
  final AuthentificationRepo authRepo;
  final box = GetStorage();
  AuthController({required this.authRepo});

  Future<void> login(String email, String password) async {
    final loginRequest = LoginRequest(email: email, password: password);
    final response = await authRepo.login(loginRequest.toJson());
    print('response ${response.body}');
    if (response.statusCode == 200) {
      final token = response.body['token'];
      box.write('TOKEN', token);
      Get.offNamed('');
    } else {
      if (response.statusCode == 401) {
        print('Unauthorized');
      } else {
        print('Error: ${response.statusCode}');
      }
    }
  }
}
