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

  Future<Response> acceptExamen(int examenId) async {
    return await apiClient.postData('/api/Examen/AccepterExamen/$examenId', {});
  }

  Future<Response> refuserExamen(int examenId) async {
     return  await apiClient.postData(
          '/api/Examen/RefuserExamen/$examenId', {});

  }

  Future<Response> acceptSeance(int seanceId) async {

     return await apiClient.putData(
          '/api/seance/AccepterSeance/$seanceId', {});
  }

  Future<Response> RefuserSeance(int seanceId) async {
    return await apiClient.putData('/api/seance/RefuserSeance/$seanceId', {});
  }
}