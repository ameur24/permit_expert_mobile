import 'package:get/get.dart';
import 'package:test2/data/api/api_client.dart';

class CalendarRepo extends GetxService {
  final ApiClient apiClient;

  CalendarRepo({required this.apiClient});

  Future<Response> fetchSeancesForDate(String date) async {
    return await apiClient.getData('/api/seance/showSeancesAndExams /$date');
  }
  Future<Response> fetchEvents() async {
    return await apiClient.getData('/api/seance/indexForMobile');
  }
  Future<String> acceptExamen(int examenId) async {
    try {
      final response = await apiClient.postData('/api/Examen/AccepterExamen/$examenId', {});
      if (response.statusCode == 200) {
        final responseData = response.body;
        return responseData['message'];
      } else {
        throw Exception('Failed to accept examen');
      }
    } catch (e) {
      throw Exception('Failed to accept examen: $e');
    }
  }
  Future<String> refuserExamen(int examenId) async {
    try {
      final response = await apiClient.postData('/api/Examen/RefuserExamen/$examenId', {});
      if (response.statusCode == 200) {
        final responseData = response.body;
        return responseData['message'];
      } else {
        throw Exception('Failed to refuse examen');
      }
    } catch (e) {
      throw Exception('Failed to refuse examen: $e');
    }
  }
  Future<String> acceptSeance(int seanceId) async {
    try {
      final response = await apiClient.putData('/api/seance/AccepterSeance/$seanceId', {});
      if (response.statusCode == 200) {
        final responseData = response.body;
        return responseData['message'];
      } else {
        throw Exception('Failed to accept seance');
      }
    } catch (e) {
      throw Exception('Failed to accept seance: $e');
    }
  }
  Future<String> RefuserSeance(int seanceId) async {
    try {
      final response = await apiClient.putData('/api/seance/AccepterSeance/$seanceId', {});
      if (response.statusCode == 200) {
        final responseData = response.body;
        return responseData['message'];
      } else {
        throw Exception('Failed to refuse seance');
      }
    } catch (e) {
      throw Exception('Failed to refuse  seance: $e');
    }
  }
}
