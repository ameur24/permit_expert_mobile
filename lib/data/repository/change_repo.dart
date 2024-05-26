import 'package:get/get.dart';
import 'package:test2/data/api/api_client.dart';

class ChangePwdRepo extends GetxService {
  final ApiClient apiClient;

  ChangePwdRepo({required this.apiClient});

  Future<Response> changePassword(String oldPassword, String newPassword, String newPasswordConfirmation) async {
    final body = {
      'old_password': oldPassword,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation,
    };

    return await apiClient.putData('/api/ModifierPassword', body);
  }
}
