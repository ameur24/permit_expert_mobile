import 'package:get/get.dart';
import '../api/api_client.dart';

class EditProfileRepo extends GetxService {
  final ApiClient apiClient;

  EditProfileRepo({required this.apiClient});

  Future<Response> getUserProfile() async {
    try {
      return await apiClient.postData('/api/showProfile', {});
    } catch (e) {
      print('Error fetching user profile: $e');
      return Response(statusCode: 500, statusText: 'Server Error');
    }
  }

  Future<Response> updateProfile({
    required String userImage,
    required String userName,
    required String dateNaissance,
    required String numTel,
    required String email,
  }) async {
    final body = {
      'user_image': userImage,
      'user_name': userName,
      'dateNaissance': dateNaissance,
      'numTel': numTel,
      'email': email,
    };

    try {
      return await apiClient.postData('/api/updateProfile', body);
    } catch (e) {
      print('Error updating profile: $e');
      return Response(statusCode: 500, statusText: 'Server Error');
    }
  }
}
