import 'package:get/get.dart';
import 'package:test2/data/api/api_client.dart';

class SignUPRepo extends GetxService {
  final ApiClient apiClient;

  SignUPRepo({required this.apiClient});





  Future<Response> ckeckEmail(String email) async {

    return await apiClient.getData("/api/checkEmail/$email" );
  }
  Future<Response> checkEmailForPassword(String email) async {

    return await apiClient.getData("/api/checkEmailForPassword/$email" );
  }
  Future<Response> verifyCode(String email, String code) async {
    return await apiClient.getData("/api/verifyCode/$email/$code");
  }
  Future<Response> verifyCodePwd(String email, String code) async {
    return await apiClient.getData("/api/verifyCode/$email/$code");
  }
  Future<Response> updateProfile(String email, String userName, String password, String confirmPassword, String numTel) async {
    try {
      Map<String, dynamic> body = {
        "user_name": userName,
        "password": password,
        "password_confirmation": confirmPassword,
        "numTel": numTel
      };
      Response response = await apiClient.putData("/api/updateProfile/$email", body);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> updatePassword(String email, String password, String confirmPassword) async {
    try {
      Map<String, dynamic> body = {
        "password": password,
        "password_confirmation": confirmPassword,
      };
      Response response = await apiClient.putData("/api/updatePassword/$email", body);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }


}
