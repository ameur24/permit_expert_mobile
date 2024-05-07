import 'package:get/get.dart';
import 'package:test2/data/api/api_client.dart';
import 'package:get_storage/get_storage.dart';

import '../../contants.dart';
import '../../models/login_model.dart';
import '../repository/auth_repo.dart';

class AuthController extends GetxController {
  final AuthentificationRepo authRepo = AuthentificationRepo(
      apiClient: ApiClient(appBaseUrl:Constants.baseUrl));
  final box = GetStorage();

  Future<void> login(String email, String password) async {
    final loginRequest = LoginRequest(email: email, password: password);
    final response = await authRepo.login(loginRequest.toJson());

    if (response.statusCode == 200) {
      final token = response.body['token'];
      box.write('TOKEN', token);
      Get.offNamed('');
    } else {
      if (response.statusCode == 401) {
        print('Unauthorized');
      } else {
        print('Error: ${response.statusCode}');
      }    }
  }
}